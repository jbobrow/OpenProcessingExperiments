

void setup() {
 size(800, 800);
}



void draw(){
  
  fill(255);
  stroke(0);

  ellipse(width/2,height/2,mouseX,mouseY);
}

void keyReleased(){
 
 save("ima"+frameCount+".png");
  
}


