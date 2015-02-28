
int xPos = 0;
int yPos = 0;

void setup(){
  size (600,600); 
  xPos = width/2;
  yPos = height/2;
}

void draw(){
  background(0);
  
  fill(255);

 ellipse(xPos,yPos,40,40);


}


void keyPressed(){
   
   if(keyCode==UP){
    yPos-=2;
   }
   if(keyCode==DOWN){
    yPos+=2;
   }
   if(keyCode==LEFT){
    xPos-=2;
   }
   if(keyCode==RIGHT){
    xPos+=2;
    }
   
 }
