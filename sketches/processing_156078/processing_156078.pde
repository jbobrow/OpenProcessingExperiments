
PImage fun;
PImage wood;
PFont Font;
int up=100;
int jump;

void setup(){
  fun = loadImage("funghi.png");
  wood = loadImage("wood.png");
  Font = loadFont("STLibian-SC-Regular-48.vlw");
  size(800,500);
}

void draw(){
  background(25,25,random(80,150));
  
  //mouse position
  
  if(mouseY>250 && mouseY<320)
  {
    for(int i=0;i<12;i++)
    {
      if(mouseX>-50+80*i && mouseX<30+80*i)
      {  
        up= i;
      }
    }
 
  }
  
  //planting funghi
  
  float sinOfTime = sin(millis() *0.007);
  float sinMappedX = map(sinOfTime,-1.0,1.0,0,10);
  float sinMappedY = map(sinOfTime,-1.0,1.0,0,10);
  float X=0;
  float Y=0;
  
  for(int i=0; i<12; i++)
  {
    println("i="+i);
    
    if(i==up)
    {
      jump=-30;
      up=100;
      X = sinMappedX;
      Y = sinMappedY;
      println(jump);
    }
    else
    {
      X =0;
      Y =0;
      jump=0;
    }
    imageMode(CENTER);
  image(fun,-50+80*i,320+jump,150+X,150+Y);
  }
  imageMode(CORNER);
  image(wood,0,0,800,500);
}


