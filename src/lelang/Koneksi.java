/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lelang;

import java.sql.*;
import javax.swing.*;

/**
 *
 * @author Ridho Anggoro Naibaho
 *  - Hak Akses Administrator
	Username: admin
	Password: batagorenak
    - Hak Akses Petugas
        Username: petugas
        Password: batagorenak
    - Hak Akses Masyarakat/User
        Username: ridho
        Password: batagorenak
        * 
        * form pemilik barang
        * form transaksi lelang/pemenang keluar masuk barang
 */
public class Koneksi {
    public Connection con;
    public Statement stat;
    
    private static final String DATABASE_NAME = "lelang";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "5L!bpGzGCP5f0Ql/";
   
    public Koneksi(){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/"+DATABASE_NAME,USERNAME,PASSWORD);
            stat = con.createStatement();
        }catch(ClassNotFoundException | SQLException e){
            JOptionPane.showMessageDialog(null, e.getMessage());
            System.exit(0);
        }
    }
}
