

boolean mouseDown = false;

void setup() {
  size(800,600,P2D);
  noLoop();
  smooth();
  noStroke();
}

void draw() {
  
  background(255);
  //fill(random(255),random(255),random(255),random(100,255));
  drawCircle(random(400,400),random(300,300),200,15,.75);
  if(mouseDown==false){
    noLoop();
  } 
}

void mousePressed(){
  mouseDown = true;
  loop();
  mouseDown = false;
}

int imgNumber = 25;

/*void keyPressed() {
  save("Splattered Circles" + imgNumber + ".bmp");
  imgNumber++;
}*/


void drawCircle(float x, float y, float radius, float level, float shrink){
  
  
  
 fill(random(255),random(255),random(255),random(200,255));
  
  /*if(random(1)<.5){
    fill(random(255),0,255,random(100,255));
  }else{
   fill(0,random(255),0,random(100,255));
  } */
  
  ellipse(x,y,radius,radius);
  
  
  
  if(level>0){
    level--;
    for(int o = 0; o<2; o++){
      drawCircle(  x+random(-(radius+radius*shrink),(radius+radius*shrink))  , y+random(-(radius+radius*shrink),(radius+radius*shrink))   ,radius*shrink   ,level,shrink);
    }
}

}




