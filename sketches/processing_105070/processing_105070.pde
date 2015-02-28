
float ballY=0;
float ballX=0;
float disX;
float disX;
void setup(){
size(500,500);
ballX=width/2;
ballY=height/2;

}
void draw(){
background(0);
ellipse(ballX,ballY,20,20);
disX=mouseX-ballX;
disY=mouseY-ballY;
ballX=disX/50+ballX;
ballY=disY/50+ballY;
}
