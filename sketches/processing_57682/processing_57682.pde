
//library loading
import controlP5.*;
import toxi.geom.*;

//letters definition
//coordinates of points
float a = 500;
float b = 200;
float c = 1000;
float d = 500;
//multiply factor
float P;
float P1=100;
float P2=150;
float P3=120;

//classes
ControlP5 controlP5;
ControlWindow controlWindow;


void setup() {
  frameRate (6);
  size (1400, 900);
  smooth ();
  controlP5 = new ControlP5(this);
  controlWindow = controlP5.addControlWindow ("controlP5window", 0, 0, 300, 300);
  controlWindow.hideCoordinates();

  //Sliders
  Controller mySlider1 = controlP5.addSlider ("Param1", 0, 500, P1, 10, 50, 200, 10);
  Controller mySlider2 = controlP5.addSlider ("Param2", 0, 500, P2, 10, 100, 200, 10);
  Controller mySlider3 = controlP5.addSlider ("Param3", 0, 500, P3, 10, 150, 200, 10);

  mySlider1.setWindow (controlWindow);
  mySlider2.setWindow (controlWindow);
  mySlider3.setWindow (controlWindow);
}

void draw() {
  background(230,230,230);
  
  //3points
  strokeWeight (10);
  stroke(0);
  point (a, b);
  point (c, d);
  point (mouseX, mouseY);




  beginShape();
  
  //point03
  ArrayList Mop3 = new ArrayList();
  for (int i=0; i<360; i+=4) {
    float angle = radians(i);
    P = random (60, P3);
    float x3 = mouseX+cos(angle)*P*1.2;
    float y3 = mouseY+sin(angle)*P*1.2;

    Vec3D loc3 = new Vec3D (x3, y3, 0);
    Mop3.add(loc3);
    strokeWeight(3);
    stroke(0);
    point (x3, y3);
    
  }
  
  for (int m=0;m<Mop3.size();m+=2) {
    Vec3D loc_3 = (Vec3D)Mop3.get(m);
    for (int n=0;n<Mop3.size();n++) {
   
      Vec3D other =(Vec3D)Mop3.get(n);
      Vec3D Cen = new Vec3D(loc_3.x, loc_3.y, 0);
      Vec3D Cen2 = new Vec3D(mouseX,mouseY,0);
      float distance = loc_3.distanceTo(other);
      float distance2 = loc_3.distanceTo(Cen2);
      
      if (distance>0&&distance<40&&distance2>110) {

        strokeWeight(0.5);
        stroke(0, P);
        line(loc_3.x, loc_3.y, other.x, other.y);
      }
    }
  }
    
  
  //point01
  ArrayList Mop1 = new ArrayList();
  
    for (int i=0; i<360; i+=3) {
      float angle = radians(i);
      P = random (60, P1);
      float x1 = cos (angle)*P*1.5+a;
      float y1 = sin (angle)*P*1.5+b; 
      stroke(0); 
      strokeWeight (3);
      Vec3D loc1 = new Vec3D (x1, y1, 0);
      Mop1.add(loc1);
      point (x1, y1);
      
    
    }
    for (int m=0;m<Mop1.size();m+=4) {
      Vec3D loc_1 = (Vec3D)Mop1.get(m);
      for (int n=0;n<Mop1.size();n+=2) {
       
        Vec3D other =(Vec3D)Mop1.get(n);
        Vec3D Cen = new Vec3D(loc_1.x, loc_1.y, 0);
        Vec3D Cen2 = new Vec3D(a,b,0);
        float distance = loc_1.distanceTo(other);
        float distance2 = loc_1.distanceTo(Cen2);
      
        if (distance>0&&distance<50&&distance2>100 ) {

          strokeWeight(0.5);
          stroke(0, P);
          line(loc_1.x, loc_1.y, other.x, other.y);
        }
      }
    }
    //point2
  
  ArrayList Mop2 = new ArrayList();
  
    for (int i=0; i<360; i+=3) {
      float angle = radians(i);
      P = random (50, P2);
      float x2 = cos (angle)*P+c;
      float y2 = sin (angle)*P+d; 
      stroke(0); 
      strokeWeight (3);
      Vec3D loc2 = new Vec3D (x2, y2, 0);
      Mop2.add(loc2);
      point (x2, y2);
      
    
    }
    for (int m=0;m<Mop2.size();m+=1) {
      Vec3D loc_2 = (Vec3D)Mop2.get(m);
      for (int n=0;n<Mop2.size();n++) {
       
        Vec3D other =(Vec3D)Mop2.get(n);
        Vec3D Cen = new Vec3D(loc_2.x, loc_2.y, 0);
        Vec3D Cen2 = new Vec3D(c,d,0);
        float distance = loc_2.distanceTo(other);
        float distance2 = loc_2.distanceTo(Cen2);
      
        if (distance>0&&distance<60&&distance2>120 ) {

          strokeWeight(0.5);
          stroke(0, P);
          line(loc_2.x, loc_2.y, other.x, other.y);
        }
      }
    }
    
    for (int k=0;k<Mop1.size();k++){
      for (int l=0;l<Mop2.size();l++){
       for (int t=0;t<Mop3.size();t++){
        Vec3D loc_1 = (Vec3D)Mop1.get(k); 
        Vec3D loc_2 = (Vec3D)Mop2.get(l);
        Vec3D loc_3 = (Vec3D)Mop3.get(t);
        
       float distance13 = loc_1.distanceTo(loc_3);
       float distance23 = loc_2.distanceTo(loc_3);        
        if (distance13>0&&distance13<30 ){
          
          strokeWeight(0.5);
          stroke(255, 0, 0, 120);
          line(loc_1.x, loc_1.y, loc_3.x, loc_3.y);
                  
        }
    if (distance23>0&&distance23<30 ){
     strokeWeight(0.5);
     stroke(255, 0, 0, P);  
     line(loc_2.x, loc_2.y, loc_3.x, loc_3.y);   
      
    }
       } 
      }
     }
  
  endShape();
// saveFrame("output-##.png"); 
  
  
}

