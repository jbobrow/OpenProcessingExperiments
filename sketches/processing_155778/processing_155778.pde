
Moon moon0;
Moon moon1;
Moon moon2;
Moon moon3;
Moon moon4;
Moon moon5;
Moon moon6;
Moon moon7;

float nomoons = 7; //the number of "moons" spread across the width of the window.
float wave = 100; //sets the speed that the expanding wave moves across the ellipses, in ms
int numberlines = 3; //number of lines per frame in expanding moons

void setup()
{
  size(800, 200);
  smooth();
  background (5);
  frameRate(60);
  wave = wave * ((frameRate * 0.001) * frameRate); //convert wave to frames independent of frame weight.
  moon0 = new Moon(0);//Moon has identifying argument.
  moon1 = new Moon(1);
  moon2 = new Moon(2);
  moon3 = new Moon(3);
  moon4 = new Moon(4);
  moon5 = new Moon(5);
  moon6 = new Moon(6);
  moon7 = new Moon(7);
}

void draw(){
  fill(0, 10); //creates an almost opaque background on each frame to create motion illusion.
  rect(0, 0, width, height); //the background is the size of the drawing screen.
  moon0.create();
  moon1.create();
  moon2.create();
  moon3.create();
  moon4.create();
  moon5.create();
  moon6.create();
  moon7.create();
}

class Moon { //DEFINE CLASS

  float direction = 1; 
  float dia;
  float max;
  float xoffset = (width / nomoons);
  float yoffset = (height / 2); //moons are always in the center of the screen
  float delay;
  float moono;
  float red = random(255);
  float green = random(255);
  float blue = random(255);
  float cycle;
  
Moon(int moonoa) { //CONSTRUCTOR
  max = width / (2 * nomoons);
  moono = moonoa;
  xoffset = (moono * xoffset) + max;
  delay = moono * (wave / nomoons); //ensures that the expansion triggers in the correct order (left to right)
  cycle = (max / wave); //amount that the circle needs to expand per frame to reach the maximum diameter in the designated time.
}

  void create() {

  float time = frameCount;
  float reddir = int(random(1)); //decide between 0 and 1, save it in the variable.
  float greendir = int(random(1));
  float bluedir = int(random(1));
  
  if (time >= delay) {//doesn't start drawing process until 
    dia += cycle * direction;
      if (abs(dia) > (max - 0.01)) {//near maximum, change direction.
        direction = -direction;
        
        //the following section makes each RGB color value walk up or down by 1 in each frame.
        
        if (reddir == 0) {
          red -= 1;
        }
        else {
          red += 1;
        }
         if (greendir == 0) {
          green -= 1;
        }
        else {
          green += 1;
        }
         if (bluedir == 0) {
          blue -= 1;
        }
        else {
          blue += 1;
        }
    }

  stroke (abs(red), abs(green), abs(blue), 255); //take absolute value of numbers in case they drop below 0.
  
  ellipseMode(RADIUS);
  strokeWeight(0.5);
  ellipse(xoffset, yoffset, dia, dia); //make a circle
  strokeWeight (random (0.3, 1.0));
  float angle1 = random (TWO_PI), angle2 = random (TWO_PI);
  for (int i = 0; i < numberlines; i++) { //make lines that span across the circle's circumfrence. Smaller number for numberlines = less chaotic, but quicker frame rate
    PVector p1 = new PVector (xoffset + cos (angle1) * dia, yoffset + sin (angle1) * dia);
    PVector p2 = new PVector (xoffset + cos (angle2) * dia, yoffset + sin (angle2) * dia);
    line (p1.x, p1.y, p2.x, p2.y);
   }
  }
  }
 }
 

