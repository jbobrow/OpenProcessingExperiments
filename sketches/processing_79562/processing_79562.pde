
int timer = 0;
PFont font;

PImage bg;
PImage img;
PImage img2;
PImage img3;
PImage img4;
int killcount = 0;

int value = 0;

int batx = 630;
int baty = 250;

int bata = 640;
int batb = 240;

int batc = 650;
int batd = 260;

int bate = 630;
int batf = 260;

int batg = 620;
int bath = 234;

int bati = 645;
int batj = 260;

int batk = 630;
int batl = 250;

int batm = 630;
int batn = 250;


void setup () {
  size(800,350);
  strokeWeight(3);
   frameRate(30);

 

  img = loadImage("troll_2_05.png");
  img2 = loadImage("bat_up.png");
  img3 = loadImage("bat_down.png");
  img4 = loadImage("bat_gate.png");
  bg= loadImage("background.jpg");
}

void draw() {
  
    
   
   background(100);
  fill(value);
  image(bg,0,0);
    image(img,200,0);
     image(img2,batx-20,baty-25);
     image(img2,bata-20,batb-25);
     image(img2,batc-20,batd-25);
     image(img2,bate-20,batf-25);
     image(img2,batg-20,bath-25);
     image(img2,bati-20,batj-25);
     image(img2,batk-20,batl-25);
     image(img2,batm-20,batn-25);
     
    batx= batx-5;
    bata= bata-3;
    batc= batc-4;
    bate= bate-3;
    batg= batg-7;
    bati= bati-5;
    batj= batj-4;
    batk= batk-5;
    batm= batm-6;

    image(img4,200,0);
    
      timer +=3;
 

if (mousePressed == true) {
  if (dist(mouseX, mouseY, batx, baty)<20){
    killcount++;
    	println(killcount);
    text(killcount, 15,30);
batx = int(random(800));
baty = int(random(350));
    
}
if (mousePressed == true) {
  if (dist(mouseX, mouseY, bata, batb)<20){
    
bata = int(random(800));
batb = int(random(350));
  }
  
  if (mousePressed == true) {
  if (dist(mouseX, mouseY, batc, batd)<20){
    
batc = int(random(800));
batd = int(random(350));
  }
  
  if (mousePressed == true) {
  if (dist(mouseX, mouseY, bate, batf)<20){
    
bate = int(random(800));
batf = int(random(350));
  }
  
  if (mousePressed == true) {
  if (dist(mouseX, mouseY, batg, bath)<20){
    
batg = int(random(800));
bath = int(random(350));
  }
   
  if (mousePressed == true) {
  if (dist(mouseX, mouseY, bati, batj)<20){
    
bati = int(random(800));
batj = int(random(350));
  }
  
    if (mousePressed == true) {
  if (dist(mouseX, mouseY, batk, batl)<20){
    
batk = int(random(800));
batl = int(random(350));
  }

    if (mousePressed == true) {
  if (dist(mouseX, mouseY, batm, batn)<20){
    
batm = int(random(800));
batn = int(random(350));
  }
 line(mouseX,mouseY,500,90);
  stroke(#F00000);

  line(mouseX,mouseY,625,95);
  stroke(#F00000);
 // line(mouseX,mouseY,555,235);
 // stroke(#F00000);

 if(timer >100){
  
  timer =0;
    fill(0);
  } else {
     
    fill(255);
  }
 
  }
  //ellipse(batx, baty, 20,20);
    }
    
    }
}
    }
     }
     
}
}
}

