
import javax.media.opengl.*;
import processing.opengl.*;
import lll.Loc.*;
// Would appreciate help in clarifying the geometric control and rotation
class Accelometer
{
  PFont font = loadFont("font12.vlw"); 
  PFont font22 = loadFont("font22.vlw"); 

  String shape;
  int maxsize;
  int xsize;
  int ysize;
  int zsize;
  color fillcolor = color(0,0,0,102);
  String debugMsgLn1;
  String debugMsgLn2;
  
  float averageroll; // used to normalize movements
  float averagey;

  
  Accelometer()
  {      
  }

  // the initialization routine for the class.  see other file: "wiicube = new Accelometer("cube");"
  Accelometer(String s)
  {
    shape = s;
    if (height < width)
      maxsize = height;
    else 
      maxsize = width;
  }

  // this gets called every FRAMERATE/60 seconds
  void draw()
  {
    if (shape == "cube")
      cube();
    else if (shape == "ball")
      ball();
  }

  void cube() {
      zsize = maxsize/2;
      xsize = maxsize/6;
      ysize = maxsize/6; 

    fill(fillcolor);
    box(xsize, ysize, zsize);    
    textFont(font22); 
    fill(0,0,0,102);
    text("top",-10,-(ysize/2)-8,-zsize/2);

  }
  
  void ball() {
    fill(fillcolor);
    textFont(font22); 
    fill(0,0,0,102);
    text("top",-10,-(maxsize/PI)-8,0);
    sphere(maxsize/(PI));  
  }
  

  void setXYZ(float x, float y, float z) {
    //radians measurements:  x, y and z are passed in radians
    float radius = sqrt(x*x + y*y + z*z);
    float roll = atan2(x,z);
    float pitch = acos(y/radius);
    //degrees measurements:
    float X = degrees(x);  
    float Y = degrees(y);  
    float Z = degrees(z);
    float Radius = degrees(radius);
    float Roll = degrees(atan2(x,z));      // / PI * 180.0;
    float Pitch = degrees(acos(y/radius)); // / PI * 180.0;

    textFont(font22); 
    fill(0,0,0,200);
    debugMsgLn1 = "x: "+nf(x,1,2) + " y: "+ nf(y,1,2) + " z: " + nf(z,1,2);
    debugMsgLn2 = "radius: "+nf(radius,1,2)+" roll: "+nf(roll,1,2)+" pitch: "+nf(pitch,1,2);
    println(debugMsgLn1+debugMsgLn2);
    text(debugMsgLn1,-width/2+10,-height/2+30,0);
    text(debugMsgLn2,-width/2+10,-height/2+60,0);
    text("<-- radians",-width/2+300,-height/2+30,0);
    // IN DEGREES:
    debugMsgLn1 = "X: "+int(X) + " Y: "+ int(Y) + " Z: " + int(Z);
    debugMsgLn2 = "Radius: "+int(Radius)+" Roll: "+int(Roll)+" Pitch: "+int(Pitch);
    println(debugMsgLn1+debugMsgLn2);
    text(debugMsgLn1,-width/2+10,-height/2+90,0);
    text(debugMsgLn2,-width/2+10,-height/2+120,0);
    text("<-- degrees",-width/2+300,-height/2+120,0);
    

    // THIS DOES THE WORK:
    //rotateZ(z); 
    averageroll=(averageroll+roll)/2; // smooth out the movements a little
    averagey=(averagey+y)/2;
    rotateZ(averageroll); 
    rotateX(averagey);
    
    
  }    

  // draw the graph bars showing x,y,z
  void drawAccDebug (Loc acc) {
    textFont(font); 
    fill(0,0,0,102);

    stroke(255,204,204);  // pink = z
    line(4,0, 4, -acc.z);
    text(int(acc.z), 0, -acc.z,0);
    stroke(255,0,0);     // red = x
    line(0,0, acc.x, -acc.z);
    text(int(acc.x), acc.x-30, -acc.z);
    stroke(51,102,51);   // green = y
    line(0,0, 0, acc.y);
    text(int(acc.y), 15, acc.y);
  }
  
  
}





