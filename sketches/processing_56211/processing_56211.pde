

/*
          Chunzhong Li 02/08/2012
           Skydiving
 */
float aY=70.00;
float bY=80.00;
float cY=90.00;
float dY=78.00;
float eY=83.00;
float fY=88.00;
float gY=75.00;
float hY=65.00;
float iY=30.00;
float jY=60.00;
float kY=29.00;

void setup()
{ 
  size(300, 300);
  smooth();
}

void draw()
{
  background(29, 164, 203);
  noStroke();
  fill(242, 49, 32);
  ellipse(120, 150, 250, 250);//rainbow
  fill(242, 134, 32);
  ellipse(120, 160, 250, 250);
  fill(242, 218, 32);
  ellipse(120, 170, 250, 250);
  fill(48, 242, 32);
  ellipse(120, 180, 250, 250);
  fill(32, 242, 205);
  ellipse(120, 190, 250, 250);
  fill(29, 164, 203);
  ellipse(120, 200, 250, 250);

  fill(255);
  ellipse(30, 140, 20, 20);//cloud on the left
  ellipse(50, 140, 20, 20);
  ellipse(70, 140, 20, 20);
  ellipse(40, 130, 20, 20);
  ellipse(40, 150, 20, 20);
  ellipse(60, 150, 20, 20);
  ellipse(60, 130, 20, 20);

  ellipse(180, 70, 30, 30);//cloud on the right
  ellipse(220, 70, 30, 30);
  ellipse(190, 60, 30, 30);
  ellipse(190, 80, 30, 30);
  ellipse(210, 60, 30, 30);
  ellipse(210, 80, 30, 30);
  
  ellipse(90, 210, 30, 30);//cloud inthe middle
  ellipse(130, 210, 30, 30);
  ellipse(100, 200, 30, 30);
  ellipse(100, 220, 30, 30);
  ellipse(120, 200, 30, 30);
  ellipse(120, 220, 30, 30);

  //cloud can move by the mouse
  ellipse(mouseX+20, mouseY+10, 30, 30);
  ellipse(mouseX+40, mouseY+10, 30, 30);
  ellipse(mouseX, mouseY, 30, 30);
  
  fill(142,mouseX,mouseY);
  ellipse(mouseY, mouseX, 30, 30);
  ellipse(mouseY+20, mouseX, 30, 30);
  ellipse(mouseY+30, mouseX-10, 30, 30);
 

  stroke(0);// skydiver
  line(190, aY, 200, bY);
  line(200, bY, 220, bY);
  line(220, bY, 210, cY);
  line(210, cY, 190, bY);
  line(240, aY, 260, bY);
  line(260, bY, 275, dY);
  line(240, aY, 252, eY);
  line(252, eY, 270, fY);
  fill(117, 26, 183);
  triangle(220, cY, 210, aY, 260, aY);
  fill(255);
  ellipse(260, aY, 20, 20);
  point(265, gY);
  point(260, aY);
  fill(42, 180, 21);
  ellipse(240, hY, 20, 10);


  noStroke();//parachute
  fill(mouseX, mouseY, 199);
  arc(230, iY, 60, 60, PI, TWO_PI);
  fill(29, 164, 203);
  arc(210, iY, 20, 20, PI, TWO_PI); 
  arc(230, iY, 20, 20, PI, TWO_PI); 
  arc(250, iY, 20, 20, PI, TWO_PI); 

  stroke(mouseX, mouseY, 199);
  line(240, jY, 202, kY);
  line(240, jY, 220, kY);
  line(240, jY, 240, kY);
  line(240, jY, 258, kY);
  aY=aY+0.2;//slowly down
  bY=bY+0.2;
  cY=cY+0.2;
  dY=dY+0.2;
  eY=eY+0.2;
  fY=fY+0.2;
  gY=gY+0.2;
  hY=hY+0.2;
  iY=iY+0.2;
  jY=jY+0.2;
  kY=kY+0.2;
}
void mousePressed()//Let's get a smiling face!
{
 noFill();
 stroke(0);
 ellipse(150,160,100,100);
 arc(120,150,30,30,PI,TWO_PI);
 arc(180,150,30,30,PI,TWO_PI);
 arc(150,170,40,40,0,PI);
}


