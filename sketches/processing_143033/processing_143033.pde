
//Devon Nitz
//Creative Code, Object assigment

////////////////////////////////////////
//Color Changing Variables/Array Start//
///////////////////////////////////////
 
Ghost[] ghosts = new Ghost[20];


 
 
//////////////
//Void Setup//
//////////////
 
void setup(){
 frameRate(20);
 size(800, 800);
 smooth();
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
 
/*
void mousePressed() {
Ghost myGhost = new Ghost (mouseX,mouseY);
myGhost = (Ghost[]) append(ghosts,myGhost);

}
*/ 

/////////
//Class//
/////////
 
class Ghost {
//int cx;
//int cy; 
float Xbody; //x placement
float Ybody; //y placement
int speed;
int span;
int ghostSize;
float r=255;
float g=255;
float b=255;

//consturctor
Ghost() {
 // cx = width;
//  cy = -20;
 bodyX = random(50,750);
 bodyY = 0;
  span= random(40,90);
  speed= random(.5,4);
  ghostSize= random(.20,.90);

}
 
/*movements would go here also, click and
the ghost moves around the boxed area*/
 
void display() {
  
  pushMatrix();
  
  /* scales entire creature*/
  translate(bodyX,bodyY);
  scale(ghostSize);
translate(-bodyX,-bodyY);

  /*shadow of body*/
  noStroke();
fill(200,200,200,40);
ellipse(bodyX,bodyY,120,190);
 
  /*body wings*/
stroke(161,222,239);
fill(213,240,248);
ellipse(bodyX,bodyY,200,span);

stroke(161,222,239,120);
noFill();
ellipse(bodyX,bodyY,200,span-10);

/*body wings details*/
noStroke();
fill(161,222,239,160);
ellipse(bodyX,bodyY,200,span-25);
fill(213,240,248,160);
ellipse(bodyX,bodyY,200,span-65);


/*body white*/
stroke(220);
fill(r,g,b);
ellipse(bodyX,bodyY,110,190);
stroke(240);
fill(250,250,250,80);
ellipse(bodyX,bodyY,100,190);
fill(250,250,250,60);
ellipse(bodyX,bodyY,80,190);
fill(250,250,250,40);
ellipse(bodyX,bodyY,50,190);
fill(250,250,250,30);
ellipse(bodyX,bodyY,30,190);
fill(250,250,250,20);
ellipse(bodyX,bodyY,10,190);

/*Facial Features*/
noStroke();
fill(50);
ellipseMode(CENTER);
 ellipse(bodyX,bodyY+40,30,30);
 ellipse(bodyX,bodyY,10,10);
 
/*eyes*/
 ellipse(bodyX-23,bodyY-35,30,50);
 ellipse(bodyX+23,bodyY-35,30,50); 
 
 //eyeballs
fill(255);
ellipse(bodyX-20,bodyY-35,10,20);
ellipse(bodyX+20,bodyY-35,10,20);
fill(252,252,252,20);
ellipse(bodyX-20,bodyY-35,25,40);
ellipse(bodyX+20,bodyY-35,25,40);

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
 if (bodyY>-200) {
 bodyY=bodyY-speed; 

 }
 
 else {
   bodyY=height; 
 
 } 
 }
  }



