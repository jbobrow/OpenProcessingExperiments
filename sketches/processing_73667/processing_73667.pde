
//Name: Yasmeen Almuhanna
//Introduction to Digital Media Fall 2012
//Section: A
//Date: 09/11/12

float randomDiameter=0; //Global variable - integer
float strokeGrey=0; // Global variable -line
float mx;
float my;

float a = random(0,255);
float b = random(0,255);
float c = random(0,255);
int l_color = color(a,b,c);


int radius = 24;
int edge = 56;
int inner = edge + radius;
float x;
float y;
float targetX, targetY;
float easing = 0.05;


void setup() {
  smooth();
  
  size(1200, 600);
 
  
}

void draw() {
  background (255);
  
   line(0,5,mouseX,mouseY);
  line(50,5,mouseX,mouseY);
  line(100,5,mouseX,mouseY);
  line(150,5,mouseX,mouseY);
  line(200,5,mouseX,mouseY);
  line(250,5,mouseX,mouseY);
  line(300,5,mouseX,mouseY);
  line(350,5,mouseX,mouseY);
  line(400,5,mouseX,mouseY);
  line(450,5,mouseX,mouseY);
  line(500,5,mouseX,mouseY);
  line(550,5,mouseX,mouseY);
  line(600,5,mouseX,mouseY);
  line(5,600,mouseX, mouseY);
  line(55,600,mouseX,mouseY);
  line(100,600,mouseX,mouseY);
  line(150,600,mouseX,mouseY);
  line(200,600,mouseX,mouseY);
  line(250,600,mouseX,mouseY);
  line(300,600,mouseX,mouseY);
  line(350,600,mouseX,mouseY);
  line(400,600,mouseX,mouseY);
  line(450,600,mouseX,mouseY);
  line(500,600,mouseX,mouseY);
  line(550,600,mouseX,mouseY);
  line(600,600,mouseX,mouseY);
  line(0,50,mouseX,mouseY);
  line(0,100,mouseX,mouseY);
  line(0,150,mouseX,mouseY);
  line(0,200,mouseX,mouseY);
  line(0,250,mouseX,mouseY);
  line(0,300,mouseX,mouseY);
  line(0,350,mouseX,mouseY);
  line(0,400,mouseX,mouseY);
  line(0,450,mouseX,mouseY);
  line(0,500,mouseX,mouseY);
  line(0,550,mouseX,mouseY);
  line(0,600,mouseX,mouseY);
  line(1200,50,mouseX,mouseY);
  line(1200, 100,mouseX, mouseY);
  line(1200,150,mouseX, mouseY);
  line(1200,200, mouseX, mouseY);
  line(1200, 250, mouseX, mouseY);
  line(1200, 300, mouseX, mouseY);
  line(1200, 350,mouseX, mouseY); 
  line(1200,400, mouseX, mouseY);
  line(1200,450, mouseX, mouseY);
  line(1200, 500, mouseX, mouseY);
  line(1200, 550, mouseX, mouseY);
  line(1200, 600, mouseX, mouseY);
  
  
  
  targetX = mouseX;
  float dx = targetX - x;
  if(abs(dx) > 1) {
    x += dx * easing;
  }
  
  targetY = mouseY;
  float dy = targetY - y;
  if(abs(dy) > 1) {
    y += dy * easing;
  }
 fill(255,0,0); 
 quad(x, y, 86, 20, 69, 63, 30, 76);
 
 stroke (85,35,185);
 strokeWeight (4);

noFill();
arc(mouseX, mouseY, 160, 160, HALF_PI, PI);

arc(mouseX, mouseY, 180, 180, PI+QUARTER_PI, TWO_PI);
  

  noStroke(); //to make the bubbles gradually disappear
  fill(255,10);
  rect(0,0,width,height);
  
  stroke(strokeGrey);
  strokeWeight(3.5);
  fill(255, 204, 0);

  if (randomDiameter<100) {
    randomDiameter++;
  }
  else {
    randomDiameter=0;
  }

  ellipse(mouseX, mouseY, randomDiameter, randomDiameter);
}


void mouseClicked() {
  if (strokeGrey==0) { //conditional, if stroke key is black change it to white
    strokeGrey=255;
  }
  else {
    strokeGrey = 0;
    if(l_color == color(a,b,c)) {
    l_color = color(c,a,b);
  }else{
    l_color = color(b,c,a);
  }
  a = random(0,255);
  b = random(0,255);
  c = random(0,255);
    
   
    
  }
}


