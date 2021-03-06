package unq.tpi.persistencia.performanceEj.servicios

import unq.tpi.persistencia.performanceEj.daos.DepartmentDAO
import java.util.List
import unq.tpi.persistencia.performanceEj.model.Employee

class ListadoPagosPorDepto extends AbstractListado {

	String num

	new(String fileName, String num) {
		super(fileName)
		this.num = num
	}

	override def doListado() throws Exception {
//		val depto = new DepartmentDAO().getByCode(this.num)
		val depto = new DepartmentDAO().getByCodeEfficient(this.num)

		newLine()
		addColumn("Total").addColumn(depto.totalSalaries).newLine()
		newLine()
		
		addColumn("Nombre").addColumn("Titulo").addColumn("Monto").newLine()
        depto.employees.forEach[
            addColumn(it.fullName)
            addColumn(it.title)
            addColumn(it.salary)
            newLine()
        ]

	}
	
}
