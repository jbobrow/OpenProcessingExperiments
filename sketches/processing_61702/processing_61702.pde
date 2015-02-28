
void setup()
{
  size(300,300);
  smooth();
}

void draw()
{

  faceDrawing(150,150);
}

void faceDrawing(int a,int b)
{

  if(dist(mouseX,mouseY,a,b)<50)
  {
    fill(255,0,0);
    ellipse(a,b,100,100);
    noFill();
    arc(a,b+30,60,60,PI,TWO_PI);
    fill(random(0,255),random(0,255),random(0,255));
    text("WOO~!",random(0,300),random(0,300),random(20,150),random(30,90));
    text("WOO~!",random(0,300),random(0,300),random(20,70),random(30,120));
    text("WOO~!",random(0,300),random(0,300),random(70,100),random(10,190));
  }
  else 
  {
    background(255);
    fill(0,0,255);
    ellipse(a,b,100,100);
    noFill();
    arc(a,b,60,60,0,PI);
    fill(random(0,255),random(0,255),random(0,255));
     text("HA~!",random(0,300),random(0,300),random(20,150),random(30,90));
    text("HA~!",random(0,300),random(0,300),random(20,70),random(30,120));
    text("HA~!",random(0,300),random(0,300),random(20,100),random(10,190));
  }

  fill(0);
  ellipse(a-20,b-10,10,10);
  ellipse(a+20,b-10,10,10);
}
