
Block squares;


void setup(){
  
  
  background(255);
  size(400,400);
  background(255);
  smooth();

squares=new Block();

}
void draw(){
 
squares.update();
squares.display();  
  
 }



class Block{
  
float xpos;
float ypos;
float sizx;
float sizy;

  Block(){
    xpos = 1;
    ypos = 1;
    sizx = 25;
    sizy = 25;
  }


void update(){
  
xpos+=0;
ypos+=0;



}


void display(){
  
 
//green blocks 

fill(0,200,50);
   
rect(xpos,ypos,sizx,sizy);

rect(xpos+sizx,ypos,sizx,sizy);

rect(xpos+(sizx*2),ypos,sizx,sizy);

rect(xpos,ypos+sizy,sizx,sizy);

rect(xpos,ypos+(sizy*2),sizx,sizy);

rect(xpos,ypos+(sizy*3),sizx,sizy);
}



}





