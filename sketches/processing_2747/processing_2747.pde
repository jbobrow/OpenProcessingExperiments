
void setup(){
  size (500,500);
  background (255);
}


void draw(){
  uno();
  tres();
  cuatro();
  cinco();
  dos();
}
void dos (){
  noStroke();
  smooth();

  for(float x=20; x<=480; x+=15){
    for(float y=20; y<=480; y+=15){
      float d;
      d= sqrt(((mouseX-x)*(mouseX-x))+((mouseY-y)*(mouseY-y)));
      fill  (0,mouseY,mouseY, mouseX);    
      ellipse(x, y, d/30, d/30);  
    }
  }
}

void uno(){

  noStroke();
  smooth();
  fill(20,140,198,15);
  for(float y=0; y<=250; y+=10){
    for(float x=260; x<=500; x+=10){
      rect(x, y, 5,5);
    }
  }
}
void tres(){
  noStroke();
  smooth();
  fill(72,205,237,15);
  for(float y=0; y<=250; y+=10){
    for(float x=0; x<=250; x+=10){
      rect(x, y, 5,5); 
    }
  }
}

void cuatro(){
  noStroke();
  smooth();
  fill(3,255,253,15);
  for(float y=260; y<=500; y+=10){
    for(float x=260; x<=500; x+=10){
      rect(x, y,5,5);
    }
  }
}
void cinco(){
  noStroke();
  smooth();
  fill(136,113,160,15);
  for(float y=260; y<=500; y+=10){
    for(float x=0; x<=250; x+=10){
      rect(x,y,5,5);
    }
  }
}

