package unq.tpi.persistencia.performanceEj.daos

import java.util.List
import unq.tpi.persistencia.performanceEj.model.Department
import unq.tpi.persistencia.util.SessionManager

class DepartmentDAO {

	def getByName(String name) {
		val session = SessionManager.getSession()
		session.createQuery("from Department where name = :name")
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
	
	def geyByCodeEfficient(String num) {
		val session = SessionManager.getSession()
		session.createQuery(
		
"from Department dep join fetch dep.employees emp join fetch emp.titles tit join fetch emp.salaries sal where dep.code = :code  and sal.to = '9999-01-01'"
			 //Se utiliza la fecha indicada en los mappigs. de lo contrario busca tooda la informacion hasta encontrar el indicado.
			 		)
		.setParameter("code",num).uniqueResult() as Department
	}

}
