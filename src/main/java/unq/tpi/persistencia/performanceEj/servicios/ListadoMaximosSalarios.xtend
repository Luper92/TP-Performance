package unq.tpi.persistencia.performanceEj.servicios

import java.util.Comparator
import unq.tpi.persistencia.performanceEj.daos.EmployeeDAO
import unq.tpi.persistencia.performanceEj.model.Employee
import unq.tpi.persistencia.util.SessionManager
import java.util.List

class ListadoMaximosSalarios extends AbstractListado {

	new(String fileName) {
		super(fileName)
	}
	
	
	/******                  Este código es viejo y es muy poco eficiente 			********/
/*
	override def doListado() throws Exception {
		// Trae todos los empleados y los ordena descendientemente por sueldo
		val empleados = new EmployeeDAO().getAll()
		empleados.sort(new Comparator<Employee>() {
			override def compare(Employee o1, Employee o2) {
				o2.salary.compareTo(o1.salary)
			}
		})

		// Imprime el sueldo de los 10 primeros empleados en la coleccion		
		addColumn("Nombre").addColumn("Sueldo").newLine()
		(0..9).forEach[
			val e = empleados.get(it)
			addColumn(e.fullName).addColumn(e.salary).newLine()
		]
	}
	
	 */

	override def doListado() throws Exception {
		
		//Trae SOLAMENTE los 10 primeros empleados con máximos salarios y luego los imprime 
		
		val empleados = new EmployeeDAO().firstTenEmployees()
		    
		 
		
		// Imprime el sueldo de los 10 primeros empleados en la coleccion		
		addColumn("Nombre").addColumn("Sueldo").newLine()
		(0..9).forEach[
			val e = empleados.get(it)
			addColumn(e.fullName).addColumn(e.salary).newLine()
		]
	}
	
	
}
