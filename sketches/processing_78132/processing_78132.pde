
/*
code tweaked from textbook, pg 199, pg 77
*/

float beginX = 20.0; //initial  x coord
float beginY = 10.0; //inital y coord
float endX = 70.0;  //final x coord
float endY = 80.0;//final y coord
float distX; //x-axis distance to move
float distY;//y-axis dist to move
float exponent = 3.0; //determines the curve
float x = 0.0; //current x coord
float y = 0.0;// current y coord
float step = 0.01; // size of each step along the path
float pct = 0.0; //percent traveled 
int direction = 1;
void setup(){
 colorMode(HSB);
background(150,5);
smooth();
noStroke();
distX = endX - beginX;
distY = endY - beginY;
}
void draw(){

    fill(x+50,100,100,2);
  pct +=step*direction;
  if ((pct >1.0) || (pct<0.0)){
    direction=direction*-1;}
    if(direction==1){
    x=beginX+(pct*distX);
    float e=pow(pct,exponent);
    y=beginY+(e*distY);}
    else {
    x=beginX+(pct*distX);
  float e=pow(1.0-pct,exponent*2);
y=beginY+(e*-distY)+distY;}

beginShape();
vertex(x,y);
bezierVertex(x,y,54,17,26,83);
bezierVertex(26,83,90,107,x,y);
endShape();
/*ellipse(x,y,20,20);*/

}

