
void setup(){
  size (400,700);
  background(5,5,20);
}
float clickspeed = 1;

void draw(){
  noStroke();
  fill(5,5,20,5);
  rect(0,0,width,height);
  
  if (clickspeed >1.0){
      translate(mouseX,mouseY);
      clickspeed = clickspeed * random(0.98,1.005);
  int r = 0;
  while (r < 20){
    fill(random(240,255),random(230,240),random(170,190),50);
    ellipse(clickspeed*5,clickspeed*5,clickspeed*3,clickspeed*3);
    r = r+1;
    rotate(radians(18));
  }
  
  translate(-mouseX,-mouseY);
    
    
  }

}

void mousePressed(){
  translate(mouseX,mouseY);
  if (clickspeed >= 1){
      clickspeed = clickspeed * random (0.99,1.3);
  }else{
    if(clickspeed>=20){clickspeed = clickspeed * random(0.95,1.05);}
    else{clickspeed = clickspeed * random (1,1.3);}}
  int r = 0;
  while (r < 20){
    fill(random(240,255),random(230,240),random(170,190),50);
    ellipse(clickspeed*2,clickspeed*2,clickspeed*3,clickspeed*3);
    r = r+1;
    rotate(radians(18));
  }
  
  translate(-mouseX,-mouseY);}

