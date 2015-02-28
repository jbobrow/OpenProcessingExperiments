
espai[] b;

void setup()
{
  size(470,470);
  smooth();
  stroke(240);
  b = new espai[500];
  for(int i=0; i<500; i++)
  {
    b[i] = new espai(random(-width,width*2), random(-height, height*2), (int)random(10,40),(int)random(1,10));
    b[i].x = random(-width,width*2);
    b[i].y = random(-height,height*2);
    b[i].v = (int)random(1,10);
    b[i].col=255;
    if(i<50){
     b[i].col = #D8BFD8; 
    }else{
     b[i].col = #9370DB;  
    }
     if(i<178){
     b[i].col = #6A5ACD; 
    }else{
     b[i].col = #ADD8E6;  
    }
  }
}

void draw()
{
  background(0);
  
  // NAU
  fill(#ADD8E6);
  ellipse(mouseX-5,mouseY-5,100,30);
  // LLETRA U
  fill(0);
  rect(mouseX-23,mouseY-15,2.5,16);
  fill(0);
  rect(mouseX-23,mouseY+2,14,2.5);
  fill(0);
  rect(mouseX-11,mouseY-15,2.5,16);
  // LLETRA F
  fill(0);
  rect(mouseX-5,mouseY-5,2.5,5);
  fill(0);
  rect(mouseX-5,mouseY-10,2.5,5);
  fill(0);
  rect(mouseX-5,mouseY-15,2.5,5);
  fill(0);
  rect(mouseX-5,mouseY,2.5,5);
  fill(0);
  rect(mouseX-5,mouseY-15,10,2.5);
  fill(0);
  rect(mouseX-5,mouseY-8,8,2.3);
  // LLETRA O
  fill(0);
  ellipse(mouseX+17,mouseY-5,20,20);
  fill(#ADD8E6);
  ellipse(mouseX+17,mouseY-5,16,16);
  
  for(int i=0; i<b.length; i++)
  {
    b[i].move();
    b[i].show();
  }
}

class espai
{
  float x, y;
  int v;
  int bor;
  int col;
 
  void show()
  {
    fill(col,230);
    stroke(bor);
    ellipse(x,y, 5,5);
  }
 
  void move()
  {
    x += ( mouseX - width/2 ) * 0.004 * v;
   y += ( mouseY - height/2 ) * 0.004 * v;
  }
  espai(float xPos, float yPos, int radi, int vel){
    x = xPos;
    y = yPos;
    v = vel;
  }
}

