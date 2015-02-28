
import processing.video.*;

Capture cam;

void setup() {
  size(640, 480);

  String[] cameras = Capture.list();

  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }

    // The camera can be initialized directly using an 
    // element from the array returned by list():
    cam = new Capture(this, cameras[0]);
    cam.start();
  }
}

void draw() {
  background (0);
  if (cam.available() == true) {
    cam.read();
  }
  //image(cam, 0, 0);

  for (int y=0;y<height; y+=20) {
    for (int x=0;x<width; x+=20) {
      // stroke(255);
      //line (x, 0, x, height);
      color px=cam.get(x, y);
      float br=brightness(px);
      //line(x,y, x+100,100+y);
      /*line(x,y, x+br,10+br);
       line(x,y, 10+br,y+br);
       fill(0);
       ellipse(br+10,y+br, 5, 5);
       ellipse(x+10,10+br, 5, 5);
       //line(y,x, y+10,10+x);
      noFill();
      noStroke();
      //line(x, y, x+10, y+10);
      //ellipse(x, y, br, br);
      fill(br, br);
      //rect (x, y, x-br, y-br);*/
      stroke(px);
      line (x-br, y-br, px, br);
      // line (x-br, y-br, br,y);
      //line (x-br, y-br, x, y+br);

      println(br);
      //line(width-x,height-y,0,br);
      //line(0,y,br,0);
    }
  }
  // The following does the same, and is faster when just drawing the image
  // without any additional resizing, transformations, or tint.
  //set(0, 0, cam);
}



