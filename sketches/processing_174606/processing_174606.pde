
float delta = 3; //determine vartical density of eggs
float a = 0; //determine horizontal density of eggs AND crash order
float p = 300; //determine size of spherical
float X, Y = 0; //determine speed of eggs rotation
float range = 100; //determine size of triangle lights
float [] limits = new float[3]; // determine break order
int num = 0, maxNum = 3;
float deltaEggCrash = 360; //determine egg crash quantity

void setup()
{
  size(900, 700, P3D);
  smooth();

  for (int i =0; i<3; i++) {
    limits[i] = 360;
  }
}

//set when mousePressed egg crashed in order
void mousePressed() {
  if (num == maxNum)
    return;

  if (limits[num]>0)
    limits[num]-=deltaEggCrash;
  else if (num<maxNum) {
    num++;
  }
}

void draw()
{
  if (num==3) {
    range+=2;
  } else //draw light after all eggs gone
  background(#B71A1A);
  translate(width/2, height/2, 0);

  //make eggs rotate
  rotateZ (X);
  rotateX (Y);

  X += 0.009; //determine speed of eggs rotation
  Y += 0.009; //determine speed of eggs rotation

  //set 4 eggs brood each other
  for (float a = 0; a < 360; a += 5)
  {
    for (float deg = 0; deg <360; deg += delta)
    {
      float theta = radians(deg);

      //draw frist egg and set crash order the first
      if (a<limits[0]) {
        float x1 = p * sin(a) * cos(theta) /1.5;
        float y1 = p * sin(a) * sin(theta) /1.5;
        float z1 = p * cos(a);
        stroke(40);
        strokeWeight(3);
        point(x1, y1, z1);
      }
      //draw second egg and set crash order the second
      if (a<limits[1]) {
        float x4 = p / 1.1 * sin(a) * cos(theta) /1.5;
        float y4 = p / 1.1 * sin(a) * sin(theta)/1.5;
        float z4 = p / 1.1 * cos(a);
        stroke(255);
        strokeWeight(2);
        point(x4, y4, z4);
      }
      //draw third egg and set crash order the third
      if (a<limits[2]) {
        float x3 = p / 1.5 * sin(a) * cos(theta)/1.5;
        float y3 = p / 1.5 * sin(a) * sin(theta)/1.5;
        float z3 = p / 1.5 * cos(a);
        stroke(0);
        strokeWeight(2);
        point(x3, y3, z3);
      }

      //draw Last egg
      float x2 = p / 4 * sin(a) * cos(theta);
      float y2 = p / 4 * sin(a) * sin(theta);
      float z2 = p / 4 * cos(a);
      stroke(255);
      strokeWeight(3);
      point(x2, y2, z2);
    }
  }
}

