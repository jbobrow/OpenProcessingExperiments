
//notes; cause who knows what the hell i did or was intending on doing
//all this was figured out at one point...but i cant replicate it

//figure out how to make more ripples at once
//how to make ripples always start at size 0
//how to have them grow after you let go of the click
//better colors
//make colors move




//variables
int x = 1;
int size = 0;
int square = 4;


void setup(){
frameRate(10);
size(400, 200); 
smooth();
}

void draw(){
  background(50,120,185,85);
/*
for( int i = 0; i < 400; i++){
  arc(i, 100, 200, 200, 0, PI+QUARTER_PI, OPEN);
   }
*/

  if(mousePressed==true){
    noFill();
    strokeWeight(5);
    stroke(255,50);//better color?
    ellipse(mouseX, mouseY,size, size);
   size++;
  } 
}
 
  
//mousepressed if/else
      //see proj 1
      
  


//addons 
//lightning
//more abstract?
//gradiant
//moon reflection

//maybe change altogether, do pixelatted clouds, and clicks add birds
