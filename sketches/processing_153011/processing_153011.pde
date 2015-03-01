
//simple Braitemberg agent simulation
//
//Andrea Vannini
//
// http://andreaarch.wordpress.com

mazePeople [] peop;
agent [] ants;
People [] ppl;

float border = 60;
int numPeople = 10;
int numAnt = 20;

void setup()
{
  size(600,600);
  background(0);
  //setup people
  peop = new mazePeople[numPeople];
  ppl = new People [50];
  for(int i = 0; i < peop.length; i++)
  {
    peop[i] = new mazePeople(random(border,width-border),random(border,height-border));
  }

  for(int i = 0; i < ppl.length; i++)
  {
    PVector position = new PVector (random(border,width-border),random(border,height-border));
    ppl[i] = new People(position);
  }
  //setup agents

  ants = new agent [numAnt];
  for(int i = 0; i < ants.length; i++)
  {
    PVector position = new PVector (random(border,width-border),random(border,height-border));
    ants [i] = new agent (position,0.05,3.0);
  }
}

void draw()
{
  background(0);
  //boundaries
  noFill();
  stroke(255);
  strokeWeight(2*border);
  rect(0,0,width,height);
  noStroke();
  //people
  for(int i = 0; i < peop.length; i++)
  { 
    peop[i].draw();
  }
  for(int i = 0; i < peop.length; i++)
  {
    for(int j = 0; j < peop.length; j++)
    {
      if(i != j)
      {
        float distance = sqrt(sq(peop[j].posX-peop[i].posX)+sq(peop[j].posY-peop[i].posY));
        if (distance < 100)
        {
          stroke(255);
          strokeWeight(20);
          line(peop[j].posX,peop[j].posY,peop[i].posX,peop[i].posY);
        }
      }
    }
  }
    for(int i = 0; i < ppl.length; i++)
  {
    ppl[i].draw();
    
  }
  
    //agents communication
  for(int i = 0; i < ants.length; i++)
  {
    ants[i].communication();
  }
  
  //load the background to pixel array
  loadPixels();

  //agents
  for(int i = 0; i < ants.length; i++)
  {
    ants[i].update();
    ants[i].draw();
  }
}

void mouseClicked()
{
  setup();
}
class agent
{
  PVector pos;
  PVector vel;
  PVector acc;
  PVector sensorLeft;
  float ddlx, ddly; 
  PVector sensorRight;
  float ddrx, ddry;
  float radius;
  float maxForce;
  float maxSpeed;
  float sensPosRatio = 5;
  float theta;
  int piFrac = 4;
  boolean redLight = false;
  boolean whiteLight = false;
  agent(PVector pos_, float mFo, float mSp)
  {
    acc = new PVector(0,0);
    vel = new PVector(random(-3,3),random(-3,3));
    pos = pos_.get();
    radius = 20.0;
    maxForce = mFo;
    maxSpeed = mSp;
    theta = vel.heading2D() + radians(90);
    ddlx= vel.x*cos(PI/piFrac) - vel.y*sin(PI/piFrac);
    ddly = vel.x*sin(PI/piFrac) + vel.y*cos(PI/piFrac);
    ddrx= vel.x*cos(-PI/piFrac) - vel.y*sin(-PI/piFrac);
    ddry = vel.x*sin(-PI/piFrac) + vel.y*cos(-PI/piFrac);
    sensorLeft = new PVector(ddlx,ddly);
    sensorRight = new PVector(ddrx,ddry);
  }

  void update()
  {
    ddlx= vel.x*cos(PI/piFrac) - vel.y*sin(PI/piFrac);
    ddly = vel.x*sin(PI/piFrac) + vel.y*cos(PI/piFrac);
    ddrx= vel.x*cos(-PI/piFrac) - vel.y*sin(-PI/piFrac);
    ddry = vel.x*sin(-PI/piFrac) + vel.y*cos(-PI/piFrac);
    sensorLeft = new PVector(ddlx,ddly);
    sensorRight = new PVector(ddrx,ddry);
    behaviour();
    vel.add(acc);
    vel.limit(maxSpeed);
    if(vel.mag() < 0.1)vel.mult(10);
    /*
    if(vel.mag() == 0.0)
     {
     PVector ifStops = new PVector (1,1);
     vel.add(ifStops);
     }
     */
    pos.add(vel);
    acc.mult(0);
    theta = vel.heading2D() + radians(90);
    //bounce();
  }

