
float delta = 10;
float r = 200;
void setup()
{
 size(800,800,P3D);
 frameRate(5); 
 background(0);
}

void draw()
{
   background(0);
   translate(width/2,height/2);
  /*
  PFont font = loadfont("Helvetica-Bold-48.vlw");
    PFont font1 = loadfont("Helvetica-Bold-30.vlw");
      PFont font2 = loadfont("Helvetica-Bold-20.vlw");
*/

{
  
  /*
  float doom00 = random(0,2);
  if(doom00==0)
  {textFont(font);}
  else if(doom00 ==1)
  {textFont(font1);}
  else if(doom00 ==2 )
  {textFont(font2);}
  */
  int doom1 = int(random(0,13));
  int doom2 = int(random(0,13));
  int doom3 = doom1+doom2;
  if(doom3>13)
  {int chic = doom3-13;
   doom3 -= chic;}


  String at = "flow";


  //float x = random(0, width);
  //float y = random(0, height);
  fill(255);

   for(float dig=0; dig<180; dig+=10)  
{
    
   for(float dog=0; dog<360; dog+=10) 
{

   float x = r * sin(radians(dig)) * cos(radians(dog));
    float y = r * sin(radians(dig)) * sin(radians(dog));
    float z = r * cos(radians(dig));
//rotateX(radians(dig));

translate(x,y,z);
rotateZ(radians(dog));
rotateX(radians(dig));
  textSize(int(random(20,30)));
 text(at,0,0,0);

rotateX(radians(-dig));
rotateZ(radians(-dog));
translate(-x,-y,-z);
//rotateX(radians(dig));
  }
  }
} 
}

