
int center =    100;
int groundLocation = 190;
int pebble = 10;
int plant = 180;

int bodywidth = 77;

int R = 234;

int tx1 = 75;
int ty1 = 80;
int tx2 = 103;
int tx3 = 130;
int tdiam = 20;


int nuby = 70;
int nubwidth = 20;
int nubheight = 10;
int eye = 10;
int pupil = 4;
int bubbleY = 100;

int fishx = 0;
int speed=1;

float hookx = 25;
float hooky = 0;




void setup() {

  size(200,200);
  ellipseMode(CENTER);
  rectMode(CENTER);
  noStroke();
  smooth();
  frameRate(5);

  
}

void draw() {
  
  
  background(24,196,214);
    
//ground

    fill(77,62,22);
    rect(100,groundLocation+5,200,pebble);
    ellipse(25,groundLocation,pebble+10,pebble+10);
    ellipse(10,groundLocation,pebble+5,pebble+5);
    ellipse(45,groundLocation,pebble,pebble);
    ellipse(3,groundLocation,pebble,pebble); 
    ellipse(groundLocation,groundLocation,pebble+10,pebble);
    ellipse(175,groundLocation,pebble,pebble);
    ellipse(120,groundLocation,pebble+10,pebble);
    ellipse(90,groundLocation,pebble,pebble-5);

//plant

    fill(1,98,11);
    strokeWeight(2);
    stroke(1,98,11);
    
    ellipse(plant,160,20,20);
    ellipse(plant,132,15,15);
    ellipse(plant,110,10,10);
    line(plant,100,180,190);
   

//body

    noStroke();
    fill(R,mouseX,mouseY);
    ellipse(center,45,bodywidth,bodywidth);
    rect(center,60,bodywidth,22);
    fill(24,196,214);
    rect(center,bodywidth,80,14);

//twirlies

//first twirly

    
    fill(R,mouseX,mouseY);
    ellipse(tx1,80,tdiam,tdiam);
    fill(24,196,214);
    ellipse(tx1+3,80,tdiam,tdiam);

    fill(R,mouseX,mouseY);
    ellipse(tx1,100,tdiam,tdiam);
    fill(24,196,214);
    ellipse(tx1-3,100,tdiam,tdiam);

    fill(R,mouseX,mouseY);
    ellipse(tx1,120,tdiam,tdiam);
    fill(24,196,214);
    ellipse(tx1+3,120,tdiam,tdiam);

    fill(R,mouseX,mouseY);
    ellipse(tx1,140,tdiam,tdiam);
    fill(24,196,214);
    ellipse(tx1-3,140,tdiam,tdiam);

    fill(R,mouseX,mouseY);
    ellipse(tx1,160,tdiam,tdiam);
    fill(24,196,214);
    ellipse(tx1+3,160,tdiam,tdiam);

    fill(R,mouseX,mouseY);
    ellipse(tx1,180,tdiam,tdiam);
    fill(24,196,214);
    ellipse(tx1-3,180,tdiam,tdiam);

//second twirly

    fill(R,mouseX,mouseY);
    ellipse(tx2,85,tdiam,tdiam);
    fill(24,196,214);
    ellipse(tx2-3,85,tdiam,tdiam);

    fill(R,mouseX,mouseY);
    ellipse(tx2,105,tdiam,tdiam);
    fill(24,196,214);
    ellipse(tx2+3,105,tdiam,tdiam);

    fill(R,mouseX,mouseY);
    ellipse(tx2,125,tdiam,tdiam);
    fill(24,196,214);
    ellipse(tx2-3,125,tdiam,tdiam);

    fill(R,mouseX,mouseY);
    ellipse(tx2,145,tdiam,tdiam);
    fill(24,196,214);
    ellipse(tx2+3,145,tdiam,tdiam);

//third twirly

    fill(R,mouseX,mouseY);
    ellipse(tx3,70,tdiam,tdiam);
    fill(24,196,214);
    ellipse(tx3+3,70,tdiam,tdiam);
    
    
    fill(R,mouseX,mouseY);
    rect(tx3-3,65,20,10);
    fill(234,mouseX,mouseY);
    ellipse(tx3,90,tdiam,tdiam);
    fill(24,196,214);
    ellipse(tx3-3,90,tdiam,tdiam);

    fill(R,mouseX,mouseY);
    ellipse(tx3,110,tdiam,tdiam);
    fill(24,196,214);
    ellipse(tx3+3,110,tdiam,tdiam);

    fill(R,mouseX,mouseY);
    ellipse(tx3,130,tdiam,tdiam);
    fill(24,196,214);
    ellipse(tx3-3,130,tdiam,tdiam);

    fill(R,mouseX,mouseY);
    ellipse(tx3,150,tdiam,tdiam);
    fill(24,196,214);
    ellipse(tx3+2,150,tdiam,tdiam);

    fill(R,mouseX,mouseY);
    ellipse(tx3,170,tdiam,tdiam);
    fill(24,196,214);
    ellipse(tx3-3,170,tdiam,tdiam);

//legs
    
    strokeWeight(1);
    stroke(155,10,196);
    line(71,70,71,175);
    line(87,70,87,125);
    line(103,70,103,125);
    line(118,70,118,150);
    line(134,70,134,150);

    stroke(255);
    line(63,70,63,150);
    line(79,70,79,150);
    line(95,70,95,150);
    line(110,70,110,175);
    line(126,70,126,175);

//nubs

  noStroke();
  fill(R,mouseX,mouseY);
  ellipse(71,nuby,nubwidth,nubheight);
  ellipse(90,nuby,nubwidth,nubheight);
  ellipse(109,nuby,nubwidth,nubheight);
  ellipse(128,nuby,nubwidth,nubheight);

//eyes

  fill(255);
  ellipse(110,55,eye,eye);
  ellipse(125,55,eye,eye);
  fill(155,10,196);
  ellipse(110,55,pupil,pupil);
  ellipse(125,55,pupil,pupil);

//mouth

  fill(59,1,47);
  ellipse(127,67,6,4);

//monacle

  stroke(0);
  noFill();
  ellipse(125,55,15,15);

//hat

  stroke(59,1,47);
  strokeWeight(3);
  fill(59,1,47);
  quad(65,10,74,18,84,10,75,2);
  strokeWeight(4);
  line(70,23,90,8);

//spots

  noStroke();
  fill(255);

  ellipse(100,10,4,2);
  ellipse(110,15,5,2);
  ellipse(85,20,6,3);
  ellipse(96,15,4,2);
  ellipse(120,18,5,2.5);

//bubbles

  noStroke();
  fill(255);
  
  ellipse(mouseX,mouseY,10,10);
  ellipse(pmouseX,pmouseY,6,6);
  ellipse(pmouseX+10,pmouseY-10,3,3);
  
  //fish
  
   if (keyPressed) {
     frameRate(80);
   fill(255,255,0);
   ellipse(fishx,mouseY,16,10);
   ellipse(fishx-10,mouseY,5,15);
   fill(0);
   ellipse(fishx+3,mouseY,2,2);
   
   fill(255,255,0);
   ellipse(fishx-25,mouseY-20,11,6);
   ellipse(fishx-30,mouseY-20,3,10);
   fill(0);
   ellipse(fishx-23,mouseY-20,2,2);
   
   fill(255,255,0);
   ellipse(fishx-40,mouseY,12,7);
   ellipse(fishx-47,mouseY,3,10);
   fill(0);
   ellipse(fishx-37,mouseY,2,2);

    fishx = fishx+speed;
   }
    
    if ((fishx > width || fishx < 0)) {
      speed = speed * -1;
    
    }
    
//hook

    
    if(mousePressed) {
      stroke(0);
      strokeWeight(1);
      line(hookx,hooky-100,hookx,hooky+2);
      fill(24,196,214);
      ellipse(hookx+5,hooky+2,10,10);
      noStroke();
      rect(hookx+5.65,hooky,10,7);
      hooky = hooky+1;
      noStroke();
    }
    
 if(hooky >= 100) {
   
 hooky = 100;
 }
   }


                                
