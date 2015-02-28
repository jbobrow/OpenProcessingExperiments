
int MAX = 5;
int TRI = 1;

float [] ellipseX = new float[MAX];
float [] ellipseY = new float[MAX];
float [] deltaX = new float[MAX];
float [] deltaY = new float[MAX];
float [] dia = new float[MAX];

float [] tpointx = new float[TRI];
float [] tpointy = new float[TRI];
float [] dtpx = new float[TRI];
float [] dtpy = new float[TRI];
float [] rotAngle = new float[TRI];

float userx, usery, diau, dux, duy;
float temp;
PFont f;


void setup()
{
 size ( 800,  700);
 ellipseMode(CENTER);
 prepArraysCircles();
 prepArraysTriangles();

f = loadFont("HelveticaCY-Bold-48.vlw");
textFont(f);
 userx = width/2;
 usery = height/2;
 diau = 20;
 dux = 0;
 duy = 0;


}

void draw()
{


boolean win = false;

if (!win)
{
 background(75);
 ellipses();
 bounceBalls();
 grow();
 moveTriangle();
 triangleCollision();
 usersBall();
 userBallCollision();
 userTriColl();


temp = 0;
for (int i=0; i < dia.length; i++)
{
temp = temp + dia[i];
}

if(temp == dia.length * 3)
{
 win = true;

}
}



if(win)
{
 nextLevel();
 userx = width/2;
 usery = height/2;
 diau = 20;
 dux = 0;
 duy = 0;
 win = false;
}
}



void nextLevel()
{
 background(75);
 textAlign(CENTER);
 textSize(40);
 fill(255);
 text("Next Level", width/2, height/2);


 if(mousePressed)
 {
   if(mouseX > 295 && mouseX < 505 && mouseY > 320 && mouseY < 350)
   {
     
 background(55);
 //bring back ALL balls that have been sent - grows huge amount after triangle start hitting / the longer you take. 
  for(int i = 0; i < ellipseX.length; i++)
 {
 ellipseX[i] = random(0, width);
 ellipseY[i] = random(0,height);
 deltaX[i] = random(-5,5);
 deltaY[i] = random(-5,5);

 dia[i] = 20;


 }
 
 dia = append(dia, 20);
 dia = append(dia, 20);
 dia = append(dia, 20);
 dia = append(dia, 20);
 dia = append(dia, 20);

 deltaX = append(deltaX, random(-5,5));
 deltaX = append(deltaX, random(-5,5));
 deltaX = append(deltaX, random(-5,5));
 deltaX = append(deltaX, random(-5,5));
 deltaX = append(deltaX, random(-5,5));

 deltaY = append(deltaY, random(-5,5));
 deltaY = append(deltaY, random(-5,5));
 deltaY = append(deltaY, random(-5,5));
 deltaY = append(deltaY, random(-5,5));
 deltaY = append(deltaY, random(-5,5));

 ellipseX = append(ellipseX, random(0, width));
 ellipseX = append(ellipseX, random(0, width));
 ellipseX = append(ellipseX, random(0, width));
 ellipseX = append(ellipseX, random(0, width));
 ellipseX = append(ellipseX, random(0, width));

 ellipseY = append(ellipseY, random(0, height));
 ellipseY = append(ellipseY, random(0, height));
 ellipseY = append(ellipseY, random(0, height));
 ellipseY = append(ellipseY, random(0, height));
 ellipseY = append(ellipseY, random(0, height));

 tpointx = append(tpointx, random(0, width));
 tpointy = append(tpointy, random(0, height));
 dtpx = append(dtpx, random(-5,5));
 dtpy = append(dtpy, random(-5,5));
 for(int i=0; i < dtpx.length; i++)
 {
 rotAngle = append(rotAngle, atan2 (dtpx[i],dtpy[i]));
 }
  tpointx = append(tpointx, random(0, width));
 tpointy = append(tpointy, random(0, height));
 dtpx = append(dtpx, random(-5,5));
 dtpy = append(dtpy, random(-5,5));
 for(int i=0; i < dtpx.length; i++)
 {
 rotAngle = append(rotAngle, atan2 (dtpx[i],dtpy[i]));
 }
 }
 }
}

