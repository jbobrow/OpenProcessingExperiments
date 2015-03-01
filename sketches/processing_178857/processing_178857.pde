
void keyPressed() {
  
  if (key == 'b') {
     
   bomb=bomb+1
   
    } else if(key == 's') {
   
  bomb=bomb-5
 

  } 
}


int bomb=1;

float locationX=100;
  
float locationY=100;
  
float vX=5;
  
float vY=3;


void setup(){

size(500,500);


}


void draw(){

background(0);

stroke(0)

rect(mouseX,mouseY,40,40);

fill(255,0,255);

ellipse(250,250,bomb,bomb);  
  
fill(255,0,255);
  


}
