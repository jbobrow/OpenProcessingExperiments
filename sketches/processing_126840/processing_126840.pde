
int maxStars =3000;
int AllStarsIn=0;
float onceInaWhile=1000;
float Respawn = 2;
float purpleBig =6200;
float YellowSun =4000;

lilStar[] MyStars=new lilStar[maxStars];

float xx1, yy1 ;
float Mycircle1=270;
int numPoints=360; 
float InitialX;
float InitialY;


float bezierXX;  
float bezierYY; 

//float t=0;
boolean fliptime =true;

int SizeW= 800;
int SizeH= 800;

public void setup()
{
  size(800, 800);
  background(0);
  colorMode(HSB);
  stroke(255, 255, 255);
  textSize(15);
  text("Press any key to re-span", SizeW/2, SizeH-100); 
  InitialX=SizeW/2;
  InitialY=SizeH/2;
  bezierXX=SizeW/2;  
  bezierYY=SizeH/2;  

  for (int i=0; i<maxStars;i++)
  {
    MyStars[i] = new lilStar(random(SizeW), random(SizeH), i, .0001, true);
    MyStars[i].hue=random(190, 230);
    MyStars[i].sat=random(210, 250);
    MyStars[i].br=random(210, 250);
    MyStars[i].tvel=random(1,2)/100;
    MyStars[i].strokeWeightVar=random(5, 25);
    MyStars[i].bezierX=SizeW/2;    
    MyStars[i].bezierY=SizeH/2;
  }
    InitialX=SizeW/2;
  InitialY= SizeH/2;
}

public void draw ()
{
  if (keyPressed) { 
    setup();
  }
  if (mousePressed) {
    background(0);
    fill(0, 2);
    rect(0, 0, width, height);
    noFill();
  }

  InitialX=mouseX;
  InitialY=mouseY;

  fill(0, 30);
  rect(0, 0, width, height);
  //noFill();
  for (int i=0; i<maxStars;i++)
  {
    MyStars[i].render();
   // println(i,"BezX-> ",MyStars[i].bezierX," ",MyStars[i].bezierY," XposX-> ",MyStars[i].Xpos," ",MyStars[i].Ypos," t->",MyStars[i].t);
  }

}/* end DRAW */


//CLASS



public class lilStar 
{ 
  float Xpos; float Ypos; float Xvel; float Yvel; float Pxpos; float Pypos;  float colorness; float hue; float sat; float br;double t; float tvel;boolean fliptime; float strokeWeightVar;
  float bezierX, bezierY;

  lilStar(float tempXpos, float tempYpos, int colortemp, double d, boolean flipMytime) { 
    Xpos = tempXpos;Ypos = tempYpos; hue = colortemp; t=d; fliptime=flipMytime;
  } 
  void render () 
  {     
    
 
    if (t>1) {
     // tvel=random(0.0003, 0.019);
      tvel=random(3, 190)/10000;

      if  ((tvel<= 0.0006))
      {hue=random(0, 25);
      br=random(80, 190);
      sat=random(90, 130 );}
      
      if  ((tvel> 0.0006)&&(tvel<=0.0009))
     { hue=random(150, 170);
      br=random(90, 150);
      sat=random(130, 150 );}
       if  ((tvel> 0.0009)&&(tvel<=0.019))
     { hue=random(100, 140);
      br=random(150, 200);
      sat=random(100, 150 );}
      
      Xpos=random(width);
      Ypos=random(height);
      strokeWeightVar=random(1, 6);
     // hue=random(140, 160);
      //br=random(200, 250);
      //sat=random(100, 150 );println(tvel);
      if ((int)(random(0, onceInaWhile))==1) {hue=random(0, 25);  strokeWeightVar=random(1, 12);sat=random(200, 255 );}
      if ((int)(random(0, YellowSun))==1) {hue=random(10, 45);br=random(200, 255);  sat=random(200, 255 );strokeWeightVar=random(16, 35);}
      if ((int)(random(0, purpleBig))==1) {hue=random(170, 190);br=random(80, 200);strokeWeightVar=random(30, 55);}

      
      bezierX=random(width);
      bezierY=random(height);
   
    }
    
    if (t<0) {

      hue=random(130, 180);
      br=random(40, 80);
      sat=random(50, 150 );
      if ((int)(random(0, onceInaWhile))==1) {hue=random(0, 20);br=random(220, 255); sat=random(200, 250 );}
      if ((int)(random(0, Respawn))==1)   {t=1.000001;}

    }
    
    
    if (t>1 || t<0) {
      fliptime=!fliptime; if (t>0){t=1;}if (t<0){t=0;}
    }
    if (fliptime) {
      t=t+tvel;
    }
    else {
      t=t-tvel;
    }
    
    
    xx1 = (int) ((1-t)*(1-t)* Xpos + 2*(1-t)*t*bezierX+t*t*InitialX);  
    yy1 = (int)((1-t)*(1-t)*Ypos + 2*(1-t)*t*bezierY+t*t*InitialY);  

    stroke(hue, sat, br);
    strokeWeight(strokeWeightVar);
    point(Pxpos, Pypos);
    Pxpos=xx1;
    Pypos=yy1;
  }
}



