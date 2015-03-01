
/*Game idea: 
Humanity is forced into Space in a  never ending hunt for more resources
to fuel their insatiable appetite.

Your team has found a cluster of planets overflowing with harvestable resources.

Choose wisely as some planets are not so receptive to Earth's claims on their home.*/


PImage img;
PFont font;

int value=255;
int b=5;
int b1=7;
int f=100;

int score;
int life =3;

int plop = 1;
int planet=1;
boolean gameOver = false;
boolean gameWon = false;
boolean startscreen = false;



void setup(){
  size(640,480);
  
  img = loadImage("spaceship.png");
  font = loadFont("Krungthep-48.vlw");
  
  noCursor();
  frameRate(1);
  background(0,0,0);
}


  

void draw(){


    
  noStroke();
  fill(0,0,0);
  rect(0,0, 640, 480);
  
  
  //stars
  frameRate(10);
   fill(255,248,209);
  noStroke();
  ellipse(random(640), random(480), 3, 3);
  ellipse(random(640), random(480), 3, 3);
  ellipse(random(640), random(480), 3, 3);
  ellipse(random(640), random(480), 3, 3);

if (planet==1){
  //Green Planets (5 points)
  noStroke();
  fill(random(200),255,random(255));
  ellipse(100,110, 23,23); //1
  ellipse(120,410, 20,20); //2
  ellipse(495,320, 21,21); //3
  ellipse(300,50, 20,20); //4
  ellipse(400,520, 25,25); //5
  ellipse(490,120, 20,20); //6
  ellipse(600,205, 22,22); //7
  ellipse(200,340, 20,20); //8
  
  
  
  //Yellow Planets (1 point)
  fill(255, random(200,255),random(255));
  ellipse(200,150, 23,23); //1
  ellipse(580,400, 20,20); //2
  ellipse(550,60, 21,21); //3
  ellipse(80,300, 20,20); //4
  ellipse(300,240, 25,25); //5
  ellipse(350,400, 20,20); //6
  ellipse(200,25, 22,22); //7
  ellipse(380,150, 20,20); //8
  
  
  //Red Planets (-1 life)
  fill(255, random(150),random(100));
  ellipse(50,50, 23,23); //1
  ellipse(490,435, 20,20); //2
  ellipse(570,135, 21,21); //3
  ellipse(160,230, 20,20); //4
  ellipse(380,330, 25,25); //5
  ellipse(460, 220, 20,20); //6
  ellipse(425,45, 22,22); //7
  ellipse(240,450, 20,20); //8
}
  
  //spaceship!
  //image(nameofimage,x,y,width,height)
  image(img, mouseX-70, mouseY-25, 70, 50);
 
//points and life at top of screen
noStroke();
fill(255);
//points
rect(50,0, 150, 35);
//life
rect(430,0, 150, 35);


//points text
fill(0);
textFont(font,20);
textAlign(LEFT, LEFT);
text("Plunder  "+score,60,25);
//life text
text("Life   "+life, 440,25);


  if (life == 0){
    gameOver = true;}
  
  if (gameOver) {
    fill(0);
    rect(0,0,640,480);
    fill(255);
   textFont(font, 20);
   textAlign(LEFT);
  text("Your Team has Failed",50,210);
  text("No one will remember your name",50,250);

  }

if (score >= 25){
  gameWon = true;}
  
  if (gameWon){
    fill(0);
    rect(0,0,640,480);
    fill(255);
    textFont(font,20);
    textAlign(LEFT);
    text("Your Team has Plundered All the Resources!", 50,210);
    text("You Have Returned Home a Hero!", 50,250);}
  
  
  
//intro text
if (plop == 1){
  startscreen = true;}
if (startscreen == true){ 
  fill(0);
  rect(0,0,640,480);
  fill(255);
textFont(font,16);
textAlign(LEFT);
text("A team of explorers from Earth",30,110);
text("has traveled into space to scour for additional resources",30,130);
text("in the neverending hunt to fuel Earth's lust.",30,150);
text("Your team has found a cluster of", 30,190);
text("planets overflowing with bounty!", 30,210);
text("Choose wisely.", 30,250);
text("Not all planets are receptive to Earth's claims on their home.", 30,270);
textFont(font,24);
textAlign(CENTER);
fill(255, random(150),random(100));
text("Click to Conquest", width/2,370);
}

if (plop == 2){
  startscreen=false;}
  
  if (startscreen==false){
    fill(0,0,0,0);
    rect(0,0,640,480);}
 
  
} 