void userTriColl()
{
 float collision;
 for(int i=0; i < ellipseX.length; i++)
 {
  for(int t=0; t<tpointx.length; t++)
  {
   collision = dist(tpointx[t], tpointy[t], userx, usery);
    if( collision < diau/2 && collision >5)
    {
    float oldArea = (diau/2) * (diau/2) * PI;
    float newArea = oldArea/2;
    float newdia = sqrt(newArea/PI) *2;
    diau = newdia;
    dia = append(dia, newdia);
    ellipseX = append(ellipseX, userx + diau);
    ellipseY = append(ellipseY, usery + diau);
    dux = -dtpx[t] - .5;
    deltaX = append(deltaX,dtpx[t]+.5);
    duy = dtpy[t]+.5;
    deltaY = append(deltaY,-dtpy[t]-.5);

    }
  }
 }
}


void userBallCollision()
{
 for(int i = 0; i <ellipseX.length; i++)
 {
 if(dist(ellipseX[i],ellipseY[i],userx,usery)< ((dia[i] + diau)/2))
 {
 float areaUser = (diau/2) * (diau/2) * PI;
 float areaBall = (dia[i] / 2) * (dia[i]/2)*PI;
 float newArea = areaUser + areaBall;

 diau = sqrt(newArea/PI) *2;
 dia[i] = 3;
 ellipseX[i] = 10000;
 ellipseY[i] = 10000;
 deltaX[i] = 0;
 deltaY[i] = 0;
 }
}
}


void usersBall()
{

 userx = userx + dux;
 usery = usery + duy;
 fill(150,200,200);
 ellipse(userx,usery,diau,diau);

 if(keyPressed)
 {
 if(keyCode == UP)
 {
 duy = duy - .05;
 }
 if(keyCode == DOWN)
 {
 duy = duy + .05;
 }
 if(keyCode == LEFT)
 {
 dux = dux - .05;
 }
 if(keyCode == RIGHT)
 {
 dux = dux + .05;
 }
 if(key == 's')
 {
 dux = 0;
 duy = 0;
 }
 }

 if(userx < 0 + diau/2)
 {
 dux = -dux;
 userx = userx + 10;
 }
 if(userx > width - diau/2)
 {
 dux = -dux;
 userx = userx - 10;
 }
 if(usery < 0 + diau/2)
 {
 duy = -duy;
 usery = usery + 10;
 }
 if(usery > height - diau/2)
 {
 duy = -duy;
 usery = usery -10;
 }
}

void triangleCollision()
{
 float collision;
 for(int i=0; i < ellipseX.length; i++)
 {
  for(int t=0; t<tpointx.length; t++)
  {
 collision = dist(tpointx[t], tpointy[t], ellipseX[i], ellipseY[i]);

 if (collision < dia[i]/2 && collision > 5)
 {
 float oldArea = (dia[i] / 2) * (dia[i]/2)*PI;
 float newArea = oldArea/2;
 float newdia = sqrt(newArea/PI) *2;
 dia = append(dia, newdia);
 dia[i] = newdia;
 ellipseX = append(ellipseX, ellipseX[i]+dia[i]);
 ellipseY = append(ellipseY, ellipseY[i]+dia[i]);
 deltaX[i] = -dtpx[t]-.5;
 deltaX = append(deltaX,dtpx[t]+.5);
 deltaY[i] = dtpy[t]+.5;
 deltaY = append(deltaY,-dtpy[t]-.5);


 }
  }
 }
}

void drawTriangle()
{
 fill(200,100,100);
 triangle(0, 0, 5, 20,-5, 20);
}

