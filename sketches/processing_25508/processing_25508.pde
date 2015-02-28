
import processing.opengl.*;

PImage  fondo;

float inc = 0.0;
float posx=250;
float posy=250;
float angle3 = 0.0;
boolean food = false;
int foodiam=0;
int fadestroke;
float anglefood;


float a1 = 0.012;
float a2 = 0.001;
float a3 = 0.002;
float a4 = 0.03;
float a5 = 0.0025;
float a6 = 0.0034;
float a7 = 0.014;
float a8 = 0.0028;
float rot1, rot2, rot3, rot4, rot5, rot6, rot7, rot8;

float easing=0.0055;
float targetY;
float targetX;



void setup() {
  targetX=random(width);
  targetY=random(height);
  size(400, 300,OPENGL);
  background(0);
  smooth();
noCursor();

}

void draw() {
  if (food == true) {

    // createFood(targetX-5, targetY-5);
    // createFood(targetX-5, targetY+5);
  }

  if (dist(targetX,targetY,posx,posy) < 20) {
    targetX=random(width);
    targetY=random(height);
   
  }

  inc += 0.01;
  float angle1 = sin(inc)/10.0 + sin (inc*4.5)/70.0;
  float angle2 = cos(inc)/12.0 + cos (inc*4.5)/80.0;

  angle3+=7;

  //posx=250+cos(angle3)*100+sin(angle3)*100;
  //posy=250+tan(cos(angle3))*100+cos(angle3)*25;


  posx += (targetX-posx)*easing;
  posy += (targetY-posy)*easing;
  fill(0);
    stroke(dist(targetX,targetY,posx,posy)/3,0,0);
  translate(posx,posy);
  tail(0, 5, angle1*4);
  rotate(sin(rot1)+QUARTER_PI);
    fill(0);
    stroke(random(dist(targetX,targetY,posx,posy)/3,dist(targetX,targetY,posx,posy)/2),0,0);
  tail(0, 5, angle1*2.7);
  rotate(cos(rot2)+QUARTER_PI);
  tail(0, 5, angle2*5.5);
  rotate(rot3+QUARTER_PI);
  tail(0, 5, angle1*3);
  rotate(sin(rot4+QUARTER_PI));
  tail(0, 5, angle2*4.2);
  rotate(atan(rot5)+QUARTER_PI);
  tail(0, 5, angle1*2.4);
  rotate(sin(rot6)+QUARTER_PI);
  tail(0, 5, angle2*3);
  rotate(cos(rot7)+QUARTER_PI);
  tail(0, 5, angle1*3.2);
  rot1+=a1;
  rot2+=a2;
  rot3+=a3;
  rot4+=a4;
  rot5+=a5;
  rot6+=a6;
  rot7+=a7;
  rot8+=a8;
}

void tail(int x, int units, float angle) {
  pushMatrix();
  translate(x, 0);

  for (int i = units; i > 0; i--) {

    strokeWeight(sqrt(i/41));
    line(-i,0,i,0);
   fill(random(dist(targetX,targetY,posx,posy)/4,dist(targetX,targetY,posx,posy)/3),0,0);
    stroke(random(dist(targetX,targetY,posx,posy)/4,dist(targetX,targetY,posx,posy)/3),0,0);
    ellipse(-i,10,0.5,0.5);
       ellipse(i,10,0.5,0.5);
    strokeWeight(5);
   
    ellipse(20,20,sqrt(i),sqrt(i));
     fill(random(dist(targetX,targetY,posx,posy)/6,dist(targetX,targetY,posx,posy)/5),0,0);
    stroke(random(dist(targetX,targetY,posx,posy)/6,dist(targetX,targetY,posx,posy)/5),0,0);
    ellipse(10,10,0,0);
    translate(0, -10);
    rotate(angle);
  }
  popMatrix();
}

void mouseMoved() {
  //saveFrame("pulpo-###.png");

  targetX=mouseX;
  targetY=mouseY;
  foodiam=10;

  food=true;
}