  void behaviour()  
  {
    color colLeft = pixels[int(pos.x+sensorLeft.x*sensPosRatio)+int(pos.y+sensorLeft.y*sensPosRatio)*width];
    color colRight = pixels[int(pos.x+sensorRight.x*sensPosRatio)+int(pos.y+sensorRight.y*sensPosRatio)*width];
    float pixelBrigthLeft = brightness(colLeft);
    float pixelBrigthRight = brightness(colRight);

    if (pixelBrigthLeft > 200 && !(pixelBrigthRight > 200))
    {
      PVector turnLeft = new PVector (sensorRight.x,sensorRight.y);
      turnLeft.normalize();
      acc.add(turnLeft);
    }
    if (pixelBrigthRight > 200 && !(pixelBrigthLeft > 200))
    {
      PVector turnRight = new PVector (sensorLeft.x,sensorLeft.y);
      turnRight.normalize();
      acc.add(turnRight);
    }

    if (pixelBrigthRight > 200 && pixelBrigthLeft > 200)
    {
      whiteLight = true;
      redLight = true;
      PVector turnRight = new PVector (sensorLeft.x,sensorLeft.y);
      turnRight.normalize();
      acc.add(turnRight);
      //PVector stop = new PVector (-vel.x/2,-vel.y/2);
      //vel.add(stop);
    }
    
    if (pixelBrigthRight < 200 && pixelBrigthLeft < 200)
    {
      whiteLight = false;
      redLight = false;
 
      //PVector turnRight = new PVector (sensorLeft.x,sensorLeft.y);
      //turnRight.normalize();
      //acc.add(turnRight);
      if(vel.mag() == 0.0)
      {
        PVector ifStops = new PVector (random(-3,3),random(-3,3));
        vel.add(ifStops);
      }
    }
    
    if(random(0,1) > 0.8)
    {
      acc.mult(5);
    }
  }

  void draw()
  {
    pushMatrix();
    translate(pos.x,pos.y);
    stroke(0,0,255);
    strokeWeight(2);
    line(sensorLeft.x*sensPosRatio,sensorLeft.y*sensPosRatio,vel.x*sensPosRatio,vel.y*sensPosRatio);
    line(sensorRight.x*sensPosRatio,sensorRight.y*sensPosRatio,vel.x*sensPosRatio,vel.y*sensPosRatio);
    line(0,0,vel.x*sensPosRatio,vel.y*sensPosRatio);
    //        line(sensorLeft.x,sensorLeft.y,0,0);
    //    line(sensorRight.x,sensorRight.y,0,0);
    noStroke();
    if(redLight)fill(255,0,0);
    else 
    {
      fill(0,0,100);
    }
    ellipse(0,0,20,20);
    popMatrix();
  }

  void bounce()
  {
    if (pos.x <= 20 && vel.x < 0)
      vel.x = -vel.x;
    if (pos.y <= 20 && vel.y < 0)
      vel.y = -vel.y;
    if (pos.x >= width-20 && vel.x > 0)
      vel.x = -vel.x;
    if (pos.y >= height-20 && vel.y > 0)
      vel.y = -vel.y;
  }
  void communication()
  {
    if(whiteLight)
    {
      fill(255,2551,255);
      stroke(0,255,0);
      strokeWeight(0.5);
      pushMatrix();
      float velMag = vel.mag();
      translate(pos.x-vel.x*50/velMag,pos.y-vel.y*50/velMag);
      ellipse(0,0,100,100);
      popMatrix();
    }
  }
}

class mazePeople
{
  float posX;
  float posY;
  int step;
  float sizeEll;

  mazePeople(float posX_, float posY_)
  {
    posX = posX_;
    posY = posY_;
    step = 10;
    sizeEll = 80;
  }

  void move()
  {
    if(dist(mouseX, mouseY, posX, posY)<sizeEll/2)
    {
      posX = mouseX;
      posY = mouseY;
    }
  }

  void draw()
  {
    for(int i = 0; i < step; ++i)
    {
      fill(255,255/step*(i+1));
      ellipse(posX,posY,sizeEll-sizeEll/step*(i+1),sizeEll-sizeEll/step*(i+1));
    }
  }
}

class People
{
  PVector pos;
  PVector vel;
  PVector acc;
  People(PVector pos_)
  {
    acc = new PVector(0,0);
    vel = new PVector(random(-3,3),random(-3,3));
    pos = pos_.get();
  }
  void move()
  {
    if(random(0,10)>2) acc.x = 1;
    else acc.y = 0;
        if(random(0,10)>2) acc.y = 1;
    else acc.y = 0;
    vel.add(acc);
    vel.limit(3);
    pos.add(vel);
    bounce();
  }
  
  void draw()
  {
    fill(0,255,0);
    noStroke();
    ellipse(pos.x,pos.y,10,10);
  }

  void bounce()
  {
    if (pos.x <= 20 && vel.x < 0)
      vel.x = -vel.x;
    if (pos.y <= 20 && vel.y < 0)
      vel.y = -vel.y;
    if (pos.x >= width-20 && vel.x > 0)
      vel.x = -vel.x;
    if (pos.y >= height-20 && vel.y > 0)
      vel.y = -vel.y;
  }
}



