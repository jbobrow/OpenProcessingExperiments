
float delta = 3;
float r = 12;
float pi = 100;
float c;

void setup() {
  size(1000, 1000, P3D);
  frameRate(15);
    
}

void keyPressed()
{
  switch(key){
    case ' ' :
    
    for (float x=-5000; x<5000; x+=200){
      for(float z=-5000; z<5000; z+=200){
      float snowX=random(-5000,5000);
      float snowSZ=15;
      stroke(#FF98FA);
      strokeWeight(10);
      line(snowX,x,z,snowX,x+snowSZ,z);
    

  }}}
}

void draw() {
  background(1,17,103);
  translate(0,50,0);
  rotateX( radians(mouseY));
  rotateY(radians(mouseX));
  
  //hat
  pushMatrix();
  translate(500,403-c,0);
  smooth();
  noStroke();
  fill(#FF83AF);
  scale(1.7,0.2,1.7);
  sphere(90);
  popMatrix();  

  pushMatrix();
  translate(500,365-c,17);
  smooth();
  noStroke();
  fill(#FF83AF);
  scale(1,0.8,1);
  sphere(90);
  popMatrix();
  
  pushMatrix();
  translate(500,365-c,110);
  noStroke();
  fill(255);
  rotate(-PI/4);
  scale(1,3,0.3);
  box(19);
  popMatrix();
  
  pushMatrix();
  translate(500,365-c,110);
  noStroke();
  fill(255);
  rotate(PI/4);
  scale(1,3,0.3);
  box(19);
  popMatrix();
  
  //face
  pushMatrix();
  translate(500, 428, 17);
  noStroke();
  fill(197,158,80);
  sphere(90);
  popMatrix();
  
  //nose
  pushMatrix();
  translate(500,458,107);
  noStroke();
  fill(0);
  sphere(5.5);
  popMatrix();
  
  //line
  pushMatrix();
  translate(500,458,104);
  stroke(0);
  strokeWeight(1);
  line(0,0,0,0,18,-6);
  line(-17,14,-3,-12,18,-3);
  line(17,14,-3,12,18,-3);
  line(-13,19,-3,13,19,-3);
  popMatrix();
  
  //mouth
  pushMatrix();
  translate(500,480,94);
  noStroke();
  fill(#F27973);
  scale(1.1,1,1);
  sphere(7);  
  popMatrix();
   
  //right eye
  pushMatrix();
  translate(530, 437, 108);
  noStroke();
  fill(0);
  sphere(10);
  
  stroke(255);
  strokeWeight(5);
  
  for (float z = 0; z < 1.5; z+=5) {
    for (float deg = 0; deg < 360; deg += delta) {
      float theta = radians(deg);
      float x = r * cos(theta);
      float y = r * sin(theta);
      point(x, y, z);
    }
  }
  popMatrix();
  
  //left eye
  pushMatrix();
  translate(470, 437, 108);
  noStroke();
  fill(0);
  sphere(10);
  

  stroke(255);
  strokeWeight(5);

  
  for (float z = 0; z < 1.5; z+=5) {
    for (float deg = 0; deg < 360; deg += delta) {
      float theta = radians(deg);
      float x = r * cos(theta);
      float y = r * sin(theta);
      point(x, y, z);
    }
  }
 popMatrix();
 //body
 pushMatrix();
 fill(197,158,80);
 noStroke();
 translate(500,560,0);
 scale(1.3,2.5,1);
 sphere(50);
 popMatrix();
 
 //pants
 pushMatrix();
 fill(#5C0183);
 noStroke();
 translate(500,570,0);
 scale(1.35,2.8,1.05);
 sphere(47);
 popMatrix();
 
 //legs
 pushMatrix();
 fill(197,158,80);
 noStroke();
 translate(480,660,0);
 scale(0.4,2.5,0.4);
 sphere(40);
 popMatrix();
 
 pushMatrix();
 fill(197,158,80);
 noStroke();
 translate(520,660,0);
 scale(0.4,2.5,0.4);
 sphere(40);
 popMatrix();
 
 pushMatrix();
 fill(0);
 noStroke();
 translate(480,750,0);
 scale(1.1,2,1);
 sphere(7);
 popMatrix();
 
 pushMatrix();
 fill(0);
 noStroke();
 translate(520,750,0);
 scale(1.1,2,1);
 sphere(7);
 popMatrix();
 
 //arms
 pushMatrix();
 fill(197,158,80);
 noStroke();
 translate(440,510,0);
 scale(2.3,0.4,0.6);
 sphere(35);
 popMatrix();
 
 pushMatrix();
 fill(197,158,80);
 noStroke();
 translate(560,510,0);
 scale(2.3,0.4,0.6);
 sphere(35);
 popMatrix();
 
 pushMatrix();
 fill(0);
 noStroke();
 translate(364,510,0);
 scale(2,1.3,1);
 sphere(6);
 popMatrix();
 
 pushMatrix();
 fill(0);
 noStroke();
 translate(636,510,0);
 scale(2,1.3,1);
 sphere(6);
 popMatrix();
 
 //horn
 
 pushMatrix();
 fill(197,158,80);
 noStroke();
 translate(405,390,0);
 sphere(15);
 popMatrix();
 
 pushMatrix();
 fill(197,158,80);
 noStroke();
 translate(595,390,0);
 sphere(15);
 popMatrix();
 
 pushMatrix();
 fill(#7C4000);
 noStroke();
 translate(403,370,0);
 scale(0.5,3,0.5);
 sphere(15);
 popMatrix();
 
 pushMatrix();
 fill(#7C4000);
 noStroke();
 translate(597,370,0);
 scale(0.5,3,0.5);
 sphere(15);
 popMatrix();
 
 //surface
 pushMatrix();
 fill(250);
 noStroke();
 translate(500,785,0);
 scale(8,0.05,8);
 box(1000);
 popMatrix();
 
}

void mouseClicked( ){
  if(c<=60){
    c+=10;
  }else{
    c=0;
  }
}


