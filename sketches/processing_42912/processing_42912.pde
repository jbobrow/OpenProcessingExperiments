
float a=3*PI/2;
//float a=3*sin(3*PI/2);
float deltaA=.01;//приращение(длина по горизонтали)
float pathX=0;//путь рисующего эллипса по x
float pathY=50;//путь рисующего эллипса по y
float centerY=50;//высота крестика
float Y=1.5;//длина линии по y
float xSpeed=.93;
 
void setup() 
{
  size(1920,1080);
  background(255);
  frameRate(460);
}
 
void draw() 
{
  smooth();
   
  pathX=pathX+xSpeed;//скорость движения=0.93
  //pathY=centerY+Y*sin(a);
  pathY=centerY+Y/tan(a)/sin(a);//длина линии по y
  a=a+deltaA;//приращение(длина по горизонтали)
  //a=a+2*tan(deltaA);
   
  //fill(pathY/2,0,pathX/2,255-pathY/3);
  //fill(random(pathY,255),random(pathY,255),random(pathY,255),100+pathY/3);
  fill(255,50,50);
  noStroke();
  //ellipse(pathX, pathY, 10,10-4*tan(a));
  ellipse(pathX, pathY, 8*cos(a)/tan(a),4*tan(a));//форма волны от функции сверху вниз
  if (pathX>=1920/2)//идёт до сюда справа 
  {
    xSpeed=xSpeed*-1;
    a=a+PI;
    centerY=centerY+30;
  } else if (pathX<=0) //идёт до сюда слева
  {
    xSpeed=abs(xSpeed);
    a=a-PI;
    centerY=centerY+30;
  }
}
              
                
