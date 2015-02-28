
//Devon Nitz 
//Creative Code, Object assigment 


////////////////////////////////////////
//Color Changing Variables/Array Start//
///////////////////////////////////////

Ghost[] myGhost = new Ghost[25]; 

float r=255;
float g=255;
float b=255;


//////////////
//Void Setup//
//////////////

void setup(){
  frameRate(10);
 size(600, 800);
 background(180);
 smooth();
 for(int i=0; i<myGhost.length; i++) {
   myGhost[i] = new Ghost();
 }
 }
 
 /////////////
//Void Draw//
/////////////



 void draw() { 
for (int i=0; i<myGhost.length; i++) {
myGhost[i].fly();
myGhost[i].display(); 
}
}

//////////////////////////////////////
//Mouse Pressed (Goal is to have//////
//wings fly the object above   ///////
//and the screen with a //////////////
///gradual color change //////////////
//////////////////////////////////////


void mousePressed() {
Ghost [] myGhost = new Ghost (mouseX,mouseY);
myGhost.display();
}

 
/////////
//Class//
/////////

class Ghost {
int cx;
int cy;
int speed;
int span;

//consturctor
Ghost(int centerX, int centerY) {
  cx = centerX;
  cy = centerY;
  span= random(40,90);
  speed= random(2,10);
}

/*movements would go here also, click and 
the ghost moves around the boxed area*/

void display() {
  /*body wings*/
stroke(240);
fill(50);
ellipse(cx,cy,200,span);
/*body white*/
stroke(200);
fill(r,g,b);
ellipse(cx,cy,110,190);

/*Facial Features*/
fill(50);
ellipseMode(CENTER); 
 ellipse(cx,cy+40,30,30);
 ellipse(cx,cy,10,10);
/*eyes*/
 rectMode();
 rect(cx-30,cy-50,15,30);
 rect(cx+15,cy-50,15,30);  

 if(frameCount % 10 == 0){ // 
r=random(10,255);
    }
   }
}

/*
   
void fly() {
 if (cy<610) {
 cy++;} 
 else{
   cy--; }  }
   */ 
   
   /* Devon Nitz - The idea with my  creature is to have his wings flap to above the screen, 
   and when you click with the mouse, another reapears and repeats the process. I would also
   like to create a variety of sizes (and or gradual color changes)
   with either a mouse change or a different function. */





