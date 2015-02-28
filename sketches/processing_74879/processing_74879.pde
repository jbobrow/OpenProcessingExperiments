
class Particle {   

float vy;   

float speed;  

   

float xPos;  

float yPos;   

   

   

   

   

float kx;   

float oldx, oldy;   

float w, h;   

float d, dx;   

float ky = random (0, 10);   

float kBounce, kkx, kSw;   

   

   

//*******************************************************************************  

void update() {   

   

vy+=speed;   

yPos+=vy;   

   

if (yPos > height-10) {   

vy = -(vy/(1*kBounce));   

   

kx = random (-5, 5);  

}   

   

   

if (vy < 1) {   

kx = random (0, 1);  

}  

}   

   

//******************************************************************************  

   

   

void render() {   

   

stroke (0,0,255); //rain colour  

strokeWeight(3); //thickness of rain  

line (xPos-kkx-kx, yPos, xPos+kkx+kx, yPos);  

}   

   

   

//****************************************************************************  

void init () {   

oldy = yPos = 0;   

oldx = xPos = random (0, width);   

speed = random (0.1, 1);   

kx=0;  

}  

}   

   

   

   

int p = 50;   

int frame;   

int kkx, kSw;   

Particle[] rain = new Particle [p];   

   

   

//******************************************************************************  

void setup () {   

size (600, 600);  

   

   

   

   

   

for (int i=0;i< p; i++) {   

rain[i] = new Particle();  

}   

   

   

for (int i=0;i< p; i++) {   

rain[i].init();  

}  

}   

   

   

//******************************************************************************  

void draw() {   

   

   

   

   

   

if (frameCount % 1 == 0) {   

frame++;   

int indice = frame % p;   

rain[indice].init();  

}   

   

   

fill(226, 252, 255); //background colour RBB mode  

noStroke();   

rect(0, 0, width, height);   

   

   

for (int i=0; i< p; i++) {   

rain[i].update();   

rain[i].render();  

}   

   

   

   

   

for (int i=0; i< p; i++) {   

rain[i].kkx=0.01;   

rain[i].kSw=0;   

rain[i].kBounce=3;  

}  

   

   

PImage imgCloud;  

imgCloud = loadImage("cloud.png");  

imgCloud.resize(0, 50);  

image(imgCloud, 150, 100);  

   

   

PImage imgCloud2;  

imgCloud2 = loadImage("cloud.png");  

imgCloud2.resize(0, 75);  

image(imgCloud2, 350, 175);  

   

   

   

PImage imgGrass;  

imgGrass = loadImage("grass.png");  

image(imgGrass, 0, 450);  

   

imgGrass = loadImage("grass.png");  

image(imgGrass, 300, 450);  

   

//**** FOR  MOUSE PRESSED  

   

if (mousePressed == true) {  

     

PImage img;   

     

//************************************************   flowers  

   

stroke(280, 500, 5, 130);  

fill(83, 151, 15); //background colour RBB mode  

rect(280, 470, 5, 130);  

   

   

img = loadImage("flower.png");  

image(img, 200, 430);  

   

   

   

//*************************************************  

stroke(280, 500, 5, 130);  

fill(83, 151, 15);   

rect(80, 470, 5, 130);  

   

img = loadImage("flower.png");  

image(img, 0, 430);  

   

//*************************************************  

   

stroke(280, 500, 5, 130);  

fill(83, 151, 15); //background colour RBB mode  

rect(580, 470, 5, 130);  

   

img = loadImage("flower.png");  

image(img, 500, 430);  

   

}  

   

} 


