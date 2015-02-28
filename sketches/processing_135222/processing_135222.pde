
int p= 255;
 int n= 196;
 int k= 210;
 //Main Color Pink = p,n,k
 
 int a= 10; //SPOTS
 int w= 255; //SPOTS COLOR

float headWidth = 60;
float headHeight = 80;

int startX = 260;
int startY = 150;

int stopX = 260;
int stopY = -200;

float x = startX = startX;
float y = startY = startY;

float step = 0.005;
float pct = 0.0;

int time1 = 2000;
int time2 = 4000;
int time3 = 5000;
 
void setup() {
 size(800,600);
}

void draw() {
 int currentTime = millis();
 background(107,202,247);
 
 fill(0,150,0);
 stroke(100);
 smooth();
 
 if(currentTime > time2) {
 if(pct < 1.0) {
   x = startX + ((stopX - startX) * pct);
   y = startY + ((stopY - startY) * pct);
   pct += step;
 }
}
 
//Balloon   
 ellipse(x,y,headWidth,headHeight);//head
 line(x,y + headHeight/2,x,y + headHeight/2 + 150);//string
 fill(0,130,0);
 triangle(x,y + headHeight/2, x + 5, y + headHeight/2 + 5,x - 5, y + headHeight/2 + 5);//tie


//DOG 
translate(200,100);

//HAT
fill(255);
ellipse(136,170,80,90);
 
//LEGS
fill(255);
ellipse(210,360,20,60);
fill(255,121,157);
ellipse(170,350,20,60);
fill(p,n,k);
ellipse(420,360,20,60);
fill(203,249,255);
ellipse(380,350,20,60);
 
fill(255,233,209);
ellipse(210,300,150,120);
fill(255,246,193);
ellipse(400,300,150,120);
fill(p,n,k);
rect(210,240,80,120);
fill(203,249,255);
rect(280,240,10,120);
fill(255,121,157);
rect(290,240,110,120);
 
 
//FACE
fill(p,n,k);
ellipse(120,230,120,120);
 
//EYE
fill(0);
ellipse(90,210,20,20);
 
//NOSE
ellipse(65,250,10,10);

if(currentTime > time3) {
 fill(119,178,206);
 triangle(90,220,100,235,80,235); 
}

fill(255);
ellipse(310,270,a,a);
ellipse(375,290,a,a);
ellipse(305,342,a,a);
ellipse(350,320,a,a);
ellipse(375,338,a,a);
ellipse(320,300,a,a);
ellipse(355,260,a,a);
 
//Hat Front
fill(255);
ellipse(165,190,42,28);
ellipse(100,170,39,25);
ellipse(132,178,50,20);
 
//CONE
fill(185,151,122);
triangle(110,130,185,20,180,160);
line(110,130,182,60);
translate(-200, -100);

fill(40,180,80);
rect(0,480,800,480,800,600,0,600);
}



