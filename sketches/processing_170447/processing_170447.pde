
float speedR, speedG, speedB;

void setup() {  //runs once on start   
size(600,300);   
speedR=random(.8,1.2);   
speedG=random(.8,1.2);   
speedB=random(.8,1.2); }

void draw() {  //Loop Continuously   
background(#FFFFFF);   
drawBalloon(#80FE80,0,speedR);   
drawBalloon(#8080FE,100,speedG);   
drawBalloon(#FE8080,200,speedB);

void drawBalloon(color c, int yStart, float speed){  //runs when called   
resetMatrix();   
translate(frameCount*speed, yStart);   
if (frameCount*speed >= 600-90) {  // stops loop for photo finish when winner finishes       
    noLoop();   
} 
  
fill(c);   
ellipse(56, 46, 55, 55);   
ellipse(56, 46, 55, 55);   
}
