
float spacer;
float rs;
float r;
float g;
float b;
float s1;
float s2;
float s3;
float r1;
float g1;
float b1;
float e1;
float e2;
float e3;
float e4;
float e5;
float e6;

void setup()
{
  size(500,500);
  rectMode(CENTER);
  smooth();
  noLoop();
  spacer = width/10.0;
}

void draw()
{
  scale(.2);
  for(float i = -50; i<2000; i+=225)
  {
    rs = random(0,500);
    r = random(97,114);
    g = random(3,255);
    b = random(165,0);
    robot(i,i,rs,color(r,g,b));
  }
  
}

void robot(float x, float y, float s, color c)
{
  pushMatrix();
  fill(c);
  translate(x,y);
  
  e1=random(100,500);
  e2=random(100,500);
  e3=random(100,500);
  e4=random(100,500);
  e5=random(100,500);
  e6=random(100,500);
  
  //Left Hind Legs
  line(200,400,125,325);
  line(125,325,e1,475);
  line(225,400,75,350);
  line(75,350,e2,475);  
  line(225,400,175,325);
  line(175,325,e3,475);  
  
  //Right Hind Legs
  line(300,400,375,325);
  line(375,325,e4,475);
  line(275,400,425,350);
  line(425,350,e5,475);
  line(275,400,325,325);
  line(325,325,e6,475);  
  
  pushMatrix();
  //Eye
  s1=random(0,50);
  s2=random(50,100);
  s3=random(100,150);
  r1=random(0,255);
  g1=random(0,255);
  b1=random(0,255);
  rect(width/2,height/2,100,300);
  ellipse(width/2,200,s3,s3);
  ellipse(width/2,200,s2,s2);
  ellipse(width/2,200,s1,s1);
  triangle(200,100,205,50,210,100);
  triangle(290,100,295,50,300,100);
  popMatrix();

  //Left Fore Legs
  line(250,400,350,325);
  line(350,325,350,475);
  line(250,310,400,250);
  line(400,250,400,200);
  
  //Right Fore Legs
  line(250,400,150,325);
  line(150,325,150,475);
  line(250,310,100,250);
  line(100,250,100,200);
  popMatrix();
}

