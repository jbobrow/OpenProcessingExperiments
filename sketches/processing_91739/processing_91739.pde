
float x=-175;
float xx=-175;
float xs=-15;


float sp=2;
float t=sp;
float tt=sp;
float tts=sp;


float bt=sp;
float ba=5;

float b=2;
float tim;



void setup()
{
  size(500, 500, P3D);
  noStroke();

}

void draw()
{
  background(243, 250, 120);
  camera(width/2.0, height/2.0, (height/2.0) / tan(PI*30.0 / 180.0)-45, width/2.0, height/2.0, 0, 0, 1, 0);
  fill(207, 100, 72);
  lightSpecular(255, 255, 255);
  directionalLight(204, 100, 204, 0, 0, -1);
  pointLight(243, 250, 120, 35, 40, 36);
  specular(150, 50, 0 );
  shininess(1);
  translate(width/2, height/2, 0); 
  rotateY(radians(((mouseX/(float)width)*180)-90));
  rotateZ(radians(((mouseY/(float)height)*180)-90));



  ba+=bt;
  if (ba>=15)
  {
    bt*=-1;
  }
  if (ba<-15)
  {
    bt*=-1;
  } 


  pushMatrix(); 
    scale(.8, .9, .7); 
    rotateZ(radians(ba));  
    box(50);   //head

    fill(10);
    scale(3, .5, 1); 
    translate(0, 20, 25);
    box(5);     //mouth
  popMatrix();

  //hat
  pushMatrix(); 
    rotateZ(radians(ba+10));
    scale(1, .4, .8); 
    translate(0, -45, 0);  
    fill(0);
    box(50); //base
  
    scale(.5,3, .2); 
    translate(-30, -20, 0);  
    box(25); //left rabbit

    translate(60, 0, 0);  
    box(25); //rigth rabbit
  popMatrix();


  fill(207, 100, 72);
  //neck
  pushMatrix(); 
    scale(.6, .8, .6); 
    translate(0, 30, 0);
    rotate(radians(ba));  
    box(25); 
  popMatrix();

  //Body
  fill(53, 194, 41);
  pushMatrix();
    translate(0, 45, 0); 
    scale(1, .6, .5);
    rotateX(radians(ba));  
    box(50); //body 1
    translate(0, 50, 0);
    rotateX(radians(ba));   
    box(50); //body 2
    translate(0, 50, 0); 
    rotateX(radians(10)); 
    fill(168, 39, 61);    
    box(50); //body 3
  popMatrix();

  fill(207, 100, 72);
  // legs
  pushMatrix();
    translate(0, 190, 0);
    rotateX(radians(-ba));
    translate(-13, -40, 0); 
    scale(.2, 1.5, .2);   
    box(50);  //left leg 
    translate(115, 0, 0);
    box(50); //right leg
    fill(255);
    translate(0,15,0);
    scale(1.2, .5, 1.2);   
    box(50); //right shoe
    translate(-95,0,0);
    box(50); // left shoe
    scale(1, .2, 1.5);  
    translate(0,100,20);
    box(50); // left point
    translate(95,0,0);
    box(50); // left point
  popMatrix();

  fill(207, 100, 72);
  arm(35, 0);
  arm(-35, 180);

  eyes(8);
  eyes(-8);

  translate(0,-10,0);
  fill(247, 46, 20);
  text("I'm sleepy but I have to dance....=_=", -120, -120);
  translate(130, ba-28, 0);
  rotateZ(radians(-30));
  textSize(30);
  text("Z", -55, -60);
  textSize(20);
  text("Z", -30, -65);
  textSize(15);
  text("Z", -10, -70);
}



//arm function
void arm(float xpos, float ang)
{ 
  //upper arm
  pushMatrix();
    translate(xpos, 30, 0);
    x+=t;
    if (x>=-90)
    {
      t*=-1;
    }
    if (x<-175)
    {
      t*=-1;
    }
    rotateY(radians(ang));
    rotateZ(radians(x));
  
  
    translate(0, 15, 0);
    scale(.2, .8, .2);  
  
    box(50);  
  popMatrix();


  //lower arm 
  pushMatrix();
    translate(xpos, 30, 0);
    xx+=tt;
    if (xx>=-90)
    {
      tt*=-1;
    }
    if (xx<-175)
    {
      tt*=-1;
    }
    rotateY(radians(ang));
    rotateZ(radians(xx));
  
    xs+=tts*noise(.5);
    if (xs>=10)
    {
      tts*=-1;
    }
    if (xs<-25)
    {
      tts*=-1;
    }
    translate(0, 30, 0);
    rotateZ(radians(xs));
    translate(0, 25, 0);
  
    scale(.2, .7, .2);   
    box(50); 
  popMatrix();
}


void eyes (float eyepos)
{

  float x=random(0, 100);
  if (x%2<0.1)
  {
    b-=tim; 
    if (b>=2 )
    {
      tim+=.5;
    }
    if (b<=.5)
    {
      tim-=0.1;
    }
  }
  pushMatrix();
    fill(10);
  
    rotateZ(radians(ba));  
    scale(3,.3, 1); 
    scale(.5, b, 1 );           
    translate(eyepos, 0, 18);    
    box(5);
  popMatrix();
}



