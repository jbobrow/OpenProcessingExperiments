
int x; 
int y;

void setup (){
  size (600,600);
  background(255);
  x=300;
  y=300;
}

void draw () {
  background (y,y);// put background before makes it look
  //like the square is moving 
  rectMode (CENTER);
  fill (0);
  rect (x,y,50,50); 
  x= mouseX; //follows the mouse 

  
  x=400/3;
  
  y+= 1; 
  println (x);  //makes the y int move
 
 if(y== height){
  y=0; }
