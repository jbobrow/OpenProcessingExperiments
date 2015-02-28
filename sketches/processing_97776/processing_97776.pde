
size (200, 200);
  
  background (190,10,0);
  
   noStroke();
   
//se
   
void setup() {

}


void draw(){

  int x= mouseX;
  
  int y= mouseY;
  
     background(190,0,0);
     rect(70,70,55,55);
     fill (0,190,0);

//apaga
{
 if (x>=75 && x<=125 && y>=75 && y<=125)
  background(255);}

}
