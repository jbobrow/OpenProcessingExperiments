
int d=0;
int t=1;
int m=30/50;
void setup()
{
  size(600,600);
  frameRate(10);
  smooth();

}

void draw()
{

  background(255);
  ellipseMode(CENTER);
  noStroke();

  //pink
  fill(237,26,80);
  ellipse(420,210,80-d,80-d);

  //yellow big back
  fill(255,244,83);
  ellipse(260,200,200-d,200-d);

  //black center hidden
  fill(0);
  ellipse(360,280,80+d,80+d);

  //redish purple small behind center orange
  fill(169,15,43);
  ellipse(360,190,20+d,20+d);

  //small yellow behind orange
  fill(255,208,61);
  ellipse(380,230,70-d,70-d);

  //red between yellow and clack
  fill(193,26,27);
  ellipse(390,260,30+d,30+d);

  //orange back
  fill(240,73,62);
  int s=120+d;
  ellipse(300,230,s,s);

  //black left bottom hidden
  fill(0);
  ellipse(250,380,70-d,70-d);

  //yellow big right bottom
  fill(255,208,61);
  ellipse(350,370,150+d,150+d);

  //yellow right bottom front
  fill(255,244,83);
  ellipse(380,320,70-d,70-d);

  //black right big

  fill(0);
  ellipse(440,280,60+d,60+d);

  //pink
  fill(237,26,80);
  ellipse(170,350,80+d,80+d);

  //orange behind red front
  fill(246,134,31);
  ellipse(180,250,30+d,30+d);

  //red front
  fill(181,23,24);
  ellipse(240,300,170-d,170-d);

  //black left front
  fill(0);
  ellipse(220,230,60-d,60-d);

  //black right bottom front
  fill(0);
  ellipse(360,450,40-d,40-d);
  
  //black motion
  fill(0);
  if(t>0)
  {
  // frameRate(5);
  ellipse(180-d*random(0,3),230-d*random(0,3),50-d,50-d);
  }
  frameRate(60);
  d=d+t;
  println(d);
  if(d==50|| d==0)
  {
    t=t*-1;
  }
}

//void mousePressed()
//{
//  save("atom4.jpg");
//}



