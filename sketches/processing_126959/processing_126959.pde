
void setup (){
  size (600,400);
  background (250);
  rect (0,0,width,50);
  
  fill (0,250,0);
  rect (0,0,width/5,50);
  
  fill (250,0,0);
  rect (width/5,0,width/5,50);
  
  fill (0,0,250);
  rect (width/5*2,0,width/5,50);
  
  fill (175,124,65);
  rect (width/5*3,0,width/5*3,50);
  
  fill (0,0,0);
  rect (width/5*4,0,width/5*4,50);
  
  rect (200,400,300,400);
  quad(250,450,250,470,270,470,270,450);
  quad(300,500,350,500,350,600,300,600);
  quad(400,450,400,470,450,470,450,450);
}
void draw (){
  
  if (mousePressed && mouseX>0 && mouseX<width/5 && mouseY<50){
    strokeWeight (5);
    stroke (0,250,0);
  }
  if (mousePressed && mouseX>width/5 && mouseX<width/5*2 && mouseY<50){
    strokeWeight (5);
    stroke (250,0,0);
  }
  if (mousePressed && mouseX>width/5*2 && mouseX<width/5*3 && mouseY<50){
    strokeWeight (5);
    stroke (0,0,250);
  }
  if (mousePressed && mouseX>width/5*3 && mouseX<width/5*4 && mouseY<50){
    strokeWeight (5);
    stroke (175,124,65);
  }
  if (mousePressed && mouseX>width/5*4 && mouseX<width && mouseY<50){
    strokeWeight (5);
    stroke (0);
  }

  if (mousePressed&&mouseY>60){
    line (mouseX,mouseY,pmouseX,pmouseY);
  }
}


