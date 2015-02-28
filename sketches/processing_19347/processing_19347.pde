
PShape whiteballs; // scalable vector graphic type
PShape pupils;
PShape highlights;
PShape head;
PShape liner; 
PShape lids;
float rotx = 27; //width of roation
float roty = 30; //height of roation
float rotpatx = 222; //center of hor roation point
float rotpaty = 260; //center of vert roation point
float angle; //angle of rotation
float marginx = -4;
float marginy = 14;
int startX = -312;
int stopX = 260;
int startY = -312;
int stopY = 400;
float x = startX;
float y = startY;
float dx, dy;
float lidSpeed;
float screenAlpha = 0;
float dAlpha = 0;
float step = 0.002;
float pct = 0.0;


void setup() {
  size (640,480);
  //img = loadImage("");
  smooth();

  whiteballs = loadShape ("white_balls.svg");
  pupils = loadShape ("pupils.svg");
  highlights = loadShape ("highlights.svg");
  head = loadShape ("head.svg");
  liner = loadShape ("liner.svg");
  lids = loadShape ("lid.svg");
}
void draw()
{
  background(255);
  if (mouseX >= rotpatx)
  {

    angle = atan( (mouseY - rotpaty) / (mouseX - rotpatx));
  }
  else
  {
    angle = atan( (mouseY - rotpaty) / (mouseX - rotpatx)) + PI ;
  }

  shape(whiteballs,0,0);

  if(dist(mouseX, mouseY, rotpatx, rotpaty) > dist((rotx/2 * cos(angle)) + rotpatx, ((roty/2) * sin(angle)) + rotpaty, rotpatx,rotpaty))
  {
    shape(pupils,((rotx/2) * (cos(angle)))+marginx, ((roty/2) * (sin(angle)))+marginy);
  }
  else
  {
    shape(pupils, mouseX- rotpatx+marginx, mouseY - rotpaty+marginy);
  }
  shape(highlights,0,0);
  if(mousePressed && (mouseButton == RIGHT)) {
    frameRate(1000);
    shape(lids,-25,0);
  }

  if (mousePressed) {
    dx = -57;
    dy = -16;
    lidSpeed = .01;
    dAlpha = 250;
  } 
  else {

    dx = startX;
    dy = startY;
    lidSpeed = .2;
    dAlpha = 0;
  }

  x += (dx - x) * lidSpeed;
  y += (dy - y) * lidSpeed; 
  screenAlpha += (dAlpha - screenAlpha) * lidSpeed;

  println(x+":"+y);

  shape(lids,x,y);
  shape(head,0,0);
  shape(liner,0,0);

  // draw fade
  fill(0, screenAlpha);
  rect(0, 0, width, height);
}


