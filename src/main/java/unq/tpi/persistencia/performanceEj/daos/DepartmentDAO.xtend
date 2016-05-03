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
                "from Department dept left outer join fetch dept.employees as e left outer join fetch e.titles left outer join fetch e.salaries as s where  dept.code = :code and s.to = '9999-01-01'"

        )
        .setParameter("code",num).uniqueResult() as Department
    }

}
