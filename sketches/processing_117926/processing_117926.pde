
float a = 350;
float b = 240;
float r = 150;
float t = 0;
float dt = 0.01;

float angle = 0;
float aha = 0;
float radius = 60;


void setup () {
  size (700, 480);
  smooth ();
  
}
  
void draw () {
  
   
      if (t>=0) {
    t += dt;
    if (cos(t)<0) {
      

  background (100);
  strokeWeight(3);
  stroke (255);
  
  fill (33,83,146);
  ellipse(a, b+(b-r/2)*sin(t),(r+50*abs(sin(t))-30*cos(t)),r-30*cos(t));
  
  aha += PI/120;
  float cx = cos(aha);  //circles rotaion direction
  float cy = sin(aha);
  float c2x = cos(-aha-PI);
  float c2y = sin(-aha-PI);
  float c3x = cos(-aha);
  float c3y = sin(-aha);
  float c4x = cos(aha-PI);
  float c4y = sin(aha-PI);
  
  float x = 450+ 100*cx; //circles position
  float y = 240 + 100*cy;
  float x2 = 250+ 100*c2x;
  float y2 = 240 + 100*c2y;
  float x3 = 450+ 100*c3x;
  float y3 = 240 + 100*c3y;
  float x4 = 250+ 100*c4x;
  float y4 = 240 + 100*c4y;
  
  angle += 2*PI/30;
  fill(255*abs(cos(angle/20)), 255*abs(cos(angle/30)), 255*abs(cos(angle/2)));
 
  
  
  ellipse (x, y, radius, radius);
  ellipse (x2, y2, radius, radius);
  ellipse (x3, y3, radius, radius);
  ellipse (x4, y4, radius, radius);
  
  //quad (x,y,x2,y2,x3,y3,x4,y4);
  
  
  fill(218,29,7);
  ellipse(a+(a-r/2)*sin(t),b,(r+50*abs(sin(t))-30*cos(t)),r-30*cos(t));
  
  if (mousePressed == true) {
    stroke(255, 204, 0);
    strokeWeight (random(1,15));
    line(x, y, mouseX, mouseY);
    line(x2, y2, mouseX, mouseY);
    line(x4, y4, mouseX, mouseY);
    line(x3, y3, mouseX, mouseY);
  }
  
  
   } else {
     
     background (100);
  strokeWeight(3);
  stroke (255);
  
  fill (218,29,7);
  ellipse(a+(a-r/2)*sin(t),b,(r+50*abs(sin(t))-30*cos(t)),r-30*cos(t));
  
  aha += PI/120;
  float cx = cos(aha);  //circles rotaion direction
  float cy = sin(aha);
  float c2x = cos(-aha-PI);
  float c2y = sin(-aha-PI);
  float c3x = cos(-aha);
  float c3y = sin(-aha);
  float c4x = cos(aha-PI);
  float c4y = sin(aha-PI);
  
  float x = 450+ 100*cx; //circles' position
  float y = 240 + 100*cy;
  float x2 = 250+ 100*c2x;
  float y2 = 240 + 100*c2y;
  float x3 = 450+ 100*c3x;
  float y3 = 240 + 100*c3y;
  float x4 = 250+ 100*c4x;
  float y4 = 240 + 100*c4y;
  
  angle += 2*PI/30;
  fill(255*abs(cos(angle/20)), 255*abs(cos(angle/30)), 255*abs(cos(angle/2)));

  
  
  ellipse (x, y, radius, radius);
  ellipse (x2, y2, radius, radius);
  ellipse (x3, y3, radius, radius);
  ellipse (x4, y4, radius, radius);
  
  //quad (x,y,x2,y2,x3,y3,x4,y4);
  
  fill(33,83,146);
  ellipse(a, b+(b-r/2)*sin(t),(r+50*abs(sin(t))-30*cos(t)),r-30*cos(t));
  
  if (mousePressed == true) {
    stroke(255, 204, 0);
    strokeWeight (random(1,15));
    line(x, y, mouseX, mouseY);
    line(x4, y4, mouseX, mouseY);
    line(x2, y2, mouseX, mouseY);
    line(x3, y3, mouseX, mouseY);
  }
   } }
   else {
     exit();
   }
 
 

  

    
    
       
}
  
       
 