void moveTriangle()
{
for(int i=0; i<tpointx.length; i++)
{
 pushMatrix();
   translate(tpointx[i], tpointy[i]);
   rotate(-rotAngle[i]+PI);
   drawTriangle();
 popMatrix();



 if (tpointx[i] > width || tpointx[i] < 0)
 {
 dtpx[i] = -dtpx[i];
 rotAngle[i] = atan2 (dtpx[i],dtpy[i]);
 }


 if (tpointy[i] > height || tpointy[i] < 0)
 {
 dtpy[i] = -dtpy[i];
 rotAngle[i] = atan2 (dtpx[i], dtpy[i]);
 }

 tpointx[i] = tpointx[i] + dtpx[i];
 tpointy[i] = tpointy[i] + dtpy[i];

}
}
void grow()
{
 for(int i = 0; i < ellipseX.length; i++)
 {
 for(int j =i+1; j < ellipseX.length; j++)
 {

  float collision = dist(ellipseX[i],ellipseY[i],ellipseX[j],ellipseY[j]);

   if ( collision <  (dia[i] + dia[j])/2 && collision > 5)
  {
  float area1 = (dia[i] / 2) * (dia[i]/2)*PI;
  float area2 = (dia[j] / 2) * (dia[j]/2)*PI;
  float newArea = area1 + area2;

  dia[i] = sqrt(newArea/PI)* 2;
  dia[j] = 3;
  ellipseX[j] = 10000;
  ellipseY[j] = 10000;
  deltaX[j]   = 0;
  deltaY[j]   = 0;
 //  balls[j]    = balls[i];

//    color firstBall = get( ellipseX[i], ellipseY[i]);
//    color secondBall = get( ellipseX[j], ellipseY[j]);
//    int r = int( red(firstBall)+ red(secondBall));
//    int b = int( blue(firstBall)+ blue(secondBall));
//    int g = int( green(firstBall)+ green(secondBall));
//    balls[i] = color(r,g,b);
//    balls[j] = balls[i];


  }
 }
 }
}

void bounceBalls()
{
 for(int i = 0; i < ellipseX.length; i++)
 {

  if(ellipseX[i] < 0 + dia[i]/2)
  {
   deltaX[i] = -deltaX[i];
   ellipseX[i] = ellipseX[i] + dia[i]/3;
  }
 if( ellipseX[i] > width - dia[i]/2 )
  {
   deltaX[i] = -deltaX[i];
   ellipseX[i] = ellipseX[i] - dia[i]/3;
  }
  if(ellipseY[i] < 0 + dia[i]/2 )
  {
   deltaY[i] = -deltaY[i];
   ellipseY[i] = ellipseY[i] + dia[i]/3;
  }
      if(ellipseY[i] + dia[i]/2 > height )
  {
   deltaY[i] = -deltaY[i];
   ellipseY[i] = ellipseY[i] - dia[i]/3;
  }
 }
}

void ellipses()
{
 for(int i = 0; i < ellipseX.length; i++)
 {
  noStroke();
  fill(color(250));
  ellipse(ellipseX[i], ellipseY[i],dia[i], dia[i]);

  ellipseX[i] = ellipseX[i] + deltaX[i];
  ellipseY[i] = ellipseY[i] + deltaY[i];
 }
}

void prepArraysCircles()
{
 for(int i = 0; i < ellipseX.length; i++)
 {
 ellipseX[i] = random(0, width);
 ellipseY[i] = random(0,height);
 deltaX[i] = random(-5,5);
 deltaY[i] = random(-5,5);

 dia[i] = 20;


 }
}

void prepArraysTriangles()
{
 for(int i = 0; i < tpointx.length; i++)
 {
 tpointx [i] = random(0, width);
 tpointy [i] = random(0,height);
 dtpx[i] = random(-5,5);
 dtpy [i]= random(-5,5);
 rotAngle [i] = atan2 (dtpx[i],dtpy[i]);
 }
}

