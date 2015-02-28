
PImage[] img = new PImage[8];  


float angle = 0;  


int copy = 50 ;  


float p = 0; 


  


int re = 1; 


  


  


void setup() { 


  size(800, 800);  


  background(0); 


  for (int i = 0; i < 8; i ++) { 


    img[i] = loadImage( i+".png"); 


  } 


  


  image(img[6], 0, 0, width, height); 


} 


  


void draw() { 


  


  float r1 = random(700, 800); 


  float r2 = random(-400, 100); 


  float r3 = random(-400, 10); 


  pushMatrix(); 


  


  translate(width/2, height/2); 


  rotate(angle*20); 


  image(img[7], 0, 0, 50, 50); 


  popMatrix();   


  


  


  pushMatrix(); 


  translate(width/2-width/4, height/2); 


  rotate(angle*20); 


  image(img[7], 0, 0, p, p); 


  popMatrix();  


  


  pushMatrix(); 


  translate(width/2+width/4, height/2); 


  rotate(angle*20); 


  image(img[7], 0, 0, p, p); 


  popMatrix();  


  


  pushMatrix(); 


  translate(width/2, height/2-height/4); 


  rotate(angle*20); 


  image(img[7], 0, 0, p, p); 


  popMatrix();  


  


  pushMatrix(); 


  translate(width/2, height/2+height/4); 


  rotate(angle*20); 


  image(img[7], 0, 0, p, p); 


  popMatrix();  


  


  


  pushMatrix(); 


  translate(width/2, height/2); 


  rotate(-angle*30); 


  for (int i = 0; i < 3; i ++) { 


    image(img[i], r3*i, i*r3, 40, 90); 


  } 


  


  popMatrix();   


  


  


  pushMatrix(); 


  translate(width/2, height/2); 


  rotate(angle*20); 


  image(img[4], 50, 0, 100, 50); 


  popMatrix();  


  


  pushMatrix(); 


  translate(0+r2, height/4-r2); 


  


  image(img[5], 0+r3, 0-r3, width/2, height/2); 


  popMatrix();  


  


  pushMatrix(); 


  translate(width/2, -200); 


  


  image(img[3], r2-200, 0, width/2+300, 300); 


  popMatrix();  


  


  pushMatrix(); 


  translate(width/2, height-120); 


  


  image(img[3], r2-400, 0, width/2+800, 300); 


  popMatrix();  


  


  


  


  


  


  


  


  // float r = random(300, 500);  


  // for (int i = 0; i < 7; i ++) { 


  //  image(img[2], 80*i, r); 


  //  } 


  


  


  


  if (p<0 || p > 300) { 


    re *= -1; 


  } 


  


  p += 1*re; 


  


  


  


  angle += 0.01; 


} 


  


  


  


  


  


//void keyPressed() { 


// saveFrame("_######.png"); 


//} 

