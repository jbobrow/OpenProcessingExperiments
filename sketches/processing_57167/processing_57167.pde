
float t=0.0;
float x=0.0;
float y=0.0;
float z=0.0;
float x2=0.0;
float y2=0.0;
float z2=0.0;


int f=0;
	
void setup() {
  size(800, 800, P3D); 
  strokeWeight(2);

}

void draw() {
  t++;
    lights();
    strolling();
  camera(x,y,z,x2,y2,z2,0.0,1.0,0.0);
    
  background(200);
  mouseClicked();


  translate(width/2-400,height/2-400,0);


//  rotateX(PI+t/100);
  rotateY(PI +t/100);
  fill(0,0,255,150);
  sphereDetail(7);
  sphere(100);


  translate(width/2-400,height/2-400,-300);
  rotateX(PI+t/100);
  rotateY(PI +t/100);
  fill(0,0,255,50);
  sphereDetail(7);
  sphere(50);

  
    translate(width/2-400,height/2-400,-300);
  rotateX(PI+t/100);
  rotateY(PI +t/90);
  fill(0,0,255,50);
  sphereDetail(7);
  sphere(50);

  
  
    translate(width/2-400,height/2-400,-300);
  rotateX(PI+t/100);
  rotateY(PI +t/80);
  fill(0,0,255,50);
  sphereDetail(7);
  sphere(50);

  
    translate(width/2-400,height/2-400,-300);
  rotateX(PI+t/100);
  rotateY(PI +t/70);
  fill(0,0,255,50);
  sphereDetail(7);
  sphere(50);

  
    translate(width/2-400,height/2-400,-300);
  rotateX(PI+t/100);
  rotateY(PI +t/60);
  fill(0,0,255,50);
  sphereDetail(7);
  sphere(50);


  
    translate(width/2-400,height/2-400,-300);
  rotateX(PI+t/100);
  rotateY(PI +t/50);
  fill(0,0,255,50);
  sphereDetail(7);
  sphere(50);

  
    translate(width/2-400,height/2-400,-300);
  rotateX(PI+t/100);
  rotateY(PI +t/110);
  fill(0,0,255,50);
  sphereDetail(7);
  sphere(50);

  
    translate(width/2-400,height/2-400,-300);
  rotateX(PI+t/100);
  rotateY(PI +t/120);
  fill(0,0,255,50);
  sphereDetail(7);
  sphere(50);
  
    translate(width/2-400,height/2-400,-300);
  rotateX(PI+t/100);
  rotateY(PI +t/130);
  fill(0,0,255,50);
  sphereDetail(7);
  sphere(50);
  
  translate(width/2-400,height/2-400,-300);
  rotateX(PI+t/100);
  rotateY(PI +t/140);
  fill(0,0,255,50);
  sphereDetail(7);
  sphere(50);
//  popMatrix();

}
//void mouseClicked()
//{
//  if (mousePressed && (mouseButton == LEFT)) 
//
//  {
//    f+=10;
//
//  }
//   else if (mousePressed && (mouseButton == RIGHT)) 
//
//  {
//    f-=10;
//
//  }
//
//
//    
//}
void strolling()
{
  if(keyPressed)
  {
    if(key=='e')
    {
      y-=10;
      y2-=10;
    }
    if(key=='c')
    {
      y+=10;
      y2+=10;
    }
    if(key=='s')
    {
      x-=10;
      x2-=10;
    }
    if(key=='f')
    {
      x+=10;
      x2+=10;
    }

  if(key=='4')
  {
    x2-=10;
  }
  if(key=='6')
  {
    x2+=10;
  }
  if(key=='2')
  {
    y2-=10;
  }
  if(key=='8')
  {
    y2+=10;
  }

    
  }
    if (mousePressed && (mouseButton == LEFT)) 

  {
    z-=10;

  }
   else if (mousePressed && (mouseButton == RIGHT)) 

  {
    z+=10;

  }
  

}

