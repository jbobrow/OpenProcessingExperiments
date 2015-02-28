
PImage uni;
PImage astronaut;
PImage spaceship;
PImage planet;
PImage callisto;

float angle = 0;
float angle2 = 0;
float angle3 = 0;
float easing = 0.05;
float offset = 0;
float ellipseSize = 10;


boolean displayRect = false;

void setup() {
  smooth();
  size(1000, 770);
  imageMode(CENTER);
  uni = loadImage("uni.jpg");
  astronaut = loadImage("astronaut.png");
  spaceship = loadImage("spaceship.png");
  planet = loadImage("europa.png");
  callisto = loadImage("callisto.png");
  frameRate(35);
  

}
 
void draw() {
  pushMatrix();
  background(0);
  float d = random(100, 300);
  float blueX = random(100, 300);
  float g = random(-10, 10);
  popMatrix();
 
  //uni
  pushMatrix();
  image(uni, width/2, height/2);
  popMatrix();
 
  //spaceship
  pushMatrix();
  translate(mouseX, mouseY);
  angle+=.015;
  angle2+=.0125;
  angle3+=.05;
 
  float sinVal2 = 300 + sin(angle+0.05) *900;
  rotate(angle);
  image(spaceship, 0, 0, 200, 200);
  popMatrix();
   
  //astronaut
  pushMatrix();
  float orbit2 = cos(angle)*125;
  translate(orbit2, orbit2/4);
  translate(mouseX, mouseY);
  float ast = 55+ sin(angle+PI) * 55;
  rotate(angle+PI);
  image(astronaut, 0, 0, ast, ast);
  
  popMatrix();
  


  //callisto
  pushMatrix();
  float orbit3 = cos(angle)*55;
  translate(orbit3, orbit3/2);
  translate(mouseX, mouseY);
  float call = 55+ sin(angle+PI) * 55;
  rotate(angle+PI);
   image(callisto,0, 0, call, call);
   popMatrix();
 
   

}










