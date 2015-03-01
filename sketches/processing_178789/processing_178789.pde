
/*import peasy.test.*;
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;
*/
import java.util.Calendar;

float x, y, z;

float t1=0;
float t2=0;

int p, q, r;

BoxGrid bg;
//PeasyCam camera;

void setup() {
  size(800, 800, P3D);
  //size(1920, 1080, P3D);
  //camera = new PeasyCam(this, width/2, height/2, 0, 100);
  ///camera.setYawRotationMode();
  
  background(0);
  stroke(255);
  strokeWeight(3);
  smooth();

  bg=new BoxGrid(450, 8, 12); // length of cube side, component per axis, size of components
}

void draw() {

  background(0);
  //fill(0, 16);
  //noStroke();
  //rect(0,0,width, height);
  
  //lights();  
  //int concentration = 1;
  //spotLight(255, 255, 0, 1000, height/2, 50, -1, 0, 0, PI/8, concentration);
  //spotLight(255, 0, 0, 800, height/2, 50, 1, 0, 0, PI/8, concentration);

  pushMatrix();
  translate(width/2, height/2, 500);
  rotateX(map(mouseY, 0, height, 0, PI));
  
  rotateY(map(mouseX, 0, width, 0, PI));
  
  //t1+=0.001;
  t2+=0.001;
  //rotateX(t1);
  rotateY(t2);
  
  bg.display();

  popMatrix();
  //camera.rotateY(0.001);
}

void keyReleased() {  
  if (key == 's' || key == 'S') saveFrame(timestamp()+"_####.png");
}

void keyPressed() {
  if ( key == CODED ) {
    if ( keyCode == LEFT ) {
      println("LEFT");
    }
    if ( keyCode == RIGHT ) {
      println("RIGHT");
    }
    if ( keyCode == UP ) {
      println("UP");
    }
    if ( keyCode == DOWN ) {
      println("DOWN");
    }
  }
}

// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}










class BoxGrid {
  int s;
//  float x,y,z;
  int nb; //density
  float step;
  int boxSize; // size of the components
    
  BoxGrid (int _size, int _nBoxes, int _boxSize) {
    s = _size;
    nb = _nBoxes; // how many pixels apart are the components
    boxSize = _boxSize;
  }
  
  void display() {
    int count=0;
    //fill(0,0,255);
    //noStroke();
    lights();
    int concentration=100;
    //spotLight(0, 255, 0, 1000, height/2, 50, -1, 0, 0, PI/8, concentration);
    //spotLight(255, 0, 0, -1000, height/2, 50, 1, 0, 0, PI/8, concentration);
    spotLight(0, 0, 255, -500, 0, 50, 1, 0, 0, PI/8, concentration);
    stroke(255);
    
    fill(255);
    //noFill();
//    sphere(15);
    //step = s/nb + boxSize/2; 
    step = s/(nb-1);

    for (float z=0; z<=s; z+=step) {
      for (float y=0; y<=s; y+=step) {
         for (float x=0; x<=s; x+=step) {


/*    for (float z=-s/2; z<s/2; z+=step) {
      for (float y=-s/2; y<s/2; y+=step) {
         for (float x=-s/2; x<s/2; x+=step) {
*/
           
            strokeWeight(0.5);
            stroke(255);
        
            //point(x,y,z);
            pushMatrix();
            //translate(x-nb/2*step,y-nb/2*step,z-nb/2*step);  //roughly right for odd numbers of boxes
            translate(x-s/2,y-s/2,z-s/2);
            
            
            //translate(s/2-x,s/2-y,s/2-z);
            //translate(x+boxSize,y+boxSize, z+boxSize);
            //translate(x,y, z);
            
            /*strokeWeight(5);            
            point(0,0,0);
            stroke(255);
            noFill();*/

            box(boxSize);
        
            popMatrix();
  
         }
      }
    }

/*pushMatrix();
translate(0,0,0);
stroke(255);
noFill();
box(200);
popMatrix();
*/
/*              pushMatrix();
              //translate(s/2,s/2,s/2);
              translate(s/2,s/2);
              sphere(s/4);
              popMatrix();
  */          
  } // display()
} // class BoxGrid



