
class guardar {
  int x, y, t;
  PImage botona;
  PImage botond;
  boolean selected;
  int numero;
  public guardar(int _x, int _y) {
    x=_x;
    y=_y;
    t=25;    
    selected=false;
    botona = loadImage("guara.jpg");
    botond = loadImage("guard.jpg");
  }
  void dibujar() {
    s.fill(255);
    if (s.mouseX>x&&s.mouseX<x+t&&s.mouseY>y&&s.mouseY<y+t||selected) {    
      s.image(botona, x, y);
      if (s.mousePressed) {
        selected=true;
      }
    }
    else {
      s.image(botond, x, y);
    }
    if (selected) {
      guardar();
      seleccionado(false);
    }
  }
  void guardar() {
    saveFrame();
  }
  void seleccionado(boolean valor) {
    selected=valor;
  }
}
class nuevo {
  int x, y, t;
  PImage botona;
  PImage botond;
  boolean selected;
  int numero;
  public nuevo(int _x, int _y) {
    x=_x;
    y=_y;
    t=25;    
    selected=false;
    botona = loadImage("nuevoa.jpg");
    botond = loadImage("nuevod.jpg");
  }
  void dibujar() {
    s.fill(255);
    if (s.mouseX>x&&s.mouseX<x+t&&s.mouseY>y&&s.mouseY<y+t||selected) {    
      s.image(botona, x, y);
      if (s.mousePressed) {
        selected=true;
      }
    }
    else {
      s.image(botond, x, y);
    }
    if (selected) {
      limpiar();
    }
  }
  void limpiar() {
    background(255);
    seleccionado(false);
  }
  void seleccionado(boolean valor) {
    selected=valor;
  }
}
class abrir {
  import javax.swing.*;   
  import javax.swing.filechooser.FileNameExtensionFilter;
  int x, y, t;
  PImage botona;
  PImage botond;
  boolean selected;
  int numero;
  public abrir(int _x, int _y) {
    x=_x;
    y=_y;
    t=25;    
    selected=false;
    botona = loadImage("cargara.jpg");
    botond = loadImage("cargard.jpg");
  }
  void dibujar() {
    s.fill(255);
    if (s.mouseX>x&&s.mouseX<x+t&&s.mouseY>y&&s.mouseY<y+t||selected) {    
      s.image(botona, x, y);
      if (s.mousePressed) {
        selected=true;
      }
    }
    else {
      s.image(botond, x, y);
    }
    if (selected) {
      cargar();
    }
  }
  void cargar() {
    try { 
      UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
    } 
    catch (Exception e) { 
      e.printStackTrace();
    } 

    final JFileChooser fc = new JFileChooser(); 

    FileNameExtensionFilter filtroImagen=new FileNameExtensionFilter("JPG, BMP, PNG & GIF", "jpg", "bmp", "png", "gif");
    fc.setFileFilter(filtroImagen);
    // in response to a button click: 
    int returnVal = fc.showOpenDialog(fram); 

    if (returnVal == JFileChooser.APPROVE_OPTION) { 
      File file = fc.getSelectedFile(); 
      if (file.getName().endsWith("jpg")) { 
        PImage img = loadImage(file.getPath()); 
        if (img != null) { 
          estado.grabar();
          image(img, 0, 0);
          selected=false;
        }
      } 
      else { 
        String lines[] = loadStrings(file); 
        for (int i = 0; i < lines.length; i++) { 
          println(lines[i]);
        }
      }
    }
    else selected=false;
  }
}

class bn {
  int x, y, t;
  PImage botona;
  PImage botond;
  boolean selected;
  int numero;
  public bn(int _x, int _y) {
    x=_x;
    y=_y;
    t=25;    
    selected=false;
    botona = loadImage("bna.jpg");
    botond = loadImage("bnd.jpg");
  }
  void dibujar() {
    s.fill(255);
    if (s.mouseX>x&&s.mouseX<x+t&&s.mouseY>y&&s.mouseY<y+t||selected) {    
      s.image(botona, x, y);
      if (s.mousePressed) {
        selected=true;
      }
    }
    else {
      s.image(botond, x, y);
    }
    if (selected) {
      limpiar();
    }
  }
  void limpiar() {
    estado.grabar();
    PImage img=estado.darEstado();
    
    for ( int i = 0; i < 400; i++ ){
      for ( int j = 0; j < 400; j++ )
      {

        color con=img.get(i, j);
        float rgbGris = ( red(con) + green(con) + blue(con) ) / 3;
        strokeWeight(1);
        stroke(rgbGris);
        point(i,j);
        //fill(rgbGris);
        //ellipse(i,j,1,1);
      }
    }
    strokeWeight(strokpeso);
    stroke(borde);
      estado.grabar();
    seleccionado(false);
  }
  void seleccionado(boolean valor) {
    selected=valor;
  }
}

class azr {
  int x, y, t;
  PImage botona;
  PImage botond;
  boolean selected;
  int numero;
  public azr(int _x, int _y) {
    x=_x;
    y=_y;
    t=25;    
    selected=false;
    botona = loadImage("dota.jpg");
    botond = loadImage("dotd.jpg");
  }
  void dibujar() {
    s.fill(255);
    if (s.mouseX>x&&s.mouseX<x+t&&s.mouseY>y&&s.mouseY<y+t||selected) {    
      s.image(botona, x, y);
      if (s.mousePressed) {
        selected=true;
      }
    }
    else {
      s.image(botond, x, y);
    }
    if (selected) {
      limpiar();
      seleccionado(false);
    }
  }
  void limpiar() {
    int tam=(strokpeso<1?1:strokpeso);
    for(int ex=0;ex<200/tam+tam;ex++){
     for(int ey=0;ey<200/tam+tam;ey++){
      stroke(random(255),random(255),random(255),transp);
      //strokeWeight(strokpeso);
      ellipse(ex*tam*2,ey*tam*2,tam,tam);
     } 
    }
    estado.grabar();
  }
  void seleccionado(boolean valor) {
    selected=valor;
  }
}

