
import ddf.minim.Minim;
public void setup() {
  size(1000, 1000);
  App.app=this;
  App.g=this.g;
  ellipseMode(CORNER);
  noSmooth();
  System.out.println(sketchPath(""));
  App.music = new Minim(this);
  //S T A R T  H E R E
  XMLInput xi=new XMLInput("<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>"+
    "<game>"+
    "<battlefield> </battlefield>"+
    "<background name=\"background\" image=\"dunkin.jpg\" >"+
    "</background>"+
    "<image name=\"shoes\" file=\"sperry.png\" ></image>"+
    "<image name=\"face\" file=\"bruce.gif\" ></image>"+
    "<image name=\"donut\" file=\"donut.gif\" ></image>"+
    "<actor name=\"xenemy\" type=\"shape\" kind=\"image\" file=\"shoes\" vx=\"3\" vy=\"2\" selector=\"110\">"+
    "</actor>"+
    "<bullet name=\"xbullet\" type=\"shape\" kind=\"image\" file=\"donut\" life=\"160\" ww=\"20\" hh=\"4\" selector=\"100\" speed=\"10\" color=\"pink\">"+
    "</bullet>"+
    "<actor name=\"hero\" type=\"shape\" kind=\"image\" file=\"face\" xx=\"450\" yy=\"650\" ww=\"20\" selector=\"10\"  event=\"key\" color=\"green\" speed=\"30\" event=\"click\" vx=\"0\" vy=\"0\" >"+
    "</actor>"+
    "<sound name=\"sound1\" file=\"belk.wav\" > </sound>"+
    "<sound name=\"sound4\" file=\"04.wav\" > </sound>"+
    "<timer name=\"tim\" type=\"timer\" times=\"xenemy:20:0:\">"+
    "</timer>"+
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


