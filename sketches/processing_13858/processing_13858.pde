
int x;
int y;
int r;
color cirleColor = color(150,150,150);

void setup(){
  size(640,480);
  r=100;

}


void draw(){

  //noStroke();
  fill(30,40,100, 1);
  rect(0,0,width,height);
  
  background(0,0);

  if (keyPressed)
  {


    switch (key)
    {
    case '1':
      r = 10; 
      break;
    case '2':
      r=40;
      break;
    case '3':
      r=60;
      break;
    case '4':
      r= 100;
      break;
    case '0':

      cirleColor = color(255,255,255);
      break;
    case '9':

      cirleColor = color(100,155,55);
      break;

    case '8':

      cirleColor = color(150,150,150);
      break;
    }

  }

  println(r);

  x=mouseX;
  y=mouseY;
  if (mousePressed)
  {
    fill(cirleColor);
    strokeWeight(0);
    ellipse(x,y,r,r);
  }

}


