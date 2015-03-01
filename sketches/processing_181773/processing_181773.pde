
//this is based off of the Sburb logo, from Homestuck, it sorta spins like it. 
//i made it change colors and move around, based on Shiff's lessons from the Learning Processing text
//i also added the old code for the sketch based off John Egbert, the shapes were a little too complicated for 
// my grasping of processing yet, i have yet to learn how to create custom shapes, 
//so this is just

float angle;
float jitter;
float spin = 5;
float sburbX;
float sburbY;

float sburbBlockR;
float sburbBlockbG;
float sburbBlockcB;
float s = 0.0;

int rectX = 152;
int rectY= 520;
int rect2X =352;
int rect2Y =520;


void setup () {
  size(1000,1400);
  smooth();
 
sburbX= width/2;
sburbY= height + 100;
  noStroke();
  fill (69,227,88);
  frameRate (30);
 
 }

void draw () {

  
 background(0,0,0);
  spin = spin + 0.01;
  s = cos(spin)*1;

 
 //small block

//move mouse changes colors, wow
 rect (199,173,95,95);
 fill(mouseX,0,mouseY);

 //big block
 //rect (152,302,180,180);

 rect (pmouseX,pmouseY,180,180);

 rect (152,520,180,180);
 rect (rectX, rectY, 180,180);
 rectX = rectX -2 ;


 
 //roof
 triangle (340, 142, 340,268, 592,268);
 
 //triangle (sburbX, sburbY, 340,268, 592,268);
 
 triangle (90, 286, 340,288, 340,160);

//rectangle

 


sburbBlockR = random (255);
sburbBlockbG = random (255);
sburbBlockcB = random (255);
fill (sburbBlockR, sburbBlockbG, sburbBlockcB); 

//box attached to small rectangle
rect (364,287,176,100);
//attached to box
rect (462,310,78,180);
//rect (rectX, rectY, 176,100);
//rectX = rectX 2 ;

//rect (352,520,180,180);

rect (sburbX-352,sburbY-310,78,180);
rect (sburbX+352,sburbY-310,78,180);
// big bottom block
rect (352,520,180,180);
rect (rect2X,rect2Y,180,180);
rect2X = rect2X +2 ;

if (second() % 2 == 0) {  
    jitter = random(0.2, -0.1);
  }
  //found this code on the website, don't understand why my square doesn't rotate properly
  angle = angle + jitter;
  float c = cos (angle);
  //i adjusted this to fix placement
  translate(width/3.4, height/3);
  scale(s); 
  rotate(c);
  rect (0,0,95,95); 
  
 //here lies my hopes and dreams
 //it took me so long just to make a triangle
 //like probably an hour until i reliazed do a graph 
 //and get the coordiantes like
 //wow are you stupid
 
 //heres my old code this was a in progess of a homestuck character, took waaaay to long to execuate
 //and I had no clue how to get the shapes right
 //size(1200,1400);
//background (300,500,200);
//strokeWeight(5);
//fill (200,200,200);
//strokeWeight(10);
//ellipse (170,400,170,250);
//strokeWeight(20);
//fill (252,254,250);
//line (248,450,100,450);
//rect (120,250,140,200);


//rect (120,250,100,100);
//strokeWeight(6);
//ellipse (200,250,300,230);
//rect (90,450, 160,76);
//rect (90,250, 100,50);
//rect (270,250, 100,50);
//line (200,315,250,315);

//ellipse (150,270,5,5);
//ellipse (300,270,5,5);

//noStroke();
//rect (110,370,140,75);
//rect (110,370,100,90);
//fill (100,100,100);
//rect (270,160, 100,50);
 
 
}

void mousePressed() {
 println( "LOADING! ");
  
   
        
}

