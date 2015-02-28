
int count = 0; 
float[] xp;
float[] yp;
float[] sun_size;
int[] active;

void setup() 
{
  size(600, 900);
  background(0);
  noStroke();
  smooth();

  xp = new float[count];
  yp = new float[count];
  sun_size = new float[count];
  active = new int[count];
}

void draw() 
{
  background(0);
  
  float fill_arc = 0;
  for (float arc_y = 1220; arc_y < 1400; arc_y = arc_y + 2) {
    fill((fill_arc * 1.5) + 136, fill_arc + 82, fill_arc + 11);
    arc(300, arc_y, 1000, 1000, PI, TWO_PI);
    fill_arc = fill_arc - 1;
  }
  
  if (mousePressed && (mouseButton == LEFT) == true)
  {
    sun_size[count-1]++;
  }

  for (int i=0; i<count; i++) {
    fade(i);
    drawSun(i);
  }

}

void fade(int ind) {
  if (active[ind] == 1 && sun_size[ind] > 0) {
    sun_size[ind] -= 0.2;
  }
      if (mousePressed && (mouseButton == RIGHT) == true)
  {
    saveFrame();
  }
}

void mousePressed()
{
  xp = expand(xp, count + 1);
  yp = expand(yp, count + 1);
  sun_size = expand(sun_size, count + 1);
  active = expand(active, count+1);
  xp[count] = mouseX;
  yp[count] = mouseY;
  sun_size[count] = 0;
  active[count] = 0;
  count ++;
}

void mouseReleased()
{
  if (active[count-1] == 0) {
    active[count-1] = 1;
  }
}


void drawSun(int ind)
{
  float sun_r = sun_size[ind]/1.2;
  float alph = 10 + sun_size[ind]/10;
  for (float r = sun_r; r > 0; r = r - 10) {
    fill(255, 255, 251, alph);
    ellipse(xp[ind], yp[ind], r * 2, r * 2);
  }
    fill(255, 255, 251, 230);
    ellipse(xp[ind], yp[ind], sun_r * 0.5, sun_r * 0.5);
}

