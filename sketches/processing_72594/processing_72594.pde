
int diam = 200;
boolean doidraw = false;


void setup (){
  size(800,800);
  background(255);
  noStroke();
  
  //while (diam>500){
  //  drawacircle(200, 200, diam);
  }


void draw(){
  for(int diam = 800; diam > 0; diam = diam/2){
    fill(150, 5, 20, 1);
    drawacircle(400, 400, diam);
  }
}
void drawacircle(int centx, int centy, int circlesize){
  ellipse(centx, centy, circlesize, circlesize);
}




