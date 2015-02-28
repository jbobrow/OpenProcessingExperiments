
import traer.physics.*;

ParticleSystem physics;
Particle ninja, ropeEnd;
Spring ninjaRope;
int numImages = 16, GROUND, iterateRun = 0, restLength=20;
boolean right = false, left = false, jump = false, roper = false, ropeReady=false, reduceRope=false, increaseRope=false;

PImage[] nImage = new PImage[numImages];

void setup()
{

  size(800,500);
  frameRate(40);
  GROUND=height-100;
  physics = new ParticleSystem(0.98, 0.01);
  ninja = physics.makeParticle(1, 50, 50, 0);
  ropeEnd = physics.makeParticle();
  ninjaRope = physics.makeSpring(ninja, ropeEnd, 0.05, 2, restLength);
  ninjaRope.turnOff();
  nImage[0]=loadImage("run_03.png");
  nImage[1]=loadImage("run_04.png");
  nImage[2]=loadImage("run_05.png");
  nImage[3]=loadImage("run_06.png");
  nImage[4]=loadImage("run_07.png");
  nImage[5]=loadImage("run_08.png");
  nImage[6]=loadImage("run_09.png");
  nImage[7]=loadImage("run_10.png");
  nImage[8]=loadImage("run_11.png");
  nImage[9]=loadImage("run_12.png");  
  nImage[10]=loadImage("run_13.png");
  nImage[11]=loadImage("run_14.png");
  nImage[12]=loadImage("jump_down.png");
  nImage[13]=loadImage("jump_up.png");
  nImage[14]=loadImage("main_stance_01.png");
  nImage[15]=loadImage("slide.png");  

}

void draw()
{
  physics.tick();
  boundries();
  movement();

  background(120);
  fill(255);
  if(roper)
  {
    controlRope();
      
  }
  rect(0,GROUND,width-1,height);
  image(nImage[getNinjaState()],ninja.position().x()-16,ninja.position().y()-16);

  if(iterateRun<11)
  {
    iterateRun++;
  }
  else
  {
    iterateRun=0;
  }
   restrictRopeLength();

}

void boundries()
{

  //set floor
  if(ninja.position().y()>GROUND-16)
  {
    ninja.moveTo(ninja.position().x(),GROUND-16,0);
    ninja.setVelocity(ninja.velocity().x()*0.9,0,0);
  }

  //set walls
  if(ninja.position().x()>width)
  {
    ninja.moveTo(width,ninja.position().y(),0);
    ninja.setVelocity(ninja.velocity().x()*(-0.9),ninja.velocity().y(),0);
  }
  if(ninja.position().x()<0)
  {
    ninja.moveTo(0,ninja.position().y(),0);
    ninja.setVelocity(ninja.velocity().x()*(-0.9),ninja.velocity().y(),0); 
  }

  //set ceiling
  if(ninja.position().y()<0)
  {
    ninja.moveTo(ninja.position().x(),0,0);
    ninja.addVelocity(0,ninja.velocity().y()*(-0.9),0);
  }


}

void movement()
{

  //running and jumping from ground
  if(ninja.velocity().y()==0){
    if(right)
    {
      ninja.addVelocity(0.8,0,0);
    }
    if(left)
    {
      ninja.addVelocity(-0.8,0,0);
    }

    //jumping

    if(jump)
    {
      ninja.addVelocity(ninja.velocity().x()*0.5,-15,0);
    }

  }
  
  if(roper)
  {
    if((right)&&(ninja.velocity().x()>=-0.5))
    {
      ninja.addVelocity(0.6,0,0);
    }
    if((left)&&(ninja.velocity().x()<=0.5))
    {
      ninja.addVelocity(-0.6,0,0);
    }
  }    
  
}


void initRope()
{
  if(ropeReady)
  {
    ropeEnd.moveTo(ninja.position().x(),ninja.position().y(),0);
    ropeEnd.makeFree();
    ninjaRope.setRestLength(restLength);
    ropeEnd.setVelocity(((abs(ninja.velocity().x()))/ninja.velocity().x())*40+10,-40,0);
    roper = true;
    ropeReady=false;
  }

}

void controlRope()
{
  println("controlRope()");

  if((ropeEnd.position().x()<5)||(ropeEnd.position().x()>width-5)||(ropeEnd.position().y()<5))
  {
    if(ropeEnd.position().y()<5)
    {
      ropeEnd.moveTo(ropeEnd.position().x(),5,0);
    }
    if(ropeEnd.position().x()<5)
    {
      ropeEnd.moveTo(5,ropeEnd.position().y(),0);
    }
    else if (ropeEnd.position().x()>width-5)
    {
      ropeEnd.moveTo(width-5,ropeEnd.position().y(),0);
    }

    ropeEnd.makeFixed();
    ninjaRope.turnOn();
  }
  if(increaseRope)
  {
    ninjaRope.setRestLength(ninjaRope.restLength()+3);
  }
  else if((reduceRope)&&(ninjaRope.currentLength()>100))
  {
    ninjaRope.setRestLength(ninjaRope.restLength()-3); 
  }
    
  stroke(0);
  fill(255);
  line(ninja.position().x(),ninja.position().y(),ropeEnd.position().x(),ropeEnd.position().y());
  ellipse(ropeEnd.position().x(),ropeEnd.position().y(),5,5);

}

void restrictRopeLength()
{
 
  if((sqrt(sq(abs(ninja.position().x()-ropeEnd.position().x()))+(sq(abs(ninja.position().y()-ropeEnd.position().y()))))>500))
  {
    ninjaRope.turnOff();
    roper=false;
  }
  //else{ninjaRope.turnOn();}
}



int getNinjaState()
{
  if(ninja.position().y()==GROUND-16)
  {
    if((abs(ninja.velocity().x()))<0.1)
    {
      return 14;
    }
    else if ((right)||(left))
    {
      return iterateRun;
    }
    else
    {
      return 15;
    }
  }

  else if(roper)
  {
    return 15;
  }

  else if(ninja.velocity().y()>0)
  {
    return 12;
  }
  else
  {
    return 13;
  }

}


void keyPressed()
{
  if(keyCode==RIGHT){
    right = true;
  }
  if(keyCode==LEFT) {
    left = true;
  }
  if(keyCode==SHIFT) {
    jump = true;
  }
  if(keyCode==CONTROL) {
    initRope();
  }
  if(keyCode==UP)
  {
    reduceRope=true;
  }
  if(keyCode==DOWN)
  {
    increaseRope=true;
  }
}

void keyReleased()
{
  if(keyCode==RIGHT) {
    right=false;
  }
  if(keyCode==LEFT) {
    left=false;
  }
  if(keyCode==SHIFT)
  {
    jump=false;
  }

  if(keyCode==CONTROL)
  {
    roper=false;
    ropeReady=true;
    ninjaRope.turnOff();
  }
  if(keyCode==UP)
  {
    reduceRope=false;
  }
  if(keyCode==DOWN)
  {
    increaseRope=false;
  }

}


