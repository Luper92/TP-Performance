package unq.tpi.persistencia.performanceEj.daos

import java.util.List
import unq.tpi.persistencia.performanceEj.model.Department
import unq.tpi.persistencia.util.SessionManager

class DepartmentDAO {

	def getByName(String name) {
		val session = SessionManager.getSession()
		session.createQuery("from Department d where d.name = :name")
		// 		session.createQuery("from Department as d join fetch d.employees where d.name = :name") 
				.setParameter("name", name).uniqueResult() as Department
	}

	
	def getByCode(String num) {
		val session = SessionManager.getSession()
		session.get(Department, num) as Department
		//val query = session.createQuery("from Department as d where d.code = :code")
		//query.setString("code", num)
		//query.list.get(0) as Department
	}

	def getAll() {
		val session = SessionManager.getSession()
		//TODO
		//session.createCriteria(Department).list() as List<Department>
			session.createQuery("from Department").list() as List<Department>
				
	}
	
	def getByCodeEfficient(String num) {
		val session = SessionManager.getSession()
		session.createQuery(
		//FULLNAME; TITLE and SALARY
//"Select dep from Department dep inner join fetch dep.employees emp inner join fetch emp.salaries sal inner join fetch emp.titles tit where dep.code = :code  and sal.to = '9999-01-01'"
//"Select dep from Department dep join fetch dep.employees emp where dep.code = :code"
 			//"from Department dept join fetch dept.employees as e join fetch e.titles join fetch e.salaries as s where s.to = '9999-01-01' and dept.code = :code"
"from Department dept join fetch dept.employees as e join fetch e.titles join fetch e.salaries as s where  dept.code = :code and s.to = '9999-01-01'"
// Department -> Employees -> Title -> Salary
//Salary -> Employee -> Department

//Select dep from Department dep join fetch dep.employees emp join fetch emp.titles tit join fetch emp.salaries sal where dep.code = :code  

//"from Department dep where dep.code = :code  "
			 //Se utiliza la fecha indicada en los mappigs. de lo contrario busca tooda la informacion hasta encontrar el indicado.
			 		)
		.setParameter("code",num).uniqueResult() as Department
	}

}
