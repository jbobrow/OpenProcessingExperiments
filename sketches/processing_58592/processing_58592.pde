
//set window, bg &anti-alias
void setup(){
size(800,600);
background(0);
smooth();
}

//set drawing
void draw(){
//set static image
noLoop();

//change color mode to hue, saturation & brightness & set values
colorMode(HSB, 360,100,100,100); 
  
//variables
int obj=380;
float posX,posY,posX2,posY2;

//positions values
posX=width/2 ;
posY=height/2 ;
posX2=width/2 ;
posY2=height/2 ;

//loop
for (int i=0; i<obj; i=i+5)
{
  //position variables
   posX=40+2*random(0,i);
   posY=height/2+random(-i,i);
  
  //color variable map
  float c2 =map(i,0,obj,0,360);    
  //arc diameters
  float pArc= random(50,100);
  //countour  
  noStroke();
  fill(c2,random(70,120),random(100,200),random(100));
  //arc size
  float b=random(0,PI);
  float bx=random(PI,3*PI);
  
  //map arc start
  b=map(i,0,obj,10,1);
  bx=map(i,0,obj,15,1);
  pArc=map(i,0,obj,50,1);
  
  arc(posX,posY,pArc,pArc, b, bx);
  
  //line deifnitons - color & stroke
  stroke(255);
  strokeWeight(2);
  point(posX,posY);
  stroke(255,100);
  strokeWeight(0);
  
  line(posX,posY,posX2,posY2);
  //use last coordinates to start next line
  posX2=posX;
  posY2=posY;
}

saveFrame("line-####.png");
}

