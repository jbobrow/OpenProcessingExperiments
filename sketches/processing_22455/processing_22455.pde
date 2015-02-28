
float angle = 0.0;
float offset = 300;
float scalar = 30;
float speed1 = 0.5;
float speed2 = 0.5;
float e=110;

int radius=40; 
int direction=1; 

PImage elephant; 
PImage tree;

void setup() {
  size (500,500); 
  smooth();
  noStroke(); 
  background(255);
  ellipseMode(RADIUS);
  elephant = loadImage("elephant.png");
  tree = loadImage("tree.png");
  fill(0);
  rect(0,390,500,100);
}

void draw () { 
  //movement elephant
  //background(0);
  e+=speed2*direction;
  if((e> width-radius)||(e<radius)) {
    direction=-direction;
  }
  
      if(direction==1) {
        fill(255); 
        image(elephant,e,235,elephant.width/1.5, elephant.height/1.5);
        fill(255);
      }
      else {
        fill(255);
         image(elephant,e,235,elephant.width/1.5, elephant.height/1.5);
        fill(255);
      }
  
  float x = offset + cos(angle) * scalar;
  float y = offset + sin(angle) * scalar;
  stroke(250,164,25);
  fill(255,211,88,100);
  ellipse(x-100, y-200, 40, 40);
  angle += speed1;
  
  //image(elephant,120,150,elephant.width/1.5, elephant.height/1.5);
  image(tree,-50,140,tree.width/2,tree.height/2);
}


