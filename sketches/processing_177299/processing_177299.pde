
PImage baby;
PImage words;
PImage flowers;


public class Star {
  private final float z; 
  private final float r;
  private final float m;
  private final int x;
  private final int y;
  private final float k;

  public Star(float z, float r, float m, int x, int y, float k) {
    this.z = z; 
    this.r = r;
    this.m = m;
    this.x = x;
    this.y = y;
    this.k = k;
  }

  public void drawS() {
    pushMatrix();
    fill(palette[int(k)], z);
    noStroke();
    //create shape
    beginShape ();
    vertex(x, y);
    vertex(x+r, y+m  );
    vertex( x+r+m, y+r+m  );
    vertex( x+r, y+r+r+m );
    vertex(x, y+r+r+m+m );
    vertex(x-r, y+r+m+r );
    vertex( x-r-m, y+r+m );
    vertex( x-r, y+m );
    vertex (x, y);
    endShape();
    popMatrix();
  }
} 

//Define Color Palette

color[] stardust = {
  #070A39, #37906F, #D2F5E9, #BAF2F2, #FFFFFF,
};
color[] palette= stardust;

int N = 500;
int counter = 0;
int z1 = 12, z2 = 50;
int r1 = 0, r2 = 9;
int m1 = 0, m2 = 100;
int tr = 0;
int wallTime = -1;
ArrayList<Star> als;
//setup code block
void setup () {
  size(900, 629);
  // @pjs preload must be used to preload the image
  /* @pjs preload="last_baby.png"; */
  baby = loadImage ("last_baby.png");
  // @pjs preload must be used to preload the image
  /* @pjs preload="last_words.png"; */
  words = loadImage ("last_words.png");
  // @pjs preload must be used to preload the image
  /* @pjs preload="flowers.png"; */
  flowers = loadImage("flowers.png");
  background(baby);
  colorMode (HSB, 360, 100, 100, 100);
  als = new ArrayList<Star>();
}

//draw code block
void draw () {
  if (counter < N) {
    background(baby);
    tint(255, tr);
    for(Star s: als) s.drawS();
    image(words, 0, 0);
  }
  else {
    if (millis() - wallTime > 2500) {
      background(flowers);
      
    }
  }
}

void mouseMoved() {
  if (counter < N) {
    tr = (int)(255 * mouseX / (float)width);
  }
}  

void mouseDragged() {
  if (counter == N) {
    background (#CCE5E3);
     image(words, 0, 0);
    wallTime = millis();
  }
  else if (counter < N) {
    float z=random (z1, z2); 
    float r=random (r1, r2);
    float m=random(m1, m2);
    int x=mouseX;
    int y= mouseY+(int)random (-50, +100);
    float k = random (1, 5);
    als.add(new Star(z, r, m, x, y, k));
  }
  ++counter;
}


void keyReleased()

{ 
  switch(key) {

  case '1': 
    r1=8;
    r2= 18;
    m1 = 0;
    m2=10;
    z1=0;
    z2=25;
    break;

  case '2':
    //  z=random (30); 
    r1 = 0;
    r2=8;
    m1 = 0;
    m2=40;
    break;

  case'3':
    //z=random (25); 
    r1=0;
    r2=5;
    m1=50;
    m2=100;
    break;

  case '4':
    z1 = 0;
    z2 = 20;
  }
}



