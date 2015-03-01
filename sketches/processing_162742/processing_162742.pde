

PImage portrait;

void setup(){
  size(480,700);//roughly size of image
  portrait=loadImage("IMG_0411.JPG");
  
}

void draw(){
  background(#FFFFFF);
  
  portrait.filter(THRESHOLD, .45);
  
  image(portrait,00,60);
  
  stroke(255,255,255);//makes lines white
  
  for (int i = 0; i < 480; i = i+10) //vertical lines
  {
    line(i, 0, i, 700);
  }
  for (int j = 0; j < 700; j = j+10) //horizontal lines
  {
    line(0, j, 480, j);
  }
  for (int i = 0; i < 180; i = i+30) //left eye, upper left
  {
    line(i, 280-i, 180, 280);
  }
  for (int i = 0; i < 180; i = i+30) //left eye, lower left
  {
    line(i, 280+i, 180, 280);
  }
  for (int i = 0; i < 180; i = i+30) //left eye, upper right
  {
    line(360-i, 280-i, 180, 280);
  }
  for (int i = 0; i < 180; i = i+30) //left eye, lower right
  {
    line(360-i, 280+i, 180, 280);
  }
  for (int i = 0; i < 180; i = i+30) //right eye, upper left
  {
    line(120+i, 280-i, 300, 280);
  }
  for (int i = 0; i < 180; i = i+30) //right eye, lower left
  {
    line(120+i, 280+i, 300, 280);
  }
  for (int i = 0; i < 180; i = i+30) //right eye, upper right
  {
    line(480-i, 280-i, 300, 280);
  }
  for (int i = 0; i < 180; i = i+30) //right eye, lower right
  {
    line(480-i, 280+i, 300, 280);
  }
  for (int i = 0; i < 250; i = i+50) //neck left
  {
    line(i, 294-i, 250, 580);
  }
  for (int i = 0; i < 230; i = i+50) //rneck right
  {
    line(250+i, 43+i, 250, 580);
  }
  
}





