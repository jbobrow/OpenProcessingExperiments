
float es = 50;
float ex,ey;
boolean over = false;
boolean locked = false;
float xoff, yoff;
float xpos = 200;
float xpos1 = 400;
float ypos = 30;
float ypos1 = 40;
float vy = 0;
float gravity = 0.98;
float bounce = -1;
float randr = random(0, 255);
float randg = random(0, 255);
float randb = random(0, 255);

 
void setup(){
    size(500,900);
    smooth();
    noStroke();
    ex = width/2;
    ey = height/2;
}
 
void draw(){
  background(0);
  float randr = random(0, 255);
float randg = random(0, 255);
float randb = random(0, 255);
   fill(randr, randg, randb);
  ellipse(xpos, ypos, 60, 60);
  ellipse(xpos1, ypos1, 80, 80);
  if(dist(mouseX,mouseY,ex,ey) < es/2){
    
     over = true;
  }
  else{
    
     over = false;
  }
  
  ellipse(ex, ey,  es,es);
}
void mousePressed(){
   if(over){
      locked = true;
      xoff = mouseX-ex;
      yoff = mouseY-ey;
   }
}
void mouseDragged(){
   if(locked){
      ex = mouseX-xoff;
      ey = mouseY-yoff;
   }  
}
void mouseReleased(){
   locked = false;

 vy += gravity;
  ypos -= vy;
  if(ypos > height - 15)
  {
    vy *= bounce;
  }
  println(vy);

vy += gravity;
  ypos1 += vy;
  if(ypos1 > height - 15)
  {
    vy *= bounce;
  }
  println(vy);

vy += gravity;
  ypos1 += vy;
  if(ypos1 > height - 15)
  {
    vy *= bounce;
  }
  println(vy);
}
