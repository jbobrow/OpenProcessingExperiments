
float ellipsesize = 5;

void setup(){
  size(600,400);
  background(255,255,255);
}

void draw(){
     //noStroke();
     ellipseMode (CENTER);
     ellipse(mouseX,mouseY,ellipsesize,ellipsesize);
     float x = random(width);
     float y = random( height);
     ellipse(x,y,5,5);
       
}
void mouseClicked(){
     ellipsesize = ellipsesize + 5;
}   
void keyPressed() {
  if (key == 'b') {
     fill(3,228,255);
  }  else if (key == 'g'){  
     fill(38,203,2);
  }  else if (key == 'r'){  
     fill(255,15,0);
  }  else if (key == 'o'){  
     fill(255,154,3);
  }  else if (key == 'y'){  
     fill(255,248,28);
  }  else if (key == 'p'){  
     fill(250,98,126);
  }  else if (key == 'm'){  
     fill(82,24,35);
  }  else if (key == 'w'){  
     fill(255,255,255);
  }
  ellipsesize = 30;
  

}




