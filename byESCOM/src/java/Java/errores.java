package Java;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author MedinaVilla
 */
public class errores {

    Statement s = null;
    ResultSet rs = null;
    private PreparedStatement ps = null;
    private final database db = new database();

    public ResultSet getReportesErrores() throws SQLException {
        db.conectar();
        String query = ("select * from reporte;");
        rs = db.consulta(query);
        return rs;
    }

    public String imprimirTituloError(String idReporte, String submodulo, String explicacion, String metodo, String fechaEnvio) {
        db.conectar();

        String error;
        error = "<ul class='menu-list'>"
                + "<li><a onClick='showReporteDetails" + "(" + '"' + idReporte + '"' + "," + '"' + submodulo + '"' + "," + '"' + explicacion + '"' + "," + '"' + metodo + '"' + "," + '"' + fechaEnvio + '"' + ")'>" + submodulo + "</a></li>"
                + "</ul>";

        return error;

    }

    public void deleteReporte(int idReporte) throws SQLException {
        db.conectar();
        PreparedStatement ps;
        String query = ("delete from reporte where idReporte = ?;");
        ps = db.getC().prepareStatement(query);
        ps.setInt(1, idReporte);
        ps.executeUpdate();
        s = db.getC().createStatement();
        db.cierraConexion();
        System.out.println("Registro eliminado!");

    }

    public void registrarReporte(String submodulo, String explicacion, String metodo) throws SQLException {
        db.conectar();
        PreparedStatement ps;
        String queryReport = ("insert into reporte(submodulo,explicacion,metodo)values(?,?,?);");

        ps = db.getC().prepareStatement(queryReport);
        ps.setString(1, submodulo);
        ps.setString(2, explicacion);
        ps.setString(3, metodo);
        ps.executeUpdate();

        s = db.getC().createStatement();
        db.cierraConexion();
    }
}
