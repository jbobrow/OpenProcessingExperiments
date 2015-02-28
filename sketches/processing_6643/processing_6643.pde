
boolean mouseDown = false;

void setup() {
  size(800,600);
  //noLoop();
  noStroke();
  smooth();
}



void draw() {
  background(0);
  drawRectangle(0 ,0 ,800, 600,5);
   
  
  if(mouseDown==false){
    noLoop();
  } 
}

void mousePressed(){
  mouseDown = true;
  loop();
  mouseDown = false;
}

int imgNumber = 0;

/*void keyPressed() {
  save("recursive squares" + imgNumber + ".jpg");
  imgNumber++;
}*/

void drawRectangle(float x, float y,float w, float h, int level) {
  fill(random(255),random(255),random(255)); 
  rect(x,y,w,h);
  
  float shrink = .75;
  
  if(level>0){
    
    level--;
    drawRectangle(x, y+(h-h*shrink)/2 , w/2 , h*shrink, level );
    drawRectangle(x+w/2, y+(h-h*shrink)/2 , w/2 , h*shrink, level );
   
  }
}


