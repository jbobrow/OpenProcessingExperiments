
class mCurve {

  float x, y, xx, yy, bx, by, t;
  mCurve (float vx, float vy, float vxx, float vyy, float bx, float by, float tt) {
  }
}

mCurve Curve1=new mCurve(1, 1, 1, 1, 1, 1, 1);
mCurve Curve2=new mCurve(1, 1, 1, 1, 1, 1, 1);
mCurve Curve1next=new mCurve(1, 1, 1, 1, 1, 1, 1);
mCurve Curve2next=new mCurve(1, 1, 1, 1, 1, 1, 1);

float xx1, yy1, xx2, yy2, xx1n, yy1n, xx1nn, yy1nn, xx2n, yy2n, xx2nn, yy2nn, counter1, hue, br=100, sat=200;
int prob6 =6;
int prob10 =5;
int prob5 =4;
float strokeBlue, strokeOrange, counterstep, tstep, angle=100;
int savedTime;
int totalTime = 40000;
int globalMode =1;
int backwards=500;
float anglestep=.0005;
int sizew =1000,sizeh=800;
void setup()
{ 
  Curve1.x=random(sizew);
  Curve1.y=random(sizeh); 
  Curve1.xx=random(sizew); 
  Curve1.yy=random(sizeh); 
  Curve1.bx=random(sizew);  
  Curve1.by=random(sizeh);
  Curve2.x=random(sizew);
  Curve2.y=random(sizeh); 
  Curve2.xx=random(sizew); 
  Curve2.yy=random(sizeh);   
  Curve2.bx=random(sizew);  
  Curve2.by=random(sizeh);
  Curve1next.x=random(sizew);
  Curve1next.y=random(sizeh); 
  Curve1next.xx=random(sizew); 
  Curve1next.yy=random(sizeh); 
  Curve1next.bx=random(sizew);  
  Curve1next.by=random(sizeh);
  Curve2next.x=random(sizew);
  Curve2next.y=random(sizeh); 
  Curve2next.xx=random(sizew); 
  Curve2next.yy=random(sizeh);   
  Curve2next.bx=random(sizew);  
  Curve2next.by=random(sizeh);


  size(1000, 800 );
  background(0);
  colorMode(HSB);
  stroke(255, 255, 255);
  frameRate(200);
  savedTime = millis();
}


void draw ()
{   


  int passedTime = millis() - savedTime;
  if (passedTime > totalTime) {
    background(0); 
    savedTime = millis();
  }
  if (int(random(0, backwards))==1) {
    angle=random(PI*2);
    anglestep=-random(0, .0005);
  } 
  if (int(random(0, backwards))==2) {
    angle=random(PI*2); 
    anglestep=random(0, .0005);
  } 

  angle=angle+anglestep;
  if (keyPressed) {  
    if (key == 's') {
      save("normal.png");
    }
    if (key == 'a') {  
      setup();
    }
    if (key == '1') {  
      globalMode =1; 
      background(0);
      totalTime=30000;
    }
    if (key == '2') {  
      globalMode =2;
      background(0);
      totalTime=600000;
    }
    if (key == '0') {  
      globalMode =0;
      background(0);
      totalTime=60000;
    }
    
       if(key=='b') {
    filter(BLUR);
    } 
    
       if(key=='n') {
    noLoop();
    //keyReleased();

    } 
    
   
  } 

  switch (globalMode) {
  case 0: 
    render(0.005, 0.005, 0);
    break;
  case 1: 
   //render(0.025, random(0.01,0.02), 1);
   render(0.020, 0.010, 1);
    break;
  case 2: 
    render(random(0.01,0.06), random(0.01,.017), 2);
    scale(1);
    break;
  }
}


void render (float counterV, float stepV, int mode)

