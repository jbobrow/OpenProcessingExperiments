
void setup(){
  size(800,600);
  noStroke();
  background(210,210,210);
  fill(255,255,255);
}
float size=10;

void draw(){
  
  ellipse(mouseX,mouseY,size,size);
}
void mouseClicked() {
  size=size +10;
}

void keyPressed() {
  if (key=='1'){
    fill(255,0,0);
  }else if(key=='2'){
    fill(0,0,255);
  }else if(key =='3'){
    fill(255,255,255);
  }else if(key=='4'){
    fill(210,210,210);
  }else if(key=='q' ||key=='Q'){
    size=10;
    
   println("1");
  }
  
}

