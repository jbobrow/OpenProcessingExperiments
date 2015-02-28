

int r=255;
int g=255;
int b=255;
int size=5;

void setup(){
  size(500, 500);
  background(255);
  noStroke();
  smooth();
}
 
void draw(){ 
  fill(r,g,b);
  ellipse(mouseX,mouseY,size,size);
}
 
void keyPressed(){
  if(key=='l'){//for larger brush/eraser
  size=size+5;
  }
  if(key=='s'){//for smaller brush/eraser
  size=size-5;
  }
  if(key=='c'){//for cyan
  r=0;g=255;b=255;
  }
  if(key=='m'){//for magenta
  r=255;g=0;b=255;
  }
  if(key=='y'){//for yellow
  r=255;g=255;b=0; 
  }
  if(key=='k'){//for black
  r=0;g=0;b=0;
  } 
  if(key=='e'){//for eraser
  r=255;g=255;b=255;
  }
}


