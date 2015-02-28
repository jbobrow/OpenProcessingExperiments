
//Currents
// spawned from Anenomes by 
// jon_stutters

float z = 0, dx = 0, dy = 0, r = 0;
int count = 0;
int fcount = 0;
int spawnpoint;
float start_x, start_y;
int fColour = 120;
float[] objX = new float[800];
float[] objY = new float[800];
float[] objDir = new float[800];

void setup()
{
  size(920,1080);
  start_x = width/2;
  start_y = height/2;
  for (int i = 0; i < objX.length; i++) {
    objX[i] = -1000;
    objY[i] = -1000;
  }
  spawn();
  noStroke();
}

void spawn()
{
  float direction = 1;
  for (int i = count; i < count+10; i++) {
    if (i == objX.length) {
      count = 0;
      break;
    }
    if(spawnpoint % 2 == 0) {
      direction = 1;
    } else {
      direction = -1;
    }
    objX[i] = start_x;
    objY[i] = start_y;
    objDir[i] = direction;
    spawnpoint++;
    if(spawnpoint > 4) {
      spawnpoint = 0;
    }
  }
  count += 10;
}

void draw() 
{ 
  float theta;
  fill(0, 10);
  rect(0, 0, width, height);
  fill(fColour, 255 - fColour, 100);
  fColour += random(0, 2);
  if(fColour > 255) {
    fColour = 0;
  }
  z += 0.1;
  translate(width/2 + 100* sin(fcount/100), height/2 + 100* cos(fcount/100));
scale(1+sin(fcount/100)/10,1+sin(fcount/100)/10);
  rotate(sin(fcount/100));
  translate(-width/2, -height/2);
  for (int i = 0; i < objX.length; i++) {
    ellipse(objX[i], objY[i], 10, 10);
    theta = i;
    theta = (theta % 6) + (theta / (30 * objDir[i]));
    objX[i] += sin(theta) * random(0.9,4);
    objY[i] += cos(theta) * random(0.9,4);
  }
  fcount++;
  if (fcount % 2 == 0) {
    spawn();
  }
}
//===========SaveImage
void keyReleased() {
  if (key=='s' || key=='S') saveFrame(timestamp()+".png"); }
  String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}
 
//==============
