
float m = 270;
float delta = 3; 
float delto = 3; 
int k= 150;
float delte =100;
float r = 0;
float rotx = 0;
float roty = 0;
float rtx = 0.7;
float rty = 0.7;
float dotProduct(float x1, float y1, float z1, float x2, float y2, float z2)
{
  return x1*x2 + y1*y2 + z1*z2;
}

void setup()
{
  size(1600, 900, P3D);
  background(255);
  frameRate(45);
}

void draw() { 
  background(0);

  translate(width/2, height/2, 0);
  rotateX(rtx);
  rotateY(rty);
  for (int i = 1; i <= m; i++) {

    noStroke();

    lights();
    fill(255, 0, 0);
    sphere(i/2);
  }

  if (m >= 180)
  {
    //   background(255);
    m=135;
  }
   stroke(100);


  strokeWeight(1);
  if (frameCount%45-3 ==0)
  {    

    stroke(255, 255, 0);
  }


  for (float deg1 = 0; deg1<360; deg1+= (delte))
  { 

    float phi = radians(deg1);
    for (float deg2 = 0; deg2 < 360; deg2 += (delte)) 
    {   pushMatrix();   
      //  rotateY(radians(mouseY));
       rotateZ(radians(delta/500));
      float theta = radians(deg2);
      strokeWeight(5);
      float x =1000* sin(phi)*cos(theta);
      float y = 1000*sin(phi)*sin(theta);
      float z =1000*cos(phi);
      point(x, y, z);
      strokeWeight(3);
      strokeWeight(1);
   
      line(x, y, z, 1/x, 1/y, 1/z);
 popMatrix();
    }
  }

  for (float deg3 = 0; deg3<360; deg3+= sqrt (delte))
  { 

    float phi = radians(deg3);
    for (float deg4 = 0; deg4 < 360; deg4 += sqrt (delte)) 
    {pushMatrix();   
      //  rotateY(radians(mouseY));
       rotateZ(radians(delta/500));
      float theta = radians(deg4);
      float a =1000* sin(phi)*cos(theta);
      float b = 1000*sin(phi)*sin(theta);
      float c =1000*cos(phi);
      strokeWeight(5);
    
      point(a, b, c);
      strokeWeight(1);
            popMatrix();
      //    line(a, b, c, 0, 0, 0);
    }
  }




  noStroke();

  if (frameCount%45-6 ==0)
  {    


    stroke(0, 255, 255);
    strokeWeight(10);
  }

  line(0, 0, 95, 0, 0, 375);


  if (frameCount%45-7 ==0)
  {    
    strokeWeight(10);

    stroke(0, 255, 255);
  }
  strokeWeight(10);
  line(0, 0, 375, 0, 0, 750);

  pushMatrix();

  translate(0, 0, 1000);

  rotateY(radians(delta));

  fill(19, 79, 237);
  stroke(22, 93, 17);
  strokeWeight(5);
  if (frameCount%45-10 ==0)
  {    
    stroke(255);
    fill(255, 255, 0);
  } else if (frameCount%45-9 ==0)
  {   
    stroke(0, 255, 255);

    fill(0, 255, 255);
  } else if (frameCount%45-8 ==0)
  {    
    stroke(255);
    fill(255, 255, 0);
  }
  strokeWeight(1);
  sphere(250);
  popMatrix(); 

  delta+=25;


  translate(0, 0, 95);
  for (float q = 0; q< 30; q+=1) {
    for (float deg5 = 0; deg5 < 360; deg5 += delto) {
      float d = map(q, 0, 30, 0, 50);
      float thete = radians(deg5);
      float o = d * cos (thete);
      float p = d* sin(thete);
      strokeWeight(5);
      float f = map(q, 0, 30, 100, 255);
      stroke(f);
      point (o, p, q);
      strokeWeight(1);
      point (o, p, (-2)*q);
    }
  }


  stroke(100);
  strokeWeight(3);
  line(0, 0, 0, 0, 0, 30);
  stroke(50);
  strokeWeight(11);
  line(0, 0, 0, 0, 0, -30);
  stroke(255);
  strokeWeight(10);
  point(0, 0, 30);

  translate(-1500, 0, -1000);

  rotateX(rotx);

float nX= 0, nY = 0, nZ=1;


  float    lX=1/(500*sin(radians(m)));
  float lY =1/(500*sin(radians(m)));
  float lZ = 1/m;

  float lMag = sqrt(lX*lX + lY*lY + lZ*lZ);
  lX/=lMag;
  lY/=lMag;
  lZ/=lMag;

  float cosine = dotProduct(nX, nY, nZ, lX, lY, lZ);

  textSize(400);
     fill(cosine*(255), cosine*(3), cosine*(3));

  text("Pump the World", 0, 0, 0);



  translate(200, -500, 0);
  textSize(200);

  
  fill(3, 186, 255);

  text("Kim Taewoo", 0, 0, 0);
  m+=1;
  
  /*translate(height/2, width/2, 0);
    textSize(200);

  
  fill(3, 186, 255);

  text("Pump the World", 0, 0, 0);
  
}*/
}

void mouseDragged() {
  float rate = 1.6E-4;
rotx*=0.9;  rotx += (pmouseY-mouseY) * rate; 
roty*=0.9;  roty +=(mouseX-pmouseX) * rate;
rtx += rotx;
rty += roty;
}
