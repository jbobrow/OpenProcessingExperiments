
int cordX = 5;
int cordY = 100;
int diam = 80;
int vel = 4;

int cordX2 = 25;
int cordY2 = 300;
int diam2 = 40;
int vel2 = 2;

int cordX3 = 10;
int cordY3 = 340;
int side1 = 20;
int side2 = 20;



int star1 = 100;
int star2 = 100;
int vel3 = 3;

int street1 = 0;
int street2 =0;
int vel4 = 1;

PImage street;
PImage star;
float r,g,b;


void setup() {
  size(500, 400);
  frameRate(45);
  r = random(1,255);
  g = random(1,255);
  b = random(1,255);
  star = loadImage("star.png");
  street = loadImage("street.png");
    
}

void draw() {  
  colorMode(RGB, 255);
  for (int j=0; j<400; j++)
    for (int i=0; i<500; i++){
      stroke(180, 0, i);
      point(i, j);
  
  }
  image(street, street1, street2);
  noStroke();
  fill (r, g, b);
  ellipse (cordX, cordY, diam, diam);
  fill (b, r, g);
  ellipse (cordX2, cordY2, diam2, diam2);
  image(star, star1, star2);
  
  
  street1 = street1 - vel4;
   if(street1 == width){
     vel4 = vel4;
  }
   if((street1 > 0) || (street1 == -300)){
     vel4 = vel4*-1;
  }
  
   cordX = cordX + vel;
   if(cordX == width){
     vel = vel;
  }
     if(cordX > width){
     cordX = 0;
  }
  
  cordX2 = cordX2 + vel2;
   if(cordX2 == width){
     vel2 = vel2;
  }
     if(cordX2 > width){
     cordX2 = 0;
  }
  
  star1 = star1 + vel3;
   if(star1 == width){
     vel3 = vel3;
  }
    if(star1 > width){
     star1 = 0;
  }
}

