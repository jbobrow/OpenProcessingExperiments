
void setup() 
{ 
  size(500, 500);
  background(255);
  noStroke();
  fill(0);
  strokeWeight(4);
  colorMode(HSB,100,100,100);
  smooth();
  
  hbox();
} 

boolean ON=false;
int H = 0, S = 0, B = 0, pencil = 10, eraser = 10;

void draw()
{
  if(ON == true)
  {
    if(mouseButton == LEFT){
      stroke(H, S, B);
      strokeWeight(pencil);
      line(pmouseX, pmouseY, mouseX, mouseY);
    }
    if(mouseButton == RIGHT){
      stroke(0,0,100);
      strokeWeight(eraser);
      line(pmouseX, pmouseY, mouseX, mouseY);
    }
  }
}

void keyPressed(){
  switch(key){
  case 'h' :
    H += 10;
    if(H>100){H=0;}
    hbox();
    break;
  case 's' :
    S += 10;
    if(S>100){S=0;}
    hbox();
    break;
  case 'b' :
    B += 10;
    if(B>100){B=0;}
    hbox();
    break;
  case 'c' :
    background(0,0,100);
    hbox();
    break;
  case 'q' :
    if(pencil <= 145){pencil += 5;}
    hbox();
    break;
  case 'w' :
    if(pencil >= 1){pencil -= 5;}
    hbox();
    break;
  case 'z' :
    if(eraser <= 145){eraser += 5;}
    hbox();
    break;
  case 'x' :
    if(eraser >= 1){eraser -= 5;}
    hbox();
    break;
  case ' ' :
    H = 0; S = 0; B = 0; pencil = 10; eraser = 10;
    hbox();
    break;
  default  :
    H = 0; S = 0; B = 0; pencil = 10; eraser = 10;
    hbox();
    break;
  }
}

void mousePressed()
{
  if(mouseY >= 100)
  {
    ON = true;
  }
  else //mouseY<100
  {
    if(mouseX <= 99)
    {
      H = mouseY;
    }
    else if(mouseX <= 199)
    {
      S = mouseY;
    }
    else if(mouseX <= 299)
    {
      B = mouseY;
    }
  }
  
  
  hbox();
}

void mouseReleased()
{
  ON = false;
  hbox();
}

void hbox()
{
  pushStyle();
  
  strokeWeight(1);
  for(int i = 0;i < 100; i++)
  {
    stroke(i,100,100);
    line(0,i,99,i);
  }
  for(int i = 0;i < 100; i++)
  {
    stroke(100,i,100);
    line(100,i,199,i);
  }
  for(int i = 0;i < 100; i++)
  {
    stroke(100,100,i);
    line(200,i,299,i);
  }
  
  noStroke();
  fill(H, S, B);
  rect(300,0,100,100);
  
  fill(0,0,100);
  rect(400,0,100,50);
  fill(0,1,15);
  rect(400,50,100,50); 
  
  textAlign(CENTER);
  fill(0,1,1);
  text("LineWeight",450,15);
  text("=",450,35);
  text(pencil,470,35);
  fill(0,0,100);
  text("EraserWeight",450,65);
  text("=",450,85);
  text(eraser,470,85);
  
  popStyle();
}




