
float acc = 1;
float accx = 1, accy = 1;
float rotate;
int count = 0, countx = 0, county = 0;
float x = 0, y = 0, a, b;
float random;


import processing.pdf.*;

void setup(){
  
  frameRate(500);
  size(595, 742);
  background(255);
  
  beginRecord(PDF, "wind.pdf");
  
}



void draw() {
  
  
  a = a + accx;
  b = b + accy;
  y = y + acc;
  x = x + 1;
  
  
  count ++;
  countx ++;
  county ++;
  
  
 
  
  if (count == 200) {
    acc = acc * -1;
    
    // acc = acc * -0.3;
    count = 1;
  }; 
  
    if (countx == 150) {
    accx = accx * -1;
    countx = 0;
  }; 
  
  if (county == 230) {
    accy = accy * -1;
    county = 0;
  }; 
  
  
  rotate = rotate + 0.5;
  
  
  println(y);
  
  
  
  pushMatrix();
         
          translate(width/2, height/2);
          //rotateZ(radians(rotate));
          rotate(radians(rotate));
          stroke(000,0+(rotate*0.05),50+(rotate*0.05),10+(rotate*0.05));
          noFill(); 
          
          // forskellige udseende //
          
          //bezier(a, -b, -a*2, b*0.1, b/2, b, y/2, a);
          
          //bezier(a, -y, -a*2, b, b/2, b*4, y, a*2);
          
          //bezier(a, -y, -a*2, b, b/2, b, y, a);  
          
          //bezier(a, -b, -y, b, b/2, y, count, a); 
          
          bezier(b, -b, y, b, b/2, y, count/2, b);  
          
          //bezier(a, b*-0.5, y*-0.2, 10 , b, a, count/2, y);
          
          //bezier(0, b*-0.2, y*-0.2, 10, b, a, count/2, y);
  
  
 popMatrix(); 




}

//controls//

void keyPressed(){
  if (key == 'a'){
    
  println("Got It!");
  noLoop();
  endRecord();
  }
}

void mouseReleased() {
  loop();
}




