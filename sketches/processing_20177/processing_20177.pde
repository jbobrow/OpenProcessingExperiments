
color a = color(5,40,255,10);
color b = color(64,90,252,10);
color c = color(133,149,252,10);
float d = (1);
float e = (5);
float f = (10);
float g = (100);
float h = (1);
float j = (2.5);
  

void setup()
{
size(500, 500);
smooth();
background(0);
 
};



void draw()
{
  
  
  strokeWeight(h);
  frameRate(g);
  if (keyPressed == true) {
    background(0);}
  if(mousePressed && (mouseButton == LEFT)){
    
 a = color(252,0,63,j);
 b = color(227,94,127,j);
 c = color(255,211,222,j);
  } else if(mousePressed && (mouseButton == RIGHT))
  {  
 a = color(176, 227, 169,j);
 b = color(100,193,88,j);
 c = color(28,255,0,j);
  } else { 
 a = color(5,40,255,j);
 b = color(64,90,252,j);
 c = color(133,149,252,j);
  }
  
  if (frameCount % 0.5 == 0)
  {
   
  pushMatrix();
  translate(250, 250);
  rotate(radians(frameCount/d % 360));
  line(0, 0, 0, 100);
  stroke(a);
  popMatrix();
  
  pushMatrix();
  translate(250, 250);
  rotate(radians(frameCount/e %360));
  line(0,0,75,0);
  stroke(b);
  popMatrix();
  
  pushMatrix();
  translate(250, 250);
  rotate(radians(frameCount/f %360));
  line(0,50, 0, 0);
  stroke(c);
  popMatrix();

pushMatrix();
  translate(250, 250);
  rotate(radians(frameCount/e %360));
  
  pushMatrix();
  translate(75, 0);
  rotate(radians(frameCount/d % 360));
  line(0, 0, 0, 100);
  stroke(a);
  popMatrix();
  
  pushMatrix();
  translate(75, 0);
  rotate(radians(frameCount/e %360));
  line(0,0,75,0);
  stroke(b);
  popMatrix();
  
  pushMatrix();
  translate(75,0);
  rotate(radians(frameCount/f %360));
  line(0,50, 0, 0);
  stroke(c);
  popMatrix();
popMatrix();
  
pushMatrix();
  translate(250, 250);
  rotate(radians(frameCount/f %360));
  
    pushMatrix();
  translate(0, 50);
  rotate(radians(frameCount/d % 360));
  line(0, 0, 0, 100);
  stroke(a);
  popMatrix();
  
  pushMatrix();
  translate(0, 50);
  rotate(radians(frameCount/e %360));
  line(0,0,75,0);
  stroke(b);
  popMatrix();
  
  pushMatrix();
  translate(0,50);
  rotate(radians(frameCount/f %360));
  line(0,50, 0, 0);
  stroke(c);
  popMatrix();
popMatrix();  
  pushMatrix();
    
    translate(250, 250);
    rotate(radians(frameCount/d %360));
    
    pushMatrix();
    translate(0, 100);
    rotate(radians(frameCount/d % 360));
    line(0, 0, 0, 100);
    stroke(a);
    popMatrix();
  
    pushMatrix();
    translate(0,100);
    rotate(radians(frameCount/e %360));
    line(0,0,75,0);
    stroke(b);
    popMatrix();
  
    pushMatrix();
    translate(0,100);
    rotate(radians(frameCount/f %360));
    line(0,50, 0, 0);
    stroke(c);
    popMatrix();
  popMatrix();
  
 pushMatrix();
   translate(250,250);
   rotate(radians(frameCount/d %360));
   
   pushMatrix();
    
    translate(0, 100);
    rotate(radians(frameCount/d %360));
    
    pushMatrix();
    translate(0, 100);
    rotate(radians(frameCount/d % 360));
    line(0, 0, 0, 100);
    stroke(a);
    popMatrix();
  
    pushMatrix();
    translate(0,100);
    rotate(radians(frameCount/e %360));
    line(0,0,75,0);
    stroke(b);
    popMatrix();
  
    pushMatrix();
    translate(0,100);
    rotate(radians(frameCount/f %360));
    line(0,50, 0, 0);
    stroke(c);
    popMatrix();
  popMatrix();
popMatrix();
  
   pushMatrix();
   translate(250,250);
   rotate(radians(frameCount/e %360));
   
   pushMatrix();
    
    translate(75,0);
    rotate(radians(frameCount/e %360));
    
    pushMatrix();
    translate(75,0);
    rotate(radians(frameCount/d % 360));
    line(0, 0, 0, 100);
    stroke(a);
    popMatrix();
  
    pushMatrix();
    translate(75,0);
    rotate(radians(frameCount/e %360));
    line(0,0,75,0);
    stroke(b);
    popMatrix();
  
    pushMatrix();
    translate(75,0);
    rotate(radians(frameCount/f %360));
    line(0,50, 0, 0);
    stroke(c);
    popMatrix();
  popMatrix();
popMatrix();
    

  
   pushMatrix();
   translate(250,250);
   rotate(radians(frameCount/f %360));
   
   pushMatrix();
    
    translate(0,50);
    rotate(radians(frameCount/f %360));
    
    pushMatrix();
    translate(0,50);
    rotate(radians(frameCount/d % 360));
    line(0, 0, 0, 100);
    stroke(a);
    popMatrix();
  
    pushMatrix();
    translate(0,50);
    rotate(radians(frameCount/e %360));
    line(0,0,75,0);
    stroke(b);
    popMatrix();
  
    pushMatrix();
    translate(0,50);
    rotate(radians(frameCount/f %360));
    line(0,50, 0, 0);
    stroke(c);
    popMatrix();
  popMatrix();
popMatrix();

   pushMatrix();
   translate(250,250);
   rotate(radians(frameCount/d %360));
   
   pushMatrix();
    
    translate(0,100);
    rotate(radians(frameCount/e %360));
    
    pushMatrix();
    translate(75,0);
    rotate(radians(frameCount/d % 360));
    line(0, 0, 0, 100);
    stroke(a);
    popMatrix();
  
    pushMatrix();
    translate(75,0);
    rotate(radians(frameCount/e %360));
    line(0,0,75,0);
    stroke(b);
    popMatrix();
  
    pushMatrix();
    translate(75,0);
    rotate(radians(frameCount/f %360));
    line(0,50, 0, 0);
    stroke(c);
    popMatrix();
  popMatrix();
popMatrix();

pushMatrix();
   translate(250,250);
   rotate(radians(frameCount/d %360));
   
   pushMatrix();
    
    translate(0,100);
    rotate(radians(frameCount/f %360));
    
    pushMatrix();
    translate(0,50);
    rotate(radians(frameCount/d % 360));
    line(0, 0, 0, 100);
    stroke(a);
    popMatrix();
  
    pushMatrix();
    translate(0,50);
    rotate(radians(frameCount/e %360));
    line(0,0,75,0);
    stroke(b);
    popMatrix();
  
    pushMatrix();
    translate(0,50);
    rotate(radians(frameCount/f %360));
    line(0,50, 0, 0);
    stroke(c);
    popMatrix();
  popMatrix();
popMatrix();
  
pushMatrix();
   translate(250,250);
   rotate(radians(frameCount/e %360));
   
   pushMatrix();
    
    translate(75,0);
    rotate(radians(frameCount/f %360));
    
    pushMatrix();
    translate(0,50);
    rotate(radians(frameCount/d % 360));
    line(0, 0, 0, 100);
    stroke(a);
    popMatrix();
  
    pushMatrix();
    translate(0,50);
    rotate(radians(frameCount/e %360));
    line(0,0,75,0);
    stroke(b);
    popMatrix();
  
    pushMatrix();
    translate(0,50);
    rotate(radians(frameCount/f %360));
    line(0,50, 0, 0);
    stroke(c);
    popMatrix();
  popMatrix();
popMatrix();

pushMatrix();
   translate(250,250);
   rotate(radians(frameCount/e %360));
   
   pushMatrix();
    
    translate(75,0);
    rotate(radians(frameCount/d %360));
    
    pushMatrix();
    translate(0,100);
    rotate(radians(frameCount/d % 360));
    line(0, 0, 0, 100);
    stroke(a);
    popMatrix();
  
    pushMatrix();
    translate(0,100);
    rotate(radians(frameCount/e %360));
    line(0,0,75,0);
    stroke(b);
    popMatrix();
  
    pushMatrix();
    translate(0,100);
    rotate(radians(frameCount/f %360));
    line(0,50, 0, 0);
    stroke(c);
    popMatrix();
  popMatrix();
popMatrix();

pushMatrix();
   translate(250,250);
   rotate(radians(frameCount/e %360));
   
   pushMatrix();
    
    translate(75,0);
    rotate(radians(frameCount/d %360));
    
    pushMatrix();
    translate(0,100);
    rotate(radians(frameCount/d % 360));
    line(0, 0, 0, 100);
    stroke(a);
    popMatrix();
  
    pushMatrix();
    translate(0,100);
    rotate(radians(frameCount/e %360));
    line(0,0,75,0);
    stroke(b);
    popMatrix();
  
    pushMatrix();
    translate(0,100);
    rotate(radians(frameCount/f %360));
    line(0,50, 0, 0);
    stroke(c);
    popMatrix();
  popMatrix();
popMatrix();

pushMatrix();
   translate(250,250);
   rotate(radians(frameCount/f %360));
   
   pushMatrix();
    
    translate(0,50);
    rotate(radians(frameCount/d %360));
    
    pushMatrix();
    translate(0,100);
    rotate(radians(frameCount/d % 360));
    line(0, 0, 0, 100);
    stroke(a);
    popMatrix();
  
    pushMatrix();
    translate(0,100);
    rotate(radians(frameCount/e %360));
    line(0,0,75,0);
    stroke(b);
    popMatrix();
  
    pushMatrix();
    translate(0,100);
    rotate(radians(frameCount/f %360));
    line(0,50, 0, 0);
    stroke(c);
    popMatrix();
  popMatrix();
popMatrix();



pushMatrix();
   translate(250,250);
   rotate(radians(frameCount/f %360));
   
   pushMatrix();
    
    translate(0, 50);
    rotate(radians(frameCount/e %360));
    
    pushMatrix();
    translate(75,0);
    rotate(radians(frameCount/d % 360));
    line(0, 0, 0, 100);
    stroke(a);
    popMatrix();
  
    pushMatrix();
    translate(75,0);
    rotate(radians(frameCount/e %360));
    line(0,0,75,0);
    stroke(b);
    popMatrix();
  
    pushMatrix();
    translate(75,0);
    rotate(radians(frameCount/f %360));
    line(0,50, 0, 0);
    stroke(c);
    popMatrix();
  popMatrix();
popMatrix(); 
}
};





