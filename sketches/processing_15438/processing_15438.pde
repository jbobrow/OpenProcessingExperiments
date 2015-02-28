
import peasy.*;

PeasyCam cam;

// random data used to start
int [] data;


void setup() {
  
  size (900, 900,P3D);
  //rectMode(CENTER);
  
  
  // create an instance of our camera 
   // first argument is the distance of the object
   cam = new PeasyCam(this, 5000);
   
   // set the view port distance (how close/far we can see objects)
   cam.setMinimumDistance(50);
   cam.setMaximumDistance(10000);

  //Load text file as a string
  String[] info = loadStrings ("Data.txt");

  data = int(split(info[0],','));
}


// data.txt to determine bar length and color
void draw() {
  translate (-10,-10);
  background (100);
  
   
   draw3Dsphere();
   
}

void draw3Dsphere() {
   
  noStroke ();

  smooth ();
  lights();
  for (int i = 0; i < data.length; i++) {
    //fill (data [i], 255, 255);
     translate (158,200, data [i]);
     sphere (data [i]);
     //(i*40,0,40,data [i]);
     //translate (400, 400);
     //sphere (data [i]);
    //translate(width/2, height/2);
     //rotate((frameCount)*PI/3.0);
    rotateY(radians(frameCount)*PI/3);
    rotateZ(radians(frameCount)*PI);
    
  }
 
}



