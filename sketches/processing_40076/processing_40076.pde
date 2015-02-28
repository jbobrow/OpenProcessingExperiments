
float angle = 0.0;
//float offset = 60;
float scalar;
float angleDirection = 1;
float speed = 0.005;
//int x,y;


void setup() {
  size(500,450);
  fill(0);
  smooth();
}

void draw() {
  background(102,25,205);
  
  pushMatrix();
  noStroke();
  fill(255,200);
     translate(width/2, height/2);
     for(int i=0; i<15; i++) {
       scale(1.2);
       //stroke(34,197,54);
       rotate(angle);
       ellipse(4,2,20,20);
     }
  popMatrix();
  fill(255);
  pushMatrix();
    translate(width/2,height/2);
    rotate(angle);
    stroke(255,255,0);
    rect(-25,-25,50,50);
  popMatrix();
  
  pushMatrix();
     translate(width/2, height/2);
     for(int i=0; i<15; i++) {
       strokeWeight(i);
       stroke(15,75,255);
       rotate(angle);
       line(0,0,55,0);
     }
  popMatrix();  
  
  pushMatrix();
  noStroke();
  translate(width/2,height/2);
  rotate(-angle);
line(-width/2,0,width/2,0);
line(0,-height/2,0,height/2);
line(-width,-height,width,height);
line(-width,-height/2,width,height/2);
line(-width,height/2,width,-height/2);
line(-width/2,height/2,width/2,-height/2);
noStroke();
fill(255,204);
ellipse(0,0,45,45);//origin
ellipse(250,250,80,80);
fill(255,150,5);
ellipse(0,50,80,80);
//ellipse(-width/2,height/2,45,45);
//ellipse(width/2,-height/2,45,45);
  popMatrix();
  
  angle+=speed*9;
  
  
}