void mouseClicked() {
  frameRate(5);
int X = mouseX;
int Y = mouseY;

plop=2;

//For Green Planets!
if (X>=190 && X<=210 && Y>=140 && Y<=160 && score<25){ 
score=score+=1;} //1
if (X>=570 && X<=590 && Y>=390 && Y<=410 && score<25){ 
score=score+1;
} //2
if (X>=540 && X<=560 && Y>=50 && Y<=70 && score<25){ 
score=score+1;
} //3
if (X>=70 && X<=90 && Y>=290 && Y<=310 && score<25){ 
score=score+1;
} //4
if (X>=290 && X<=310 && Y>=230 && Y<=250 && score<25){ 
score=score+1;
} //5
if (X>=340 && X<=360 && Y>=390 && Y<=410 && score<25){ 
score=score+1;
} //6
if (X>=190 && X<=210 && Y>=15 && Y<=35 && score<25){ 
score=score+1;
} //7
if (X>=370 && X<=390 && Y>=140 && Y<=160 && score<25){ 
score=score+1;
} //8


//For Yellow Planets!
if (X>=80 && X<=120 && Y>=90 && Y<=130 && score<25){ 
score=score+=5;} //1
if (X>=100 && X<=140 && Y>=390 && Y<=430 && score<25){ 
score=score+5;
} //2
if (X>=485 && X<=505 && Y>=310 && Y<=330 && score<25){ 
score=score+5;
} //3
if (X>=290 && X<=310 && Y>=40 && Y<=60 && score<25){ 
score=score+5;
} //4
if (X>=390 && X<=410 && Y>=510 && Y<=530 && score<25){ 
score=score+5;
} //5
if (X>=480 && X<=500 && Y>=110 && Y<=130 && score<25){ 
score=score+5;
} //6
if (X>=590 && X<=610 && Y>=195 && Y<=515 && score<25){ 
score=score+5;
} //7
if (X>=190 && X<=210 && Y>=330 && Y<=350 && score<25){ 
score=score+5;
} //8

//For Red Planets!
if (X>=40 && X<=60 && Y>=40 && Y<=60 && life>=1){
life=life-=1;} //1
if (X>=480 && X<=500 && Y>=425 && Y<=445 && life>=1){ 
life=life-1;
} //2
if (X>=560 && X<=580 && Y>=125 && Y<=145 && life>=1){ 
life=life-=1;
} //3
if (X>=150 && X<=170 && Y>=220 && Y<=240 && life>=1){ 
life=life-=1;
} //4
if (X>=370 && X<=390 && Y>=320 && Y<=340 && life>=1){ 
life=life-=1;
} //5
if (X>=450 && X<=470 && Y>=210 && Y<=230 && life>=1){ 
life=life-=1;
} //6
if (X>=415 && X<=435 && Y>=35 && Y<=55 && life>=1){ 
life=life-=1;
} //7
if (X>=230 && X<=250 && Y>=440 && Y<=460 && life>=1){ 
life=life-=1;
} //8
else {
  score=score+0;}

  
  
  
 //these are harvesting rays! 
  fill(255,0,0);
  ellipse(mouseX,mouseY, 5,5);
  ellipse(mouseX+=b,mouseY, 5,5);
  ellipse(mouseX+=b1,mouseY, 5,5);
  if (value == 255) {
    value = 255;
  } else {
    value = 0;
  }


  

  
  }



   




