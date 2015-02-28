
import ddf.minim.Minim;
public void setup() {
  size(1000, 600);
  App.app=this;
  App.g=this.g;
  ellipseMode(CORNER);  
  noSmooth();
  App.music = new Minim(this);
  //S T A R T  H E R E
  XMLInput xi=new XMLInput("<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>"+
    "<game>"+
    "<battlefield edge=\"on\" > </battlefield>"+
    "<background   name=\"background\"  image=\"space1.jpg\"  >"+
    "</background>"+
       "<image name=\"gorilla2\" file=\"rock.gif\"  ww=\"64\" hh=\"64\"></image>"+
    "<actor name=\"xenemy\" type=\"shape\"  kind=\"image\" file=\"gorilla2\" vx=\"2\" vy=\"1\" points=\"10\" selector=\"110\">"+
    "</actor>"+
    "<bullet name=\"xbullet\" type=\"shape\" kind=\"line\" life=\"160\" ww=\"4\" hh=\"2\" selector=\"100\" speed=\"4\" color=\"green\">"+
    "</bullet>"+
   "<image name=\"gorilla\" file=\"spaceST.png\" ww=\"64\" hh=\"50\" ></image>"+
    "<actor name=\"hero\" type=\"shape\" kind=\"image\" file=\"gorilla\" xx=\"50\" yy=\"50\" selector=\"10\"  color=\"green\" speed=\"8\" event=\"key\" event=\"click\" vx=\"0\" vy=\"0\" >"+
    "</actor>"+
    "<sound name=\"sound1\" file=\"explo.mp3\" > </sound>"+
    "<timer name=\"tim\" type=\"timer\" times=\"xenemy:9:0:\">"+
    "</timer>"+
    "<text xx=\"800\" yy=\"50\" color=\"white\" size=\"24\" format=\"Score:%5.2g#\"></text>"+
    "</game>");
  //S T O P  H E R E
  if (App.field.background==null) App.field.background=new Background("");
}
public void draw() { 
  App.field.display();
}
public void stop() {
  if (App.player!=null) App.player.close();
  App.music.stop();
  super.stop();
}
public void mouseDragged() {
  Iterator<IMouse> im = App.field.drag.iterator();
  for (;im.hasNext();) {
    IMouse d=im.next();
    if (d.event(IMouse.DRAG, mouseX, mouseY)) im.remove();
  }
}
public void mouseClicked() {
  Iterator<IMouse> im = App.field.click.iterator();
  for (;im.hasNext();) {
    IMouse d=im.next();
    if (d.event(IMouse.CLICK, mouseX, mouseY)) im.remove();
  }
}
public void keyPressed() {
  Iterator<IKey> im = App.field.keys.iterator();
  for (;im.hasNext();) {
    IKey d=im.next();
    if (key==CODED?d.event(keyCode+200):d.event(key)) im.remove();
  }
}


