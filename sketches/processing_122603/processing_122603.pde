
int x, y;
int c;

void setup(){
  size(600, 600);
  background(255);
  noStroke();
  smooth();
  fill(0);
}

void draw(){
  //fill(mouseX, mouseY, 130);
}

void mouseDragged(){
  ellipse(mouseX, mouseY, pmouseX, pmouseY);
  //line(mouseX,mouseY,pmouseX,pmouseY);
}

void mousePressed(){
  ellipse(mouseX, mouseY, 60, 60);
}

void keyPressed(){
  if(key == CODED){
    if(keyCode == UP){
      fill(mouseX, mouseY, 130);
      noStroke();
  }else if(keyCode == DOWN){
     noStroke();
     fill(mouseX, 130, mouseY);
    }else if(keyCode == LEFT){
     noStroke();
     fill(130, mouseY, mouseX);
    }else if(keyCode == RIGHT){
     noStroke();
     fill(mouseX,mouseX,mouseY);
    }else if(keyCode == CONTROL){
     fill(255);
     stroke(255);
    }
  }
}


