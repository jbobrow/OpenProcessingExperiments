

float bx;
float by;
int TriangleSize = 75;
boolean overTriangle = false;
boolean locked = false;
float xOffset = 0.0; 
float yOffset = 0.0; 

Car myCar1;
Car myCar2;

float a;                 
float offset = PI/24.0;  
int num = 12;

 

void setup (){
  size(200,200, P3D);
  myCar1 = new Car(color(236,243,16),0,120,2); 
  myCar2 = new Car(color(243,98,36),0,80,1);
}

void draw (){
 if (key == 'q' || key =='q'){
  group1 () ;}
  if (key == 'w' || key == 'w'){
  group2 () ;}
  if (key == 'e' || key == 'e'){
    group3 () ;}
 
}

void group1 (){
 
  bx = width/2.0;
  by = height/2.0;
  rectMode(RADIUS);  

  background (245,235,197);
  strokeWeight (2);
  ellipse (100,100,150,150);
  fill (255,227,169);
  strokeWeight(1);
  fill (215,190,140);
  strokeWeight (3);
  ellipse (100,100,3,3);
  
  // Test if the cursor is over the box 
  if (mouseX > bx-TriangleSize && mouseX < bx+TriangleSize && 
      mouseY > by-TriangleSize && mouseY < by+TriangleSize) {
    overTriangle = true;  
    if(!locked) { 
      stroke(255); 
      fill(235,218,151);
    } 
  } else {
    stroke(0);
    fill(175,162,111);
    overTriangle = false;
  }
  
  triangle (100,170,85,145,115,145);
  line (101,101,100,170);
  triangle (50,50,57.5,80,80,59);
  line (100,100,50,50);
}

void mousePressed() {
  if(overTriangle) { 
    locked = true; 
  } else {
    locked = false;
  }
  xOffset = mouseX-bx; 
  yOffset = mouseY-by; 

}

void mouseDragged() {
  if(locked) {
    bx = mouseX-xOffset; 
    by = mouseY-yOffset; 
  }
}

void mouseReleased() {
  locked = false;
}


void group2 (){
   background(108,169,61);
   fill (71,65,65);
   rect (0,100,400,80);
   stroke (246,230,11);
   line (0, 100, 10, 100);
   line (15, 100, 25,100);
   line (30, 100, 40, 100);
   line (45, 100, 55, 100);
   line (60, 100, 70, 100);
   line (75, 100, 85, 100);
   line (90, 100, 100,100);
   line (105, 100, 115, 100);
   line (120, 100, 130, 100);
   line (135, 100, 145, 100);
   line (150, 100, 160, 100);
   line (165, 100, 175,100);
   line (180, 100, 190, 100);
   line (195, 100, 200, 100);
   
  
  myCar1.drive();
  myCar1.display();
  myCar2.drive();
  myCar2.display();
  
}

class Car { 
  color c;
  float xpos;
  float ypos;
  float xspeed;

  
  Car(color tempC, float tempXpos, float tempYpos, float tempXspeed) { 
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
  }

  void display() {
    stroke(0);
    strokeWeight (1);
    fill(c);
    rectMode(CENTER);
    rect(xpos,ypos,35,20);
    ellipse ((xpos+10), (ypos+10), 10,10);
    ellipse ((xpos-10), (ypos+10), 10,10);
    
  }

  void drive() {
    xpos = xpos + xspeed;
    if (xpos > width) {
      xpos = 0;
    }
    
  }
  
}
  void group3 (){
    noStroke ();
    lights();
  
  background(81,14,28);
  translate(width/2, height/2); 
  
  for(int i = 0; i < num; i++) {
    float gray = map(i, 0, num-1, 0, 120);
    pushMatrix();
    rotateY(a + offset*i);
    rotateX(a/2 + offset*i);
    box(100);
    fill (209,39,73);
    popMatrix();
    
  }
  
  a += 0.01;    
} 

  



