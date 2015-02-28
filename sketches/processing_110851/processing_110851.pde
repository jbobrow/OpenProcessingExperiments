
//Sam Friedlander
//copywrite 9/14/13

float x,y,wd,ht,count;
color red,tan,agrey,bgrey,cgrey;
 float r1,r2,r3,r4,r5;

void setup()
{
  size(500, 500);
  red= color(220,53,34);
  tan= color(217,203,158);
  agrey= color(55,65,64);
  bgrey= color(42,44,43);
  cgrey= color(30,30,32);
  frameRate(60);
  r1 = 0;
  r2 = 0;
  r3 = 0; 
  r4 = 0;
  r5 = 0;
}

void draw()
{
 background(red);
 
 cell(mouseX+x,mouseY+y,pmouseX+x,pmouseY+y);
 
 
 
} 

void cell(float pgen, float pgen2, float pgen3, float pgen4)
{
 
  if (frameCount%6==0){
  r1 = random(30,32);
  r2 = random(10,13);
  r3 = random(25,29);
  r4 = random(35,42);
  r5 = random(20,21);
}
 
 
 fill(tan);
 ellipse(pgen-r1+(pgen3/4),pgen2+r5+(pgen3/6),3,3);
 ellipse(pgen+r2-(pgen3/4),pgen2+r4-(pgen3/4),3,3);
 ellipse(pgen-r3-(pgen3/6),pgen2-r3+(pgen4/4),3,3);
 ellipse(pgen-r4-(pgen4/6),pgen2-r2+(pgen3/2),3,3);
 ellipse(pgen+r5+(pgen3/8),pgen2+r1+(pgen3/12),3,3);
 

 stroke(tan);
 //ellipse 1-2,2-3,3-4,4-5,5-1
 line(pgen-r1+(pgen3/4),pgen2+r5+(pgen3/6),pgen+r2-(pgen3/4),pgen2+r4-(pgen3/4));
 line(pgen+r2-(pgen3/4),pgen2+r4-(pgen3/4),pgen-r3-(pgen3/6),pgen2-r3+(pgen4/4));
 line(pgen-r3-(pgen3/6),pgen2-r3+(pgen4/4),pgen-r4-(pgen4/6),pgen2-r2+(pgen3/2));
 line(pgen-r4-(pgen4/6),pgen2-r2+(pgen3/2),pgen+r5+(pgen3/8),pgen2+r1+(pgen3/12));
 line(pgen+r5+(pgen3/8),pgen2+r1+(pgen3/12),pgen-r1+(pgen3/4),pgen2+r5+(pgen3/6));
 
 //ellipse 1-3,3-5,5-2,2-4,4-1
 line(pgen-r1+(pgen3/4),pgen2+r5+(pgen3/6),pgen-r3-(pgen3/6),pgen2-r3+(pgen4/4));
 line(pgen-r3-(pgen3/6),pgen2-r3+(pgen4/4),pgen+r5+(pgen3/8),pgen2+r1+(pgen3/12));
 line(pgen+r5+(pgen3/8),pgen2+r1+(pgen3/12),pgen+r2-(pgen3/4),pgen2+r4-(pgen3/4));
 line(pgen+r2-(pgen3/4),pgen2+r4-(pgen3/4),pgen-r4-(pgen4/6),pgen2-r2+(pgen3/2));
 line(pgen-r4-(pgen4/6),pgen2-r2+(pgen3/2),pgen-r1+(pgen3/4),pgen2+r5+(pgen3/6));
}

void keyPressed()
{
  if (key == CODED)
  {

    if (keyCode == RIGHT)
    {
      x+=4;
    } 


    if (keyCode == LEFT)
    {
      x-=4;
    }

    if (keyCode == UP)
    {
      y-=4;
    }

    if (keyCode == DOWN)
    {
      y+=4;
    }
  }
}


