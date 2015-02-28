
void setup(){
  size(1000,1000);
  background(55);
}

int x=500;
int y=500;

void draw(){
  background(55);
  fill(0,0,100);
  ellipse(x,y,75,75);
  
  if(keyPressed && key=='w'){
    y-=4;
  }
  
  if(keyPressed && key=='d'){
    x+=4;
  }
  
  if(keyPressed && key=='s'){
    y+=4;
  }
  
  if(keyPressed && key=='a'){
    x-=4;
  }
  
  if(keyPressed && key=='q'){
    x-=4;
    y-=4;
  }
  
  if(keyPressed && key=='e'){
    x+=4;
    y-=4;
  }
  
  if(keyPressed && key=='c'){
    x+=4;
    y+=4;
  }
  
  if(keyPressed && key=='z'){
    x-=4;
    y+=4;
  }
}
