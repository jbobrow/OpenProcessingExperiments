
float angle;
float direction;
float orient=random(-1, 1);

void setup() 
{
  size(400, 400); 
  noStroke();
  //rectMode(CENTER);
  float orient=random(1, 4);
  //framerate(30);
}
void mousePressed() { 
  orient=-orient;
}
void draw() 
{   
 // if(orient==1){
  background(51); 
  fill(255, 204);
  float c=cos(angle);
  //translate(width/2, height/2);
  
  
  rect(mouseX, height/2, mouseY/1.5+5, mouseY/4+5);

  if(orient>=0){
    ellipse(mouseX, height/2-(mouseY/3+5), mouseY/1.8, mouseY/2);
  }
  if (orient<=0){
    ellipse(mouseX+4*(mouseY/5), height/2-(mouseY/3+5), mouseY/1.8, mouseY/2);
  }
  
 // rotate(c);
  //translate(200, 200);
  rect(mouseX, (height/2)+(mouseY/3), mouseY/5, mouseY/3+5);
  //translate(mouseY/3, mouseY/3);
  rect(mouseX+mouseY/1.5+5-mouseY/5, (height/2)+(mouseY/3), mouseY/5, mouseY/3+5);
 // }
  
  if(direction==0){
    direction=1;
  }
  if (direction==1){
    angle=angle+.1;
  }
  if (direction==-1){
    angle=angle-.1;
  }
  if (angle>=1){
    direction=-1;
  }
  if (angle<= -1){
    direction=1;
  }
  
    
    
  //fill(255, 204);
 // int inverseX = width-mouseX;
  //int inverseY = height-mouseY;
  //rect(inverseX, height/2, (inverseY/2)+10, (inverseY/2)+10);
}


