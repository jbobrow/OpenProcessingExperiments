
import processing.opengl.*;

float L = 10;
float sx = 5;
float sy = 5;

float X = random(50, 650);
float Y = random(50, 350);
//float N = random(50, 650);
//float M = random(50, 350);
float A = random(50, 650);
float S = random(50, 350);
float o = random(50, 650);
float p = random(50, 350);
float u = random(50, 650);
float i = random(50, 350);

float q = random(50, 650);
float w = random(50, 350);
float e = random(50, 650);
float r = random(50, 350);
float t = random(50, 650);
float y = random(50, 350);
float d = random(50, 650);
float f = random(50, 350);

float F1 = 255;
float F2= 255;

void setup(){
 size(700,400, OPENGL);
 
 noCursor();
}
//-----------------------------------------------------//

 void draw() {
  background(0);
  noStroke();
  lights();
  smooth();
  
 
  
  //--------------------------------------------//
  //--draw all boxes--//
  
  pushMatrix();
   x();
  popMatrix();
  
  pushMatrix();
  fill(F1, F2);
  translate(X, Y);
  spin();
  box(75, 75, 75);
  popMatrix();
  
  pushMatrix();
  translate(A, S);
  spin();
  box(75, 75, 75);
  popMatrix();
  
  pushMatrix();
  translate(o, p);
  spin();
  box(75, 75, 75);
  popMatrix();

   pushMatrix();
  translate(u, i);
  spin();
  box(75, 75, 75);
  popMatrix();
  
  pushMatrix();
  translate(q, w);
  spin();
  box(75, 75, 75);
  popMatrix();
  
  pushMatrix();
  translate(e, r);
  spin();
  box(75, 75, 75);
  popMatrix();
  
  pushMatrix();
  translate(t, y);
  spin();
  box(75, 75, 75);
  popMatrix();
  
  pushMatrix();
  translate(d, f);
  spin();
  box(75, 75, 75);
  popMatrix();
  
  //-------------------------------------------------//
  //--attract--//
  
  if(dist(X, Y, mouseX, mouseY) < 75 && mousePressed == true){
    X = mouseX + random(-25, 25);
    Y = mouseY + random(-25, 25);
    //F1 = 255;
    //F2 = 100;
  
  }
  
 
  if(dist(A, S, mouseX, mouseY) < 75 && mousePressed == true){
  A = mouseX + random(-25, 25);
    S = mouseY + random(-25, 25);
   //F1 = 255;
   //F2 = 100;
  }
   if(dist(o, p, mouseX, mouseY) < 75 && mousePressed == true){
  o = mouseX + random(-25, 25);
    p = mouseY + random(-25, 25);
   //F1 = 255;
   //F2 = 100;
   }
   if(dist(u, i, mouseX, mouseY) < 75 && mousePressed == true){
  u = mouseX + random(-25, 25);
    i = mouseY + random(-25, 25);
   //F1 = 255;
   //F2 = 100;
  }  
   
   if(dist(q, w, mouseX, mouseY) < 75 && mousePressed == true){
  q = mouseX + random(-25, 25);
    w = mouseY + random(-25, 25);
   }
   
   if(dist(e, r, mouseX, mouseY) < 75 && mousePressed == true){
  e = mouseX + random(-25, 25);
    r = mouseY + random(-25, 25);
   }
   
   if(dist(t, y, mouseX, mouseY) < 75 && mousePressed == true){
  t = mouseX + random(-25, 25);
    y = mouseY + random(-25, 25);
   }
   
   if(dist(d, f, mouseX, mouseY) < 75 && mousePressed == true){
  d = mouseX + random(-25, 25);
    f = mouseY + random(-25, 25);
   }
   //------------------------------------------------//
   //--repel--//
 
  if(mousePressed == false){
   //F1 = 255; 
   //F2 = 255;
   
   if(X > 50 && X < 650){
   if(Y > 50 && Y < 350){ 
   if(dist(mouseX, mouseY, X, Y) < 150) {
     X = X + (X - mouseX)/10;
     Y = Y + (Y - mouseY)/10;
     
   }
   //if(X <= 50){ X = X + 25;}
   }
   }
   

   if(A > 50 && A < 650){
   if(S > 50 && S < 350){
   if(dist(mouseX, mouseY, A, S) < 150) {
     A = A + (A - mouseX)/10;
     S = S + (S - mouseY)/10;
   }
   }
   }
    if(o > 50 && o < 650){
    if(p > 50 && p < 350){
    if(dist(mouseX, mouseY, o, p) < 150) {
     o = o + (o - mouseX)/10;
     p = p + (p - mouseY)/10;
   }
   }
   }
    if(u > 50 && u < 650){
    if(i > 50 && i < 350){
    if(dist(mouseX, mouseY, u, i) < 150) {
     u = u + (u - mouseX)/10;
     i = i + (i - mouseY)/10;
   }
   }
   }
   
   if(q > 50 && q < 650){
    if(w > 50 && w < 350){
    if(dist(mouseX, mouseY, q, w) < 150) {
     q = q + (q - mouseX)/10;
     w = w + (w - mouseY)/10;
   }
   }
   }
   
   if(e > 50 && e < 650){
    if(r > 50 && r < 350){
    if(dist(mouseX, mouseY, e, r) < 150) {
     e = e + (e - mouseX)/10;
     r = r + (r - mouseY)/10;
   }
   }
   }
   
   if(t > 50 && t < 650){
    if(y > 50 && y < 350){
    if(dist(mouseX, mouseY, t, y) < 150) {
     t = t + (t - mouseX)/10;
     y = y + (y - mouseY)/10;
   }
   }
   }
   if(d > 50 && d < 650){
    if(f > 50 && f < 350){
    if(dist(mouseX, mouseY, d, f) < 150) {
     d = d + (d - mouseX)/10;
     f = f + (f - mouseY)/10;
   }
   }
   }
   }
   //------------------------------------------------//
   
   float Ypos = sy;
  while(Ypos < height){
    
  float Xpos = sx;
  stroke(255, 150);
  
    while(Xpos < width){
      if(dist(Xpos, Ypos, mouseX, mouseY) > 100 && mousePressed == false){
        float angle = atan2(mouseY - Ypos, mouseX - Xpos); 
       
        line(Xpos, Ypos, Xpos + cos(angle)*L, Ypos - sin(angle)*L);
        
    }
    
    if(dist(Xpos, Ypos, mouseX, mouseY) > 100 && mousePressed == true){
        float angle = atan2(mouseY + Ypos, mouseX + Xpos); 
       
        line(Xpos, Ypos, Xpos + sin(angle)*L, Ypos + sin(angle)*L);
    }
    //else{
        
        //line(Xpos, Ypos, Xpos + L, Ypos);
    //}
    
      Xpos = Xpos + (L + sx);
    
    }
    
    Ypos = Ypos + sy;
   
  }
 }
  
 
 
 
 void x(){
  translate(mouseX, mouseY);
  spin();
  box(100, 100, 100); 
 }
 
 void spin(){
   rotateX(mouseY*0.015);
  rotateY(mouseX*0.015);
 }

