
 float theta;
 float r;
  int circle = 400; 
 void setup()
 {
   size(800,800);
   background(255);
   theta = 0;
   r = 0;
   strokeWeight(0.1); 
 }
 void draw() 
 { 
   int j;
   float x,y;
   
   theta += 50;
   r += 0.1;
   color fillcolor = color(random(255), random(255), random(255));
    
   float alph = random(255);
   fill(fillcolor);
   if (r>circle ){r = 0;}
   
   x = r*cos(theta);
   y = r*sin(theta);
    lights();
  ellipse(x+400,y+400,20,20);
  
 }


