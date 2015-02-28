
PImage rene;
PImage rene2;
int reneRadius =30;
int rene2Radius=30;


boolean reneisGoingRight= true;
boolean reneisGoingDown = true;
boolean rene2isGoingRight= true;
boolean rene2isGoingDown=  true;

float xPos = 10;
float yPos = 10;

float leftrene;
float rightrene;
float aboverene;
float downrene;
void setup(){
  size(1024,768);
  background(#0055ba);
  rene = loadImage("rene.jpg");
  rene2 = loadImage("rene2.jpg");
  imageMode(CENTER);

}
void draw(){
  noStroke();
  background(#0055ba);
  image(rene, xPos*1.5, yPos*1.5);
  image(rene2,xPos, yPos);  


  //++= plus1, -- mains abtract 1/ += mains faster+ ,you don't need to type xpos+//
  leftrene+=2;
  //i can also use+-*/ //
  rightrene+=2;
//  if (xPos+ myphotoRadius >=width){
    
    //>= is much better than = only//
//    xPos= -1.02*xPos;    
//  }

        
rene.resize(reneRadius*2,reneRadius*2);

leftrene=xPos-reneRadius;
rightrene=xPos+reneRadius;

    
if(leftrene <= 0){
  reneisGoingRight=true;
 }
 //it seems that i don;t need to make it left//
 if(rightrene >= width){
   reneisGoingRight=false;}
  if (reneisGoingRight) {
    xPos+=2;
  }
  else {
    xPos-=2;}
    
aboverene=yPos-reneRadius;
downrene=yPos+reneRadius;
    
if(aboverene <= 0) {
  reneisGoingDown=true;
 }
 //it seems that i don;t need to make it left//
 if(downrene >= height) {
   reneisGoingDown=false;
 }

  if (reneisGoingDown) {
    yPos+=2;
  }
  else {
    yPos-=2;
  }
     
 
//means the pic will going to right until more than width, //
//and it will goes to left until the width is less than width,then it will goes
//to the right again//



//somtimes the image have to think about whyther the px is fit the to background//

//if(mains IF){ means then; 


     
rene2= loadImage("rene2.jpg");
rene2.resize(rene2Radius*3,rene2Radius*3);
}







