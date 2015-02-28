

float size=1.0;
float speed=0.2;
int numEllipse=60;
float x=0;

//int speed=1;

void setup(){
  size(400,1000);
  background(255);
}

void draw(){

  size=size+speed;

  x=x+0.5;
  if (size>10.0 || size<1.0) 
  speed=-1*speed;

    
    for (int i=0; i<numEllipse; i++){
    fill(i*300/numEllipse);
    ellipse(mouseX, mouseY, i*size, i*size);
  }
}
  

