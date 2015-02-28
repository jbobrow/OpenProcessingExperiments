
class DisplayInfo {

  PFont f;
  float x;
  float y;
  float[] campos;
  float[] camrot;


  DisplayInfo(float x, float y) {

    this.x = x;
    this.y = y;

    f = loadFont("EurostileBold-16.vlw");
  }

  void show() {

    campos = cam.getPosition();
    camrot = cam.getRotations();

    textFont(f,16);

    fill(255);

    text("FPS = "+int(frameRate),x,y);
    text("Camera Position, X = "+campos[0]+" Y = "+campos[1]+" Z = "+campos[2],x,y+20);
    text("Camera Rotation, X = "+camrot[0]+" Y = "+camrot[1]+" Z = "+campos[2],x,y+40);
    text("Colour = "+colour,x,y+60);
    text("Lines = "+lines,x,y+80);
    
    
    
  }
}





