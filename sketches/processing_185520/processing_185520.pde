
float angle;
float time = millis();
float r, g, b, r2, g2, b2, r3, g3, b3;

void setup() {
  size(1000, 800);
  smooth();
  rectMode(CENTER);
  
}

void draw() {
  background(255);
  
  
   r = noise(frameCount * 0.01) * 255;
 
  g = frameCount % 255;
 
  b = 255 - noise(1 + frameCount * 0.025) * 255;
  
  b2 = 255 - noise(minute()*20) * 255;
  
 g3 = 255 - noise(hour()*30) * 255;

    color m = color(255, 255, b2);
  color h = color(255, g3, 255);
   color s = color(r, g, b);
   

   pushMatrix();
  angle = (millis()%1000)/60;
 int diameter = millis()%1000;

  
   pushMatrix();
  rotate(.3);
   fill(s);
   translate(200, 200);
   ellipse(0, 0, map(diameter, 800, 1000, 0, 800), map(diameter, 600, 1000, 0, 600));
  ellipse(0, 0, map(diameter, 600, 1000, 0, 600), map(diameter, 800, 1000, 0, 800));
  popMatrix();
  
   pushMatrix();
  rotate(.4);
   fill(s);
 translate(500, 500);
   ellipse(0, 0, map(diameter, 600, 1000, 0, 600), map(diameter, 800, 1000, 0, 800));
  ellipse(0, 0, map(diameter, 800, 1000, 0, 800), map(diameter, 600, 1000, 0, 600));
  popMatrix();
  
   pushMatrix();
  rotate(.2);
   fill(s);
 translate(860, 50);
   ellipse(0, 0, map(diameter, 600, 1000, 0, 600), map(diameter, 800, 1000, 0, 800));
  ellipse(0, 0, map(diameter, 800, 1000, 0, 800), map(diameter, 600, 1000, 0, 600));
  popMatrix();
  
    pushMatrix();
  rotate(.6);
   fill(s);
 translate(1000, 100);
   ellipse(0, 0, map(diameter, 600, 1000, 0, 600), map(diameter, 800, 1000, 0, 800));
  ellipse(0, 0, map(diameter, 800, 1000, 0, 800), map(diameter, 600, 1000, 0, 600));
  popMatrix();
  

  fill(m);
   ellipse(width/2, height/2, map(diameter, 800, 1000, 0, 800), map(diameter, 600, 1000, 0, 600));
  ellipse(width/2, height/2, map(diameter, 600, 1000, 0, 600), map(diameter, 800, 1000, 0, 800));
  
 
  fill(0);
  ellipse(width/2, height/2, map(diameter, 80, 1000, 0, 80), map(diameter, 700, 1000, 0, 700));
  ellipse(width/2, height/2, map(diameter, 700, 1000, 0, 700), map(diameter, 80, 1000, 0, 80));
  
   fill(h);
   noStroke();
   translate(width/2, height/2);
  ellipse(0, 0, 200, 200);   
  popMatrix();
  
  pushMatrix();
  translate(470, 365);
  rotate(angle);
  fill(0);
 noStroke();
  rect(0, 0, 50, 50); 
  rect(0, 0, 50, 50); 
  popMatrix();

 pushMatrix();
  translate(530, 365);
  rotate(angle);
  fill(0);
 noStroke();
  rect(0, 0, 50, 50); 
  rect(0, 0, 50, 50); 
  popMatrix();
  
   pushMatrix();
  translate(530, 430);
  rotate(angle);
  fill(0);
 noStroke();
  rect(0, 0, 50, 50); 
  rect(0, 0, 50, 50); 
  popMatrix();
  
 pushMatrix();
  angle = (millis()%1000)/60;
  translate(470, 430);
  rotate(angle);
  fill(0);
 noStroke();
  rect(0, 0, 50, 50); 
  rect(0, 0, 50, 50); 
  popMatrix();
  
  pushMatrix();
   translate(width/2, height/2);
  fill(0);
 noStroke();
  ellipse(0, 0, 50, 50);   
  popMatrix();
  

  
}


