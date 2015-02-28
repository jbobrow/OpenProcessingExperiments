
float sheep=10;
/* 
labels shape and action with a common phrase
*/
  void setup() {
    size(500,500);
  smooth();
ellipseMode(CENTER);
  }
   
  void draw () {
 
background(255);
/* 
shape size and color layed 
 */
if (mousePressed){
sheep = sheep+1.5;
translate (random(10,20),random(10,20));
  }
  /*
  when mouse clicked the initial shape grows exponenilally
  */

fill(255);
rect (mouseX,mouseY,40,60);
fill(255);
rect (mouseX+60,mouseY,40,60);
 
fill(255);
rect (mouseX,mouseY,random(10,15),random(10,15));
fill(255);
rect(mouseX+60,mouseY,random(10,15),random(10,15));
/*
the post click shapes get color and size
*/
fill(0);
if(mousePressed) rect (mouseX,mouseY,random(100+sheep,120+sheep),random(100+sheep,120+sheep))  ;
fill(0);
if(mousePressed)  rect (mouseX+60,mouseY,random(100+sheep,120+sheep),random(100+sheep,120+sheep));
fill(255);
if(mousePressed) rect (mouseX,mouseY,random(100,50),random(100,50))  ;
fill(255);
if(mousePressed) rect (mouseX+60,mouseY,random(40,50),random(40,50))  ;

// Augen still
fill(0);
 
rect (mouseX,mouseY,30,30);
rect (mouseX+60,mouseY,30,30);
/*
the shapes continue to grow and shake dramatically
*/
   //Mund
   fill(255);
if(mousePressed)  rect (mouseX+30,mouseY+60,4+sheep/6,10+sheep/6);
}
/*
credit to Monster by Lukas Sommer
*/


