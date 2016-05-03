package unq.tpi.persistencia.performanceEj.daos;

import org.junit.Assert
import org.junit.Test
import unq.tpi.persistencia.performanceEj.daos.DepartmentDAO
import unq.tpi.persistencia.util.SessionManager
import java.util.Comparator

class DepartmentDAOTest {

	@Test
	def void testFields() throws Exception {
		SessionManager.runInSession([
			val d = new DepartmentDAO().getByName("Finance");		
			Assert.assertNotNull(d);
			Assert.assertEquals("d002", d.code);
			Assert.assertEquals(12437, d.employees.length);
			Assert.assertEquals(4909, d.historicEmployees.length);
			return null;
		])
	}
}
