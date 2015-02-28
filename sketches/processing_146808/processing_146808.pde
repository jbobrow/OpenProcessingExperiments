
boolean flipFlop = false;
int blackDiam;
int bun;
int pinkDiam;
int smallWhiteDiam;
int bangs1;
int head1;
int head2;
int eyesWhite;
float rand10;
float randNum;
float randNum2;

void setup(){
  size(300,300);
}

void draw(){
  background(255, randNum, randNum2);
  if (flipFlop == false){
    blackDiam = 50;
    bun = 70; 
    pinkDiam = 70;
    smallWhiteDiam = 20;
    head1 = 160;
    head2 = 190;
    bangs1 = 140;
    eyesWhite = 80;
   
  }
  else{
    blackDiam = 60;
    bun = 100;
    pinkDiam = 50;
    smallWhiteDiam = 10;
    head1 = 190;
    head2 = 210; 
    bangs1 = 160;
    eyesWhite = 75;
  }

//head
strokeWeight(7);
size(300,300);
translate(150,150);
fill(250,208,187);
ellipse(0,0,head2,head1);

//eyeswhite
strokeWeight(2);
fill(255,250,251);
ellipse(-50,-5,eyesWhite,eyesWhite);
ellipse(50,-5,eyesWhite,eyesWhite);

//eyespink
noStroke();
fill(255,93,117);
ellipse(-46,-4,pinkDiam,pinkDiam);
ellipse(46,-4,pinkDiam,pinkDiam);

rand10 = random(-10,10);
//eyesblack
noStroke();
fill(0,0,0);
ellipse(rand10 +(-41),-3,blackDiam,blackDiam);
ellipse(rand10 +(41),-3,blackDiam,blackDiam);
rand10 = random(-10,10);

//eyessmallwhite
noStroke();
fill(random(0,255),random(0,255),random(0,255));
ellipse(rand10 +(-37),-5,smallWhiteDiam,smallWhiteDiam);
ellipse(rand10 +(37),-5,smallWhiteDiam,smallWhiteDiam);

//mouth
stroke(0,0,0);
strokeWeight(3);
noFill();
arc(0, 45, 25, 25, 0, PI+QUARTER_PI, OPEN);

//hair
strokeWeight(2);
fill(160,82,44);
ellipse(0,-90,bun,bun);
ellipse(0,-60,bangs1,50);

//insidetriangle
fill(0,0,0);
triangle(50, 150, 150, 150, 150, 30);

//insidetriangle1
fill(0,0,0);
triangle(50, -150, 150, -150, 150, -30); 

//insidetriangle2
fill(0,0,0);
triangle(-50, 150, -150, 150, -150, 30); 

//insidetriangle3
fill(0,0,0);
triangle(-50, -150, -150, -150, -150, -30); 

//triangle
fill(random(0,255),random(0,255),random(0,255));
triangle(20, -250, 250, -250, 250, -10);
stroke(0);

//triangle1
fill(random(0,255),random(0,255),random(0,255));
triangle(-20, 250, -250, 250, -250, 10);

//triangle2
fill(random(0,255),random(0,255),random(0,255));
triangle(-20, -250, -250, -250, -250, -10);

//triangle3
fill(random(0,255),random(0,255),random(0,255));
triangle(20, 250, 250, 250, 250, 10);
stroke(0); 
}
   


void keyPressed(){
  flipFlop =! flipFlop;
  randNum = random(0,300);
  randNum2 =random(0,300); 
}


