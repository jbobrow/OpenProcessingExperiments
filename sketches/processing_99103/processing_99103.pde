
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
float a4 = 0.003;
float a5 = 0.0025;
float a6 = 0.0034;
float a7 = 0.014;
float a8 = 0.0028;
float rot1, rot2, rot3, rot4, rot5, rot6, rot7, rot8;
 
float easing=0.004;
float targetY;
float targetX;
 
 
 
void setup() {
  targetX=random(width);
  targetY=random(height);
  size(500, 500);
  stroke(0, 204);
  smooth();
  fondo = loadImage("fondo.png");
  rectMode(CENTER);
}
 
void draw() {
 
  image (fondo,0,0);
  //fill(255,90);
  // rect(250,250,width,height);
  //background(245,237,220);
  fill(111,54,185);
  //rect(0,0,width,height);
 
 
  if (food == true) {
    createFood(targetX, targetY);
    // createFood(targetX-5, targetY-5);
    // createFood(targetX-5, targetY+5);
  }
 
  if (dist(targetX,targetY,posx,posy) < 20) {
    targetX=random(width);
    targetY=random(height);
    foodiam=10;
    fadestroke=255;
    food=true;
  }
 
 
 
  inc += 0.006;
  float angle1 = sin(inc)/10.0 + sin (inc*4.5)/70.0;
  float angle2 = cos(inc)/12.0 + cos (inc*4.5)/80.0;
 
  angle3+=0.007;
 
  //posx=250+cos(angle3)*100+sin(angle3)*100;
  //posy=250+tan(cos(angle3))*100+cos(angle3)*25;
 
 
  posx += (targetX-posx)*easing;
  posy += (targetY-posy)*easing;
  stroke(0, 204);
  translate(posx,posy);
  tail(0, 24, angle1*4);
  rotate(sin(rot1)+QUARTER_PI);
  tail(0, 21, angle1*2.7);
  rotate(cos(rot2)+QUARTER_PI);
  tail(0, 18, angle2*5.5);
  rotate(rot3+QUARTER_PI);
  tail(0, 17, angle1*3);
  rotate(sin(rot4+QUARTER_PI));
  tail(0, 19, angle2*4.2);
  rotate(atan(rot5)+QUARTER_PI);
  tail(0, 20, angle1*2.4);
  rotate(sin(rot6)+QUARTER_PI);
  tail(0, 24, angle2*3);
  rotate(cos(rot7)+QUARTER_PI);
  tail(0, 25, angle1*3.2);
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
 
    strokeWeight(sqrt(i/6));
    line(-i,0,i,0);
    fill(255);
    ellipse(-i,0,2,2);
    ellipse(i,0,2,2);
    strokeWeight(i/1.7);
    fill(111,54,185);
    ellipse(0,0,sqrt(i),sqrt(i));
    line(0,0,0,-8);
    translate(0, -10);
    rotate(angle);
  }
  popMatrix();
}
 
void mousePressed() {
  //saveFrame("pulpo-###.png");
  targetX=mouseX;
  targetY=mouseY;
  foodiam=10;
  fadestroke=255;
  food=true;
}
 
void createFood(float locationX, float locationY) {
  fill(0);
  ellipse(locationX, locationY,3+abs(cos(anglefood)*3),3+abs(cos(anglefood)*3));
  fill(0,10);
  ellipse(locationX, locationY,abs(cos(anglefood)*2),abs(cos(anglefood)*2));
  noFill();
  stroke(0,80);
  ellipse(locationX, locationY,10+abs(cos(anglefood+QUARTER_PI)*3),10+abs(cos(anglefood+QUARTER_PI)*3));
  if (foodiam < 220) {
    noFill();
    stroke (0,fadestroke);
    ellipse(locationX, locationY, foodiam,foodiam);
    foodiam++;
    fadestroke-=2;
  }
  anglefood+=map(dist(targetX,targetY,posx,posy),0,300,0.2,0.01);
}
