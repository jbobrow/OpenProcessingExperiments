
// Jade Tindal z3292874 - Class Wed 6-9pm with Linda

// DECLARE VARIABLES
PShape sew; // sewing machine
PShape star; // red star
PShape star2; // orange star
PFont type; //declare font

//declaring variables
float sewW, sewH;
float randomX, randomY;
float starW;
float starH;
float star2W;
float star2H;


//INITIAL SETTINGS

void setup (){
 smooth();
 size(600,600);
   
 //Loading of sewing machine and stars
 sew = loadShape("Sewing Machine.svg");
 star = loadShape ("Spark4.svg");
 star2 = loadShape ("Spark3.svg");
 
 //making the width and heights of shapes half their original size
 sewW = sew.width/2;
 sewH = sew.height/2;
 starW = star.width/2;
 starH = star.height/2;
 star2W = star2.width/2;
 star2H = star2.height/2;
 }

//REPEAT

void draw (){
 
 //background colour changing from white to grey to black
if(mouseX < width/3){
    background (255);
  }else if(mouseX < 2*width/3){
   background(153); 
  }
  else{
   background(0); 
  }

// sewing machine with mouse position centered
shape (sew, mouseX - sewW/2,mouseY - sewH/2, sewW, sewH);


//typeography
type = loadFont ("Consolas-Bold-30.vlw");//consolas bold font size 30
textFont (type, 32);
fill (0); //black text
text("My name is Jade.", 10,70);
fill(255); //white text
text ("...and this is my sewing machine.", 15, 150);
text("it can do AMAZING things!",50,560);
}
//When mouse is pressed, red star appears at random intervals
 void mousePressed(){
  randomX = random(1, width );
 randomY = random(1, height );
shape(star,randomX,randomY); 
 }

//When a key is pressed, orange star appears at random intervals
void keyPressed (){
 randomX = random(1, width );
 randomY = random(1, height );
shape(star2,randomX,randomY); 
 }



