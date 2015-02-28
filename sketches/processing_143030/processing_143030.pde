
//Devon Nitz
//Creative Code, Object assigment
 
 
////////////////////////////////////////
//Color Changing Variables/Array Start//
///////////////////////////////////////
 
Ghost[] ghosts;
 

 
 
//////////////
//Void Setup//
//////////////
 
void setup(){
 frameRate(20);
 size(800, 800);

 smooth();
 ghosts = new Ghost[0];
 /*for(int i=0; i<myGhost.length; i++) {
   myGhost[i] = new Ghost();
 }*/ 
 }
  
 /////////////
//Void Draw//
/////////////
 
 
 
 void draw() {
    background(245);
  for (int i=0; i<ghosts.length; i++) {
  ghosts[i].fly();
  ghosts[i].display();
 }
}
 
//////////////////////////////////////
//Mouse Pressed (Goal is to have//////
//wings fly the object above   ///////
//and the screen with a //////////////
///gradual color change //////////////
//////////////////////////////////////
 
 
void mousePressed() {
Ghost myGhost = new Ghost (mouseX,mouseY);
myGhost = (Ghost[]) append(ghosts,myGhost);

}
  
/////////
//Class//
/////////
 
class Ghost {
int cx;
int cy;
int speed;
int span;
int ghostSize;
float r=255;
float g=255;
float b=255;

//consturctor
Ghost(int centerX, int centerY) {
  cx = centerX;
  cy = centerY;
  span= random(40,90);
  speed= random(.5,3);
  ghostSize= random(.20,.90);

}
 
/*movements would go here also, click and
the ghost moves around the boxed area*/
 
void display() {
  
  pushMatrix();
  
  /* scales entire creature*/
  translate(cx,cy);
  scale(ghostSize);
translate(-cx,-cy);

  /*shadow of body*/
  noStroke();
fill(200,200,200,40);
ellipse(cx,cy,120,190);
 
  /*body wings*/
stroke(161,222,239);
fill(213,240,248);
ellipse(cx,cy,200,span);

stroke(161,222,239,120);
noFill();
ellipse(cx,cy,200,span-10);

/*body wings details*/
noStroke();
fill(161,222,239,160);
ellipse(cx,cy,200,span-25);
fill(213,240,248,160);
ellipse(cx,cy,200,span-65);


/*body white*/
stroke(220);
fill(r,g,b);
ellipse(cx,cy,110,190);
stroke(240);
fill(250,250,250,80);
ellipse(cx,cy,100,190);
fill(250,250,250,60);
ellipse(cx,cy,80,190);
fill(250,250,250,40);
ellipse(cx,cy,50,190);
fill(250,250,250,30);
ellipse(cx,cy,30,190);
fill(250,250,250,20);
ellipse(cx,cy,10,190);

/*Facial Features*/
noStroke();
fill(50);
ellipseMode(CENTER);
 ellipse(cx,cy+40,30,30);
 ellipse(cx,cy,10,10);
 
/*eyes*/
 ellipse(cx-23,cy-35,30,50);
 ellipse(cx+23,cy-35,30,50); 
 
 //eyeballs
fill(255);
ellipse(cx-20,cy-35,10,20);
ellipse(cx+20,cy-35,10,20);
fill(252,252,252,20);
ellipse(cx-20,cy-35,25,40);
ellipse(cx+20,cy-35,25,40);

/*color change*/ 
if(frameCount % 20 == 0){ 
r=random(10,200);
g=random(100,140);
b=random(100,200);
span=random(40,90);
    }
    
    popMatrix();
    
   }


    
 void fly() {
 if (cy>-200) {
 cy=cy-speed; 

 }
 
 else {
   cy=height; 
 
 } 
 }
  }



