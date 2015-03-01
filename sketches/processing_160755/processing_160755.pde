
// Need G4P library
import g4p_controls.*;

MySQL msql;

public void setup(){
  size(720, 340, JAVA2D);
  background(255);
  createGUI();
  customGUI();
  // Place your setup code here
  
}

public void draw(){
  //swag
  
}

// Use this method to add additional statements
// to customise the GUI controls
public void customGUI(){

}
/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */
import de.bezier.data.sql.*;
import java.io.*;
import java.sql.*;
import java.util.*;
import java.awt.*;
import javax.imageio.ImageIO;


public void imgTogButton1_click1(GImageToggleButton source, GEvent event) { //_CODE_:imgTogButton1:980033:
  background(255);
  println("imgTogButton1 - GImageToggleButton event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:imgTogButton1:980033:

public void imgTogButton2_click1(GImageToggleButton source, GEvent event) { //_CODE_:imgTogButton2:963564:
  background(255);
  println("imgTogButton2 - GImageToggleButton event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:imgTogButton2:963564:

public void imgTogButton3_click1(GImageToggleButton source, GEvent event) { //_CODE_:imgTogButton3:452308:
  background(255);
  println("imgTogButton3 - GImageToggleButton event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:imgTogButton3:452308:

public void imgTogButton4_click1(GImageToggleButton source, GEvent event) { //_CODE_:imgTogButton4:294237:
  background(255);
  println("imgTogButton4 - GImageToggleButton event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:imgTogButton4:294237:

public void imgTogButton5_click1(GImageToggleButton source, GEvent event) { //_CODE_:imgTogButton5:848452:
  background(255);
  println("imgTogButton5 - GImageToggleButton event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:imgTogButton5:848452:

public void imgTogButton6_click1(GImageToggleButton source, GEvent event) { //_CODE_:imgTogButton6:525877:
  background(255);
  println("imgTogButton6 - GImageToggleButton event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:imgTogButton6:525877:

public void imgTogButton7_click1(GImageToggleButton source, GEvent event) { //_CODE_:imgTogButton7:793560:
  background(255);
  println("imgTogButton7 - GImageToggleButton event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:imgTogButton7:793560:

public void imgTogButton8_click1(GImageToggleButton source, GEvent event) { //_CODE_:imgTogButton8:793195:
  background(255);
  println("imgTogButton8 - GImageToggleButton event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:imgTogButton8:793195:

public void imgTogButton9_click1(GImageToggleButton source, GEvent event) { //_CODE_:imgTogButton9:978732:
  background(255);
  println("imgTogButton9 - GImageToggleButton event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:imgTogButton9:978732:

public void imgButton1_click1(GImageButton source, GEvent event) { //_CODE_:imgButton1:381335:
  background(255);
  println("imgButton1 - GImageButton event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:imgButton1:381335:

public void imgTogButton10_click1(GImageToggleButton source, GEvent event) { //_CODE_:imgTogButton10:983220:
  background(255);
  println("imgTogButton10 - GImageToggleButton event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:imgTogButton10:983220:

public void imgTogButton11_click1(GImageToggleButton source, GEvent event) { //_CODE_:imgTogButton11:365023:
  background(255);
  println("imgTogButton11 - GImageToggleButton event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:imgTogButton11:365023:

public void imgTogButton12_click1(GImageToggleButton source, GEvent event) { //_CODE_:imgTogButton12:748573:
  background(255);
  println("imgTogButton12 - GImageToggleButton event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:imgTogButton12:748573:

public void imgTogButton13_click1(GImageToggleButton source, GEvent event) { //_CODE_:imgTogButton13:590575:
  background(255);
  println("imgTogButton13 - GImageToggleButton event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:imgTogButton13:590575:

public void imgTogButton14_click1(GImageToggleButton source, GEvent event) { //_CODE_:imgTogButton14:828528:
  background(255);
  println("imgTogButton14 - GImageToggleButton event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:imgTogButton14:828528:

public void imgTogButton15_click1(GImageToggleButton source, GEvent event) { //_CODE_:imgTogButton15:926244:
  background(255);
  println("imgTogButton15 - GImageToggleButton event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:imgTogButton15:926244:

public void imgTogButton16_click1(GImageToggleButton source, GEvent event) { //_CODE_:imgTogButton16:260441:
  background(255);
  println("imgTogButton16 - GImageToggleButton event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:imgTogButton16:260441:

public void imgTogButton17_click1(GImageToggleButton source, GEvent event) { //_CODE_:imgTogButton17:340885:
  background(255);
  println("imgTogButton17 - GImageToggleButton event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:imgTogButton17:340885:

public void imgTogButton18_click1(GImageToggleButton source, GEvent event) { //_CODE_:imgTogButton18:770250:
  background(255);
  println("imgTogButton18 - GImageToggleButton event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:imgTogButton18:770250:

public void imgTogButton19_click1(GImageToggleButton source, GEvent event) { //_CODE_:imgTogButton19:708167:
  background(255);
  println("imgTogButton19 - GImageToggleButton event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:imgTogButton19:708167:

public void imgTogButton20_click1(GImageToggleButton source, GEvent event) { //_CODE_:imgTogButton20:246071:
  background(255);
  println("imgTogButton20 - GImageToggleButton event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:imgTogButton20:246071:

public void imgTogButton21_click1(GImageToggleButton source, GEvent event) { //_CODE_:imgTogButton21:365209:
  background(255);
  println("imgTogButton21 - GImageToggleButton event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:imgTogButton21:365209:

public void textfield1_change1(GTextField source, GEvent event) { //_CODE_:textfield1:771609:
  println("textfield1 - GTextField event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:textfield1:771609:

public void textfield2_change1(GTextField source, GEvent event) { //_CODE_:textfield2:768943:
  println("textfield2 - GTextField event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:textfield2:768943:

public void textfield3_change1(GTextField source, GEvent event) { //_CODE_:textfield3:517865:
  println("textfield3 - GTextField event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:textfield3:517865:

public void textfield4_change1(GTextField source, GEvent event) { //_CODE_:textfield4:483058:
  println("textfield4 - GTextField event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:textfield4:483058:

public void textfield5_change1(GTextField source, GEvent event) { //_CODE_:textfield5:775047:
  println("textfield5 - GTextField event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:textfield5:775047:

public void textfield6_change1(GTextField source, GEvent event) { //_CODE_:textfield6:840187:
  println("textfield6 - GTextField event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:textfield6:840187:

public void textfield7_change1(GTextField source, GEvent event) { //_CODE_:textfield7:483706:
  println("textfield7 - GTextField event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:textfield7:483706:

public void textfield8_change1(GTextField source, GEvent event) { //_CODE_:textfield8:492881:
  println("textfield8 - GTextField event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:textfield8:492881:

public void textfield9_change1(GTextField source, GEvent event) { //_CODE_:textfield9:536602:
  println("textfield9 - GTextField event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:textfield9:536602:

public void textfield10_change1(GTextField source, GEvent event) { //_CODE_:textfield10:678830:
  println("textfield10 - GTextField event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:textfield10:678830:

public void textfield11_change1(GTextField source, GEvent event) { //_CODE_:textfield11:959204:
  println("textfield11 - GTextField event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:textfield11:959204:

public void textfield12_change1(GTextField source, GEvent event) { //_CODE_:textfield12:211450:
  println("textfield12 - GTextField event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:textfield12:211450:

public void textfield13_change1(GTextField source, GEvent event) { //_CODE_:textfield13:871821:
  println("textfield13 - GTextField event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:textfield13:871821:

public void textfield14_change1(GTextField source, GEvent event) { //_CODE_:textfield14:359091:
  println("textfield14 - GTextField event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:textfield14:359091:

public void textfield15_change1(GTextField source, GEvent event) { //_CODE_:textfield15:365903:
  println("textfield15 - GTextField event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:textfield15:365903:

public void textfield16_change1(GTextField source, GEvent event) { //_CODE_:textfield16:218758:
  println("textfield16 - GTextField event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:textfield16:218758:

public void textfield17_change1(GTextField source, GEvent event) { //_CODE_:textfield17:254317:
  println("textfield17 - GTextField event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:textfield17:254317:

public void textfield18_change1(GTextField source, GEvent event) { //_CODE_:textfield18:525772:
  println("textfield18 - GTextField event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:textfield18:525772:

public void textfield19_change1(GTextField source, GEvent event) { //_CODE_:textfield19:961864:
  println("textfield19 - GTextField event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:textfield19:961864:

public void textfield20_change1(GTextField source, GEvent event) { //_CODE_:textfield20:332312:
  println("textfield20 - GTextField event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:textfield20:332312:

public void textfield21_change1(GTextField source, GEvent event) { //_CODE_:textfield21:808133:
  println("textfield21 - GTextField event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:textfield21:808133:

public void textfield22_change1(GTextField source, GEvent event) { //_CODE_:textfield22:881243:
  println("textfield22 - GTextField event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:textfield22:881243:

public void textfield23_change1(GTextField source, GEvent event) { //_CODE_:textfield23:290040:
  println("textfield23 - GTextField event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:textfield23:290040:

public void textfield24_change1(GTextField source, GEvent event) { //_CODE_:textfield24:856391:
  println("textfield24 - GTextField event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:textfield24:856391:

public void textfield25_change1(GTextField source, GEvent event) { //_CODE_:textfield25:570856:
  println("textfield25 - GTextField event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:textfield25:570856:

public void textfield26_change1(GTextField source, GEvent event) { //_CODE_:textfield26:504924:
  println("textfield26 - GTextField event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:textfield26:504924:

public void textfield27_change1(GTextField source, GEvent event) { //_CODE_:textfield27:382689:
  println("textfield27 - GTextField event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:textfield27:382689:

public void textfield28_change1(GTextField source, GEvent event) { //_CODE_:textfield28:980017:
  println("textfield28 - GTextField event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:textfield28:980017:

public void textfield29_change1(GTextField source, GEvent event) { //_CODE_:textfield29:490541:
  println("textfield29 - GTextField event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:textfield29:490541:

public void textfield30_change1(GTextField source, GEvent event) { //_CODE_:textfield30:893004:
  println("textfield30 - GTextField event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:textfield30:893004:

public void textfield31_change1(GTextField source, GEvent event) { //_CODE_:textfield31:507362:
  println("textfield31 - GTextField event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:textfield31:507362:

public void textfield32_change1(GTextField source, GEvent event) { //_CODE_:textfield32:629391:
  println("textfield32 - GTextField event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:textfield32:629391:

public void textfield33_change1(GTextField source, GEvent event) { //_CODE_:textfield33:990613:
  println("textfield33 - GTextField event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:textfield33:990613:

public void textfield34_change1(GTextField source, GEvent event) { //_CODE_:textfield34:914961:
  println("textfield34 - GTextField event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:textfield34:914961:

public void button1_click1(GButton source, GEvent event) throws Exception, IOException, SQLException { //_CODE_:button1:689079:
  println("button1 - GButton event occured " + System.currentTimeMillis()%10000000 );
  String D = "data/NombreImagen.jpg";
   saveFrame(D);
   PImage image = loadImage(D);
  Class.forName("org.gjt.mm.mysql.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/tester", "kicho", "polopolo");
    String INSERT_PICTURE = "insert into imagen(nombre, imagen) values (?, ?)";

    FileInputStream fis = null;
    PreparedStatement ps = null;
    try {
      conn.setAutoCommit(false);
      File file = new File(dataPath("NombreImagen.jpg"));
      fis = new FileInputStream(file);
      ps = conn.prepareStatement(INSERT_PICTURE);
      ps.setString(1, "name");
      ps.setBinaryStream(2, fis, (int) file.length());
      ps.executeUpdate();
      conn.commit();
    } finally {
      ps.close();
      fis.close();
    }
} //_CODE_:button1:689079:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setCursor(ARROW);
  if(frame != null)
    frame.setTitle("Sketch Window");
  imgTogButton1 = new GImageToggleButton(this, 3, 18, "abuelo_f.png", 4, 1);
  imgTogButton1.addEventHandler(this, "imgTogButton1_click1");
  imgTogButton2 = new GImageToggleButton(this, 26, 17, "relaciones_abuelos2.png", 1, 4);
  imgTogButton2.addEventHandler(this, "imgTogButton2_click1");
  imgTogButton3 = new GImageToggleButton(this, 285, 17, "abuelo_h.png", 4, 1);
  imgTogButton3.addEventHandler(this, "imgTogButton3_click1");
  imgTogButton4 = new GImageToggleButton(this, 350, 17, "abuelo_f.png", 4, 1);
  imgTogButton4.addEventHandler(this, "imgTogButton4_click1");
  imgTogButton5 = new GImageToggleButton(this, 632, 18, "abuelo_h.png", 4, 1);
  imgTogButton5.addEventHandler(this, "imgTogButton5_click1");
  imgTogButton6 = new GImageToggleButton(this, 373, 18, "relaciones_abuelos2.png", 1, 4);
  imgTogButton6.addEventHandler(this, "imgTogButton6_click1");
  imgTogButton7 = new GImageToggleButton(this, 142, 68, "abuelo_f.png", 4, 1);
  imgTogButton7.addEventHandler(this, "imgTogButton7_click1");
  imgTogButton8 = new GImageToggleButton(this, 491, 69, "abuelo_h.png", "abuelo_h.png", 4, 1);
  imgTogButton8.addEventHandler(this, "imgTogButton8_click1");
  imgTogButton9 = new GImageToggleButton(this, 163, 67, "relaciones_abuelos.png", 1, 4);
  imgTogButton9.addEventHandler(this, "imgTogButton9_click1");
  imgButton1 = new GImageButton(this, 138, 121, new String[] { "relacion_hermanos.png", "relacion_hermanos.png", "relacion_hermanos.png" } );
  imgButton1.addEventHandler(this, "imgButton1_click1");
  imgTogButton10 = new GImageToggleButton(this, 312, 192, "index.png", 2, 1);
  imgTogButton10.addEventHandler(this, "imgTogButton10_click1");
  imgTogButton11 = new GImageToggleButton(this, 497, 152, "hijo_h.png", 7, 1);
  imgTogButton11.addEventHandler(this, "imgTogButton11_click1");
  imgTogButton12 = new GImageToggleButton(this, 396, 151, "hijo_h.png", 7, 1);
  imgTogButton12.addEventHandler(this, "imgTogButton12_click1");
  imgTogButton13 = new GImageToggleButton(this, 220, 157, "hijo_m.png", 7, 1);
  imgTogButton13.addEventHandler(this, "imgTogButton13_click1");
  imgTogButton14 = new GImageToggleButton(this, 124, 156, "hijo_m.png", 7, 1);
  imgTogButton14.addEventHandler(this, "imgTogButton14_click1");
  imgTogButton15 = new GImageToggleButton(this, 280, 201, "rel_indx.png", 1, 5);
  imgTogButton15.addEventHandler(this, "imgTogButton15_click1");
  imgTogButton16 = new GImageToggleButton(this, 439, 192, "relacion_index.png", 5, 1);
  imgTogButton16.addEventHandler(this, "imgTogButton16_click1");
  imgTogButton17 = new GImageToggleButton(this, 277, 281, "hijo_h.png", 7, 1);
  imgTogButton17.addEventHandler(this, "imgTogButton17_click1");
  imgTogButton18 = new GImageToggleButton(this, 336, 281, "hijo_h.png", 7, 1);
  imgTogButton18.addEventHandler(this, "imgTogButton18_click1");
  imgTogButton19 = new GImageToggleButton(this, 394, 281, "hijo_h.png", 7, 1);
  imgTogButton19.addEventHandler(this, "imgTogButton19_click1");
  imgTogButton20 = new GImageToggleButton(this, 457, 283, "hijo_m.png", 7, 1);
  imgTogButton20.addEventHandler(this, "imgTogButton20_click1");
  imgTogButton21 = new GImageToggleButton(this, 515, 283, "hijo_m.png", 7, 1);
  imgTogButton21.addEventHandler(this, "imgTogButton21_click1");
  textfield1 = new GTextField(this, 401, 160, 26, 17, G4P.SCROLLBARS_NONE);
  textfield1.setOpaque(true);
  textfield1.addEventHandler(this, "textfield1_change1");
  textfield2 = new GTextField(this, 10, 27, 24, 17, G4P.SCROLLBARS_NONE);
  textfield2.setOpaque(true);
  textfield2.addEventHandler(this, "textfield2_change1");
  textfield3 = new GTextField(this, 292, 27, 25, 18, G4P.SCROLLBARS_NONE);
  textfield3.setOpaque(true);
  textfield3.addEventHandler(this, "textfield3_change1");
  textfield4 = new GTextField(this, 150, 77, 24, 17, G4P.SCROLLBARS_NONE);
  textfield4.setOpaque(true);
  textfield4.addEventHandler(this, "textfield4_change1");
  textfield5 = new GTextField(this, 358, 26, 23, 17, G4P.SCROLLBARS_NONE);
  textfield5.setOpaque(true);
  textfield5.addEventHandler(this, "textfield5_change1");
  textfield6 = new GTextField(this, 640, 28, 24, 16, G4P.SCROLLBARS_NONE);
  textfield6.setOpaque(true);
  textfield6.addEventHandler(this, "textfield6_change1");
  textfield7 = new GTextField(this, 499, 78, 25, 16, G4P.SCROLLBARS_NONE);
  textfield7.setOpaque(true);
  textfield7.addEventHandler(this, "textfield7_change1");
  textfield8 = new GTextField(this, 130, 164, 24, 17, G4P.SCROLLBARS_NONE);
  textfield8.setOpaque(true);
  textfield8.addEventHandler(this, "textfield8_change1");
  textfield9 = new GTextField(this, 227, 164, 22, 17, G4P.SCROLLBARS_NONE);
  textfield9.setOpaque(true);
  textfield9.addEventHandler(this, "textfield9_change1");
  textfield10 = new GTextField(this, 502, 161, 23, 16, G4P.SCROLLBARS_NONE);
  textfield10.setOpaque(true);
  textfield10.addEventHandler(this, "textfield10_change1");
  textfield11 = new GTextField(this, 325, 203, 29, 17, G4P.SCROLLBARS_NONE);
  textfield11.setOpaque(true);
  textfield11.addEventHandler(this, "textfield11_change1");
  textfield12 = new GTextField(this, 447, 200, 20, 15, G4P.SCROLLBARS_NONE);
  textfield12.setOpaque(true);
  textfield12.addEventHandler(this, "textfield12_change1");
  textfield13 = new GTextField(this, 283, 290, 30, 16, G4P.SCROLLBARS_NONE);
  textfield13.setOpaque(true);
  textfield13.addEventHandler(this, "textfield13_change1");
  textfield14 = new GTextField(this, 342, 290, 28, 15, G4P.SCROLLBARS_NONE);
  textfield14.setOpaque(true);
  textfield14.addEventHandler(this, "textfield14_change1");
  textfield15 = new GTextField(this, 401, 289, 25, 17, G4P.SCROLLBARS_NONE);
  textfield15.setOpaque(true);
  textfield15.addEventHandler(this, "textfield15_change1");
  textfield16 = new GTextField(this, 464, 290, 24, 17, G4P.SCROLLBARS_NONE);
  textfield16.setOpaque(true);
  textfield16.addEventHandler(this, "textfield16_change1");
  textfield17 = new GTextField(this, 522, 293, 22, 17, G4P.SCROLLBARS_NONE);
  textfield17.setOpaque(true);
  textfield17.addEventHandler(this, "textfield17_change1");
  textfield18 = new GTextField(this, 10, 54, 64, 19, G4P.SCROLLBARS_NONE);
  textfield18.setOpaque(true);
  textfield18.addEventHandler(this, "textfield18_change1");
  textfield19 = new GTextField(this, 245, 53, 78, 19, G4P.SCROLLBARS_NONE);
  textfield19.setOpaque(true);
  textfield19.addEventHandler(this, "textfield19_change1");
  textfield20 = new GTextField(this, 353, 51, 70, 19, G4P.SCROLLBARS_NONE);
  textfield20.setOpaque(true);
  textfield20.addEventHandler(this, "textfield20_change1");
  textfield21 = new GTextField(this, 377, 186, 67, 17, G4P.SCROLLBARS_NONE);
  textfield21.setOpaque(true);
  textfield21.addEventHandler(this, "textfield21_change1");
  textfield22 = new GTextField(this, 529, 317, 70, 18, G4P.SCROLLBARS_NONE);
  textfield22.setOpaque(true);
  textfield22.addEventHandler(this, "textfield22_change1");
  textfield23 = new GTextField(this, 455, 317, 69, 19, G4P.SCROLLBARS_NONE);
  textfield23.setOpaque(true);
  textfield23.addEventHandler(this, "textfield23_change1");
  textfield24 = new GTextField(this, 383, 315, 67, 19, G4P.SCROLLBARS_NONE);
  textfield24.setOpaque(true);
  textfield24.addEventHandler(this, "textfield24_change1");
  textfield25 = new GTextField(this, 312, 313, 65, 19, G4P.SCROLLBARS_NONE);
  textfield25.setOpaque(true);
  textfield25.addEventHandler(this, "textfield25_change1");
  textfield26 = new GTextField(this, 237, 314, 69, 18, G4P.SCROLLBARS_NONE);
  textfield26.setOpaque(true);
  textfield26.addEventHandler(this, "textfield26_change1");
  textfield27 = new GTextField(this, 418, 229, 89, 19, G4P.SCROLLBARS_NONE);
  textfield27.setOpaque(true);
  textfield27.addEventHandler(this, "textfield27_change1");
  textfield28 = new GTextField(this, 288, 233, 87, 18, G4P.SCROLLBARS_NONE);
  textfield28.setOpaque(true);
  textfield28.addEventHandler(this, "textfield28_change1");
  textfield29 = new GTextField(this, 198, 191, 82, 17, G4P.SCROLLBARS_NONE);
  textfield29.setOpaque(true);
  textfield29.addEventHandler(this, "textfield29_change1");
  textfield30 = new GTextField(this, 112, 191, 72, 18, G4P.SCROLLBARS_NONE);
  textfield30.setOpaque(true);
  textfield30.addEventHandler(this, "textfield30_change1");
  textfield31 = new GTextField(this, 482, 187, 80, 16, G4P.SCROLLBARS_NONE);
  textfield31.setOpaque(true);
  textfield31.addEventHandler(this, "textfield31_change1");
  textfield32 = new GTextField(this, 474, 103, 75, 16, G4P.SCROLLBARS_NONE);
  textfield32.setOpaque(true);
  textfield32.addEventHandler(this, "textfield32_change1");
  textfield33 = new GTextField(this, 125, 102, 79, 18, G4P.SCROLLBARS_NONE);
  textfield33.setOpaque(true);
  textfield33.addEventHandler(this, "textfield33_change1");
  textfield34 = new GTextField(this, 625, 54, 69, 16, G4P.SCROLLBARS_NONE);
  textfield34.setOpaque(true);
  textfield34.addEventHandler(this, "textfield34_change1");
  button1 = new GButton(this, 48, 265, 80, 30);
  button1.setText("Guardar");
  button1.addEventHandler(this, "button1_click1");
}

// Variable declarations 
// autogenerated do not edit
GImageToggleButton imgTogButton1; 
GImageToggleButton imgTogButton2; 
GImageToggleButton imgTogButton3; 
GImageToggleButton imgTogButton4; 
GImageToggleButton imgTogButton5; 
GImageToggleButton imgTogButton6; 
GImageToggleButton imgTogButton7; 
GImageToggleButton imgTogButton8; 
GImageToggleButton imgTogButton9; 
GImageButton imgButton1; 
GImageToggleButton imgTogButton10; 
GImageToggleButton imgTogButton11; 
GImageToggleButton imgTogButton12; 
GImageToggleButton imgTogButton13; 
GImageToggleButton imgTogButton14; 
GImageToggleButton imgTogButton15; 
GImageToggleButton imgTogButton16; 
GImageToggleButton imgTogButton17; 
GImageToggleButton imgTogButton18; 
GImageToggleButton imgTogButton19; 
GImageToggleButton imgTogButton20; 
GImageToggleButton imgTogButton21; 
GTextField textfield1; 
GTextField textfield2; 
GTextField textfield3; 
GTextField textfield4; 
GTextField textfield5; 
GTextField textfield6; 
GTextField textfield7; 
GTextField textfield8; 
GTextField textfield9; 
GTextField textfield10; 
GTextField textfield11; 
GTextField textfield12; 
GTextField textfield13; 
GTextField textfield14; 
GTextField textfield15; 
GTextField textfield16; 
GTextField textfield17; 
GTextField textfield18; 
GTextField textfield19; 
GTextField textfield20; 
GTextField textfield21; 
GTextField textfield22; 
GTextField textfield23; 
GTextField textfield24; 
GTextField textfield25; 
GTextField textfield26; 
GTextField textfield27; 
GTextField textfield28; 
GTextField textfield29; 
GTextField textfield30; 
GTextField textfield31; 
GTextField textfield32; 
GTextField textfield33; 
GTextField textfield34; 
GButton button1; 



