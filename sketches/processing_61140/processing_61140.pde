
//set window, bg &anti;-alias
void setup(){
size(400,400);
background(0);
smooth();
}

//set drawing
void draw(){
background(0);
//color mode & text load and set
 colorMode(RGB,255,255,255); 

//limit set
int w=width/2;
int a=height/2;
int m2;
//clock & position & size variables
int s = second();  // Values from 0 - 59
int m = minute();  // Values from 0 - 59
int h = hour();    // Values from 0 - 23
int w2=width;
int alt=3;
int Scale=200;

//clock variables map
  s=(int) map (s, 0,60, 0, height/2);
  m=(int) map (m, 0,60, 0, 360);
  h=(int) map (h, 0,24, 0, 360);
 
//////////////////
///////CLOCK//////
//////////////////
  noStroke();
  
  //hours' ellipse  track & seconds limit
  strokeWeight(1); 
  noFill();
  stroke(255);
  ellipse(w,a,width/2,width/2);
  noStroke();
  
  
  //SECONDS (grows with seconds)
  fill(200,0,s,180); 
  ellipse(w,a, s, s);
 
  
  //MINUTES
  //traslation for time's rotation
   translate (width/2, height/2);
   //stroke size & color
   strokeWeight(2);
   colorMode(HSB,360,100,100);
   
  //color map to minutes 
   int mC = (int) map (m,0,Scale,0,360);
   fill(mC,88,99);
   
   //convert angle in degrees to radians
   float angleMinutes = radians(m);
   //rotation around center of window
   pushMatrix();
    rotate(angleMinutes);
    ellipse(0,-160,20,20);
   popMatrix();  
   
   //HOURS//
   
   //convert angle in degrees to radians
      float angleHours = radians(h);// convertemos de angulos 0-360 para radianos
     //rotation around center of window
     pushMatrix();
        rotate(angleHours);
        strokeWeight(12);
        //color map to hours
        int hC = (int) map (h,0,Scale,0,360);
        fill(hC-100,30,99);
        ellipse (0,-100, 35, 35);
    popMatrix();  
   
}
