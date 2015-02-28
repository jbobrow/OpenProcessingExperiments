
void setup()
{
  size (600,900);
  smooth();
  background (255);
  ohr_r = loadShape("ohr_r.svg");
  ohr_l = loadShape("ohr_l.svg");
    

}

void draw ()
{ 
  kopf(300,200);
  arm (90,330);
  arm_r (-500,370);
  mund (220,150);
  rellipse_left_right (300,190);
  torso (240,260);
  ohren(-230,-200,550);
}



