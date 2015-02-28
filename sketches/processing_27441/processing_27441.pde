
/*
/*
Modified by Alastair Gray. (Original by Jared "BlueThen" C,  'Wavy'.)
*/

float a;

void setup()
{

  size(500,500);




  stroke(0);

  frameRate(20);
}
void draw()
{

  a -= 0.08;

  background(6);

  for (int x = -22; x < 22; x++) {
   for (int z = -22; z < 22; z++) {

    int y = int(24 * cos(0.55 * distance(x,z,0,0) * a));
     

    float xm = x*17 -8.5;
    float xt = x*17 +8.5;
    float zm = z*17 -8.5;
    float zt = z*17 +8.5;

    int halfw = (int)width/2;
    int halfh = (int)height/2;
     

    int isox1 = int(xm - zm + halfw);
    int isoy1 = int((xm + zm) * 0.5 + halfh);
    int isox2 = int(xm - zt + halfw);
    int isoy2 = int((xm + zt) * 0.5 + halfh);
    int isox3 = int(xt - zt + halfw);
    int isoy3 = int((xt + zt) * 0.5 + halfh);
    int isox4 = int(xt - zm + halfw);
    int isoy4 = int((xt + zm) * 0.5 + halfh);
     

    fill (255,8,16);
    quad(isox2, isoy2-y, isox3, isoy3-y, isox3, isoy3+40, isox2, isoy2+40);
    fill (106,0,183);
    quad(isox3, isoy3-y, isox4, isoy4-y, isox4, isoy4+40, isox3, isoy3+40);
     

    fill(4 + y * 0.05);
    quad(isox1, isoy1-y, isox2, isoy2-y, isox3, isoy3-y, isox4, isoy4-y);
   }
  }
}

float distance(float x,float y,float cx,float cy) {
  return sqrt(sq(cx - x) + sq(cy - y));
}

void keyPressed()
//Takes PNG screenshots when you push S
//Careful - doesn't prompt when overwriting files!
{
  if(key == 's' || key == 'S')
  {
    String filePath = selectInput("Saving PNG - Select or Type File Name");  // Opens file chooser
    if(filePath != null)
    {
      save(filePath + ".png");
    }
  }
}