{

  if (mousePressed) {
    if (mouseButton == LEFT) {
      Curve1.bx=mouseX; 
      Curve1.by=mouseY;
    }
    if (mouseButton == RIGHT) {
      Curve2.bx=mouseX; 
      Curve2.by=mouseY;
    }
  }

  if (mode==0) {
    background(0);
    stroke(140, 255, 255); 
    strokeWeight(10); 
    point(Curve1.x, Curve1.y); 
    strokeWeight(10); 
    point(Curve1.xx, Curve1.yy); 
    stroke(20, 255, 255); 
    strokeWeight(10); 
    point(Curve2.x, Curve2.y); 
    strokeWeight(10); 
    point(Curve2.xx, Curve2.yy);
    stroke(140, 200, 60); 
    strokeWeight(10); 
    point(Curve1next.x, Curve1next.y); 
    strokeWeight(10); 
    point(Curve1next.xx, Curve1next.yy);
    stroke(20, 255, 255); 
    strokeWeight(10); 
    point(Curve2next.x, Curve2next.y); 
    strokeWeight(10); 
    point(Curve2next.xx, Curve2next.yy); 
    strokeWeight(20);  
    point(Curve2.bx, Curve2.by);
    stroke(140, 200, 60);
    strokeWeight(20);  
    point(Curve1.bx, Curve1.by); 
    stroke(20, 255, 255);
    strokeWeight(20);  
    point(Curve2.bx, Curve2.by);
    stroke(255, 255, 255);
    textSize(16);
    text("The left and the right clicks control the line curvature", width/2-100, height-180); 
    text("Press 1, 2 and 0 for different modes, 'a' to clear, 's' to save", width/2-100, height-150);
  }
  if (mode==1) {
    translate(width/2, height/2);
  }

  strokeBlue=random(0, 3);
  strokeOrange=random(0, 3);

  if (counter1>=1) {
    hue=random(100, 140); br=100; sat=100;
    if (int(random(0, prob6))>=4) {
      hue=random(200, 250); 
      br=random(80, 150);  
      sat=random(80, 120);
    }
    if (int(random(0, prob10))==1) {
      hue=random(0, 40);   
      br=random(150, 255);   
      sat=random(240, 255);
    }
    if (int(random(0, prob5))==1) {
      hue=random(150, 170);  
      br=random(20, 90);   
      sat=random(240, 255);
    }

    if (mode==1) {
      hue=random(0, 255);
      br=random(100, 255);
      sat=random(110, 255);
      if (br<150) {      sat=random(220, 255);}

    }
    counter1=0;
    Curve1.x= Curve1next.x;
    Curve1.y= Curve1next.y;
    Curve1.bx= Curve1next.bx;
    Curve1.by= Curve1next.by;
    Curve1.xx= Curve1next.xx;
    Curve1.yy= Curve1next.yy;
    Curve1next.x=random(width);
    Curve1next.y=random(height); 
    Curve1next.xx=random(width); 
    Curve1next.yy=random(height); 
    Curve1next.bx=random(width);  
    Curve1next.by=random(height);
    Curve2.x= Curve2next.x;
    Curve2.y= Curve2next.y;
    Curve2.bx= Curve2next.bx;
    Curve2.by= Curve2next.by;
    Curve2.xx= Curve2next.xx;
    Curve2.yy= Curve2next.yy;
    Curve2next.x=random(width);
    Curve2next.y=random(height); 
    Curve2next.xx=random(width); 
    Curve2next.yy=random(height);   
    Curve2next.bx=random(width);  
    Curve2next.by=random(height);
  }
  else
  {
    counter1=counter1+counterV;
    for (float t=0; t<1;t=t+stepV)
    {
      xx1 = (int) ((1-t)*(1-t)*Curve1.x + 2*(1-t)*t*Curve1.bx+t*t*Curve1.xx);  
      yy1 = (int)((1-t)*(1-t)*Curve1.y + 2*(1-t)*t*Curve1.by+t*t*Curve1.yy);  
      xx2 =(int) ((1-t)*(1-t)*Curve2.x + 2*(1-t)*t*Curve2.bx+t*t*Curve2.xx);   
      yy2 = (int)((1-t)*(1-t)*Curve2.y + 2*(1-t)*t*Curve2.by+t*t*Curve2.yy);  
      stroke(random(130, 150), 255, 255);
      if (mode==2) {
         strokeBlue=random(1, 2);
  strokeOrange=random(1, 2);
      }
      strokeWeight(strokeBlue);
      point(xx1, yy1);
      point(xx1, yy1);
      stroke(random(10, 30), 255, 255);
      if (mode==2) {
  strokeBlue=random(1, 2);
  strokeOrange=random(1, 2);
      }
      strokeWeight(strokeOrange);
      point(xx2, yy2);
      stroke(hue, sat, br);
      strokeWeight(random(0));
      line(xx1, yy1, xx2, yy2);  
      if (mode==1) {
        scale(0.965);   
        rotate(angle);
      }
      if (mode==2) {
        scale(1);
      }
    }
  }
  xx1n =(int) ((1-counter1)*(1-counter1)*Curve1.x + 2*(1-counter1)*counter1*Curve1.bx+counter1*counter1*Curve1next.x);   
  yy1n = (int)((1-counter1)*(1-counter1)*Curve1.y + 2*(1-counter1)*counter1*Curve1.by+counter1*counter1*Curve1next.y);  
  xx1nn =(int) ((1-counter1)*(1-counter1)*Curve1.xx + 2*(1-counter1)*counter1*Curve1.bx+counter1*counter1*Curve1next.xx);   
  yy1nn = (int)((1-counter1)*(1-counter1)*Curve1.yy + 2*(1-counter1)*counter1*Curve1.by+counter1*counter1*Curve1next.yy);   
  xx2n =(int) ((1-counter1)*(1-counter1)*Curve2.x + 2*(1-counter1)*counter1*Curve2.bx+counter1*counter1*Curve2next.x);   
  yy2n = (int)((1-counter1)*(1-counter1)*Curve2.y + 2*(1-counter1)*counter1*Curve2.by+counter1*counter1*Curve2next.y);  
  xx2nn =(int) ((1-counter1)*(1-counter1)*Curve2.xx + 2*(1-counter1)*counter1*Curve2.bx+counter1*counter1*Curve2next.xx);   
  yy2nn = (int)((1-counter1)*(1-counter1)*Curve2.yy + 2*(1-counter1)*counter1*Curve2.by+counter1*counter1*Curve2next.yy);  
  Curve1.x=xx1n;
  Curve1.y=yy1n;
  Curve1.xx=xx1nn;
  Curve1.yy=yy1nn;
  Curve2.x=xx2n;
  Curve2.y=yy2n;
  Curve2.xx=xx2nn;
  Curve2.yy=yy2nn;
}

void keyReleased()
{  if(key=='n') {
    loop();}
}
