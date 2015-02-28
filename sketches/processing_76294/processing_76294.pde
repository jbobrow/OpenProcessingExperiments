
// Alex Zajicek, Hw #6, Starmaker

float angle;
float stars;
int mode = 0;
float a;
float b;
float c;

void setup(){
  size(800, 600);
  colorMode(HSB, 360, 100, 100, 100);
  angle = 0;
  stars = 0;
  mode = 0;
  background(0, 0, 0);
  smooth();
}

void draw(){
  if(mode == 0){
    Mode1();
    fill(360, 0, 100);
    rect(0, 0, 25, 25);
    fill(360, 100, 100);
    text("1", 15, 15);
  } else if (mode == 1){
    Mode2();
    fill(360, 0, 100);
    rect(0, 0, 25, 25);
    fill(360, 100, 100);
    text("2", 15, 15);
  }
  float a;
  float b;
  float c;
  a = 255*cos(tan(radians(stars)));
  b = 255*sin(radians(stars));
  c = 25*tan(cos(tan(radians(stars))));
  
  fill(0, 0, 100);
  myStar2(stars+a, b+height/2);
  myStar2(stars, c*7+height/2);
  stars++;
  
  if ((keyPressed==true)&&(key=='r')){
    background(0, 0, 0);
    a = 0;
    b = 0;
    c = 0;
  }
}

void keyReleased(){
  if(mode == 0){
    mode = 1;
  } else if(mode == 1){
    mode = 0;
  }
}
void Mode1(){
  if(mousePressed){
    myStar(mouseX, mouseY);
  }
}

void Mode2(){
  if(mousePressed){
    Planet(mouseX, mouseY);
  }
}

void myStar(float x, float y){
  angle = angle + 180;
  float starSize;
  starSize = random(15);
  pushMatrix();
  translate(x, y);
  rotate(radians(180));
  //ellipse(100*sin(radians(angle)), 100*cos(radians(angle)), 5, 5);
  fill(47, 57, 95, random(100));
  beginShape();
    for(int i = 0; i < 360*2+1; i = i + 144){
    vertex(starSize*sin(radians(i)), starSize*cos(radians(i)));
    }
  endShape();
  popMatrix();
}

void myStar2(float x, float y){
  float starSize;
  float starLight;
  starSize = random(7);
  starLight = random(100);
  noStroke();
  fill(0, 0, 100, starLight);
  ellipse(x, y, starSize, starSize);
}

void Planet(float x, float y){
  float planetSize;
  float planetLight;
  planetSize = random(20);
  planetLight = random(100);
  pushMatrix();
  translate(mouseX-width/2, mouseY-height/2);
  x = 100*cos(radians(angle));
  y = 100*sin(radians(angle));
  
  noStroke();
  fill(28, 56, 44, planetLight);
  ellipse(x+width/2, y+height/2, planetSize, planetSize);
  angle = angle+10;
  popMatrix();
}

