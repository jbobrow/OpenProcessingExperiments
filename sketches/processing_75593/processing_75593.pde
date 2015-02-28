
float yPos=200;
float xPos = 1200;
float xspeed = 5;
roof roof1;


void setup() {
size (1280,400);
roof1 = new roof();
smooth();
}


void draw(){
  background ( 180 ) ;
// ellipseMode (CENTER);

//ellipse (100,yPos,100,100); 
//rectMode (CENTER);

roof1.draw();
roof1.move(5);

}//end draw





class roof{
  
  void move(float xspeed){
 xPos = xPos - xspeed; 
 if (xPos < 0){
   xPos = 1280;
 }//move
}

void draw () {  
  rectMode (CENTER);
  fill (0,0,200);
  rect(xPos,350,400,200);
}// end draw

}//end class roof
