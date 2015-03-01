
int delta =3;
float VX = 0.2;
float VY = 0.2;
float degree = radians(22.5);
float rb = random(10,150);

void setup()
{
  size(1500,1000, P3D);
  frameRate(100);
}

void draw()
{
  translate(width/2, height/2, 0);
  background(38, 96, 139);
  
  
  
  if(key==CODED)
  {
    if(keyCode==UP)
    {
      rotateX(radians(VX));
       VX++;
    }
    if(keyCode==DOWN)
    {
      rotateX(-radians(VX));
      VX++;
    }
    if(keyCode==RIGHT)
    {
      rotateY(radians(VY));
      VY++;
    }
    if(keyCode==LEFT)
    {
      rotateY(-radians(VY));
      VY++;
    }
  }
 
 
 
  //Draw Red Octopus
  drawSphere(200, 0,0,0, 255,0,0,100);//head
  drawSphere(11,-200*sin(degree),0, 200*cos(degree),0,0,0,255);//eye1
  drawSphere(11,200*sin(degree), 0,200*cos(degree),0,0,0,255);//eye2
  drawMouse(40,0,20,200);//mouse_outside
  drawMouse(35,0,20,200);//mouse_inside
 
 
 
 
  //draw eight legs
  for(int i=0;i<8; i++)
  {
    pushMatrix();
    rotateY(map(i, 0,7,0,360));
    drawLeg(10, random(50,100), 100*1.6, 0); //the basic leg for 8
    popMatrix();
  }
 // key Pressed_draw bubble / else draw Fish
  if(keyPressed)
  {
    for(int j = 0; j<10; j++)
    {
      noStroke();
      drawSphere(rb, random(-width, width), random(-height, height), random(-600, 600), random(20), random(100), random(255), 10);
    }
  }
  else
  {   
    drawFish(random(50), random(50));
  }// key Pressed_draw bubble / else draw Fish
}



//////////// function

// make Sphere to making body, eyes, bubbles
void drawSphere(float r, float X, float Y, float Z, float R, float G, float B, float O)
{  
  float lx=0, ly=0, lz=1;
  //orign
  float x1= mouseX;
  float y1= mouseY;
  float z1= -r;
 
  //r vector
  float rx= -r/2;
  float ry= 1.73205080757*r/2;
  float rz= 0;
 
  //s vector
  float sx= r/2;
  float sy= 1.73205080757*r/2;
  float sz= 0;
 
 
  //cross product
  float cx=( ry*sz -rz*sy );
  float cy=-( rx*sz -rz*sx);
  float cz=( rx*sy - ry*sx );
 
  float size = sqrt(cx*cx +cy*cy+ cz*cz );
  cx=cx/size;
  cy=cy/size;
  cz=cz/size;

  float brightness = abs(cx*lx +cy*ly +cz*lz);
  
  for(float deg=0; deg<360; deg += delta)
  {
      float theta = radians(deg);
        
      for(float deg2 = 0; deg2 < 360; deg2 += delta)
      {     
        float phi = radians(deg2);
        float x = r * sin(phi) * cos(theta);
        float y = r * sin(phi) * sin(theta);
        float z = r * cos(phi);
        
        strokeWeight(10);
        stroke(R, G*brightness, B*brightness, O);
        point(x+X,y+Y,z+Z);
      }
    }
}


//cylinder
void drawMouse(float r, float X, float Y, float Z)
{
  
  for(float z=0; z<50; z += 5)
  {
    for(float deg = 0; deg < 360; deg += 5)
    {
      float theta = radians(deg);
      float x = r * sin(theta);
      float y = r * cos(theta);
        
      strokeWeight(5);
      stroke(188,61,63,100);
      point(x+X,y+Y,z+Z);
    }
  }
}

//a leg
void drawLeg(float T, float X, float Y, float Z)
{
  
  pushMatrix();
  for(int r = 20; r>0; r-=5)
  {
    //make a new datum
    float cy = map(r, 0, 200, 0, 90);
    float cz = r * (-cos(radians(cy)));
    

   //make 8 legs
   for(int i=0; i<=2; i++)
   {
     translate(T, cy, cz);
     
       //make a datum_leg
    for(float y = 0; y<10; y++)
    {
      for(float deg=0; deg<360; deg ++)
      {
        float theta = radians(deg);
        float x = 2*r * sin(theta);
        float z = 2* r * cos(theta);
        
        strokeWeight(5);
        if(deg<180) stroke(255,0,0,150);
        else stroke(255,0,0,100);
        point(x+X,y+Y,z+Z);
         
    }
        }
      }
     
  }  
  popMatrix();

}


//fish
void drawFish(float X, float Y)
{
  float x = mouseX-width/2;
  float y = mouseY-height/2;
  if(keyPressed == false)
  {
  beginShape();
  noStroke();
  fill(255,100,255);
  //body
  ellipse(x+40+X,y+50+Y,65,50);
  //tail
  arc(x+86+X,y+50+Y,30,40,(PI/180)*50,(PI/180)*310);
  fill(255);
  //fin
 
  //eye
  arc(x+28+X,y+42+Y,24,20,(PI/180)*0,(PI/180)*180);
 
  //mouth
  arc(x+18+X,y+60+Y,10,8,(PI/180)*0,(PI/180)*180);
  fill(0);
  arc(x+32+X,y+42+Y,15,15,(PI/180)*0,(PI/180)*180);
  endShape();
  }
}



