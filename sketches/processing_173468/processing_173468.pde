
float xpos;
float ypos;
float zpos;
float speedx = random(5,10);
float speedy = random(-8,-3);
float speedz = random(2,12);
int r = 50;
float angle;

void setup(){
  size(600,600,OPENGL);
  noStroke();
  xpos = 0;
  ypos = 0;
  zpos = -300;
}

void draw(){
  background(0);
  pointLight(51, 102, 126, 7, -51, -36);
    pointLight(255, 102, 166, 378, 537, -440);
//ambientLight(102, 102, 102);
//  lights();
  //drop the box
//  pushMatrix();
//  translate(300,300,-300);
//  noFill();
//  stroke(255);
//  box(600);
//  popMatrix();
   pushMatrix();
   translate(300,300,0);
   rotateZ(radians(angle));
  fill(150);
  beginShape(QUADS);
    // Front face
    vertex(-300, -300, -600); 
    vertex(300, -300, -600); 
    vertex(300, 300, -600); 
    vertex(-300, 300, -600);
   endShape(); 
   
  
//  fill(150,50);
//  beginShape(QUADS);   
//    vertex(0, 0, 0); 
//    vertex(600, 0, 0); 
//    vertex(600, 0, 0); 
//    vertex(0, 600, 0);
//   endShape(); 
  
   fill(150);
   beginShape(QUADS);
    vertex(-300, -300, -600); 
    vertex(-300, -300, 0); 
    vertex(-300, 300, 0); 
    vertex(-300, 300, -600);
   endShape();
   fill(150);
   beginShape(QUADS);
    vertex(300, -300, -600); 
    vertex(300, -300, 0); 
    vertex(300, 300, 0); 
    vertex(300, 300, -600);
   endShape();
   fill(150);
   beginShape(QUADS);
    vertex(-300, -300, -600); 
    vertex(300, -300, -600); 
    vertex(300, -300, -0); 
    vertex(-300, -300, 0);
   endShape();
   fill(150);
   beginShape(QUADS);
    vertex(-300, 300, -600); 
    vertex(300, 300, -600); 
    vertex(300, 300, 0); 
    vertex(-300, 300, 0);
   endShape();
   popMatrix();
   translate(300,300,0);
   rotateZ(radians(angle));
   pushMatrix();
   translate(xpos, ypos, zpos);
   
   //sphereDetail(3);
   sphere(r);
    
  xpos = xpos + speedx + random(-0.1,0.1);
  ypos = ypos + speedy + random(-0.1,0.1);
  zpos = zpos + speedz + random(-0.1,0.1);
  
  if ((xpos-r)< -300 || (300 - xpos) < r){
    speedx *= -1;
  }
  if ((ypos-r)< -300 || (300 - ypos) < r){
    speedy *= -1;
  }
  if ((abs(zpos)-r)< 0 || (600 - abs(zpos)) < r){
    speedz *= -1;
  }
  popMatrix(); 
  
   
  
  angle += 0.5; 
  
  
  
  
  //drop the ball in centre
  
  
}


