
float speed;
int xPos = 0;
int yPos = 20;
float gravity;
int ballSize = 20;

int[] circleX = { //Declare
  40, 80, 120, 160, 200, 240 //Assign
};



void setup(){

 size(600,600);
 speed = 15;
 gravity = 0.5;


}

void draw(){
  background(255);

for(int i = 0; i<6; i++){
fill(mouseY, i*50, mouseX);
ellipse(circleX[i]+150, yPos, ballSize, ballSize);
}

if(mousePressed){
  mousePressed();
}

}

void mousePressed(){
  yPos+=speed;
  speed+=gravity;
  
  if(yPos+ballSize+5>height){
    yPos=height-ballSize/2-15;
    speed*= -.5;
  }
  
  
  
}
