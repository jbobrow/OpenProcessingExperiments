
float rx = 100;
float ry = 100;
float rwidth = 200;
float rheight = 100;

void setup(){
  size(400,400);
}

  void draw(){
    background(255);
    
     
    if(
      mouseX >= rx && mouseX <= rx + rwidth &&
      mouseY >= ry && mouseY <= rx + rwidth){
      fill(255,0,0);
    }else{
      fill(255);
    } 
    
    rect(rx,ry,rwidth,rheight);
}

void keyPressed() {
   saveFrame("mouseover.png");
}


