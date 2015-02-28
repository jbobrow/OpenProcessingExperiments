
final int MAX = 200;
 
int [] x;
int [] y;
color [] col;
float [] starSize;

int starIndex = 0;
 
void setup () {
  size (600, 600);
  noStroke ();
  smooth ();
  background (255);
  frameRate(20);
  col = new color [MAX];
    x = new int [MAX];
    y = new int [MAX];
    starSize = new float [MAX];
}

void draw () {
    background (255);
    // bestehende Sterne vergrössern, bewegen und neu zeichnen
    growStars();
    moveStars();
    drawStars();
    
    // Bei Mausklick einen neuen Stern zeichnen
    if (mousePressed && (mouseButton == LEFT) ) {
        createStar();
    }
}

void createStar()
{
    col[starIndex] = color(random (255), random (255), random (255));
    x[starIndex] = mouseX;
    y[starIndex] = mouseY;
    starSize[starIndex] = random(1,4);
    fill (col[starIndex]);

    float a = starSize[starIndex]*1;
    float b = starSize[starIndex]*3;
    float c = starSize[starIndex]*5;
    float d = starSize[starIndex]*2;
       
    triangle(x[starIndex]-c, y[starIndex]-a, x[starIndex]+a, y[starIndex]-a, x[starIndex]+b, y[starIndex]+c);
    triangle(x[starIndex]-b, y[starIndex]+c, x[starIndex]-a, y[starIndex]-a, x[starIndex]+c, y[starIndex]-a);
    triangle(x[starIndex]-b, y[starIndex]+c, x[starIndex],   y[starIndex]-c, x[starIndex]+d, y[starIndex]+a);
    
    if (starIndex<(MAX-1))
    {
        starIndex++;
    }
    else
    {
        starIndex=0;
    }
}
 
void drawStars()
{
  for (int i = 0; i < x.length; i++) {
    fill (col [i]);

    float a = starSize[i]*1;
    float b = starSize[i]*3;
    float c = starSize[i]*5;
    float d = starSize[i]*2;
       
    triangle(x[i]-c, y[i]-a, x[i]+a, y[i]-a, x[i]+b, y[i]+c);
    triangle(x[i]-b, y[i]+c, x[i]-a, y[i]-a, x[i]+c, y[i]-a);
    triangle(x[i]-b, y[i]+c, x[i],   y[i]-c, x[i]+d, y[i]+a);
  }
}

void growStars () {
  for (int i = 0; i < x.length; i++) {
    if (starSize[i] != 0) {
        starSize[i] += random(0.15,0.25);
        if (starSize[i] > random(15,25)) {
          starSize[i] = 0;
        }
    }
  }
}
 
void moveStars () {
  for (int i = 0; i < x.length; i++) {
    x[i] += random(0.5,2);
    if (x[i] > width) {
      starSize[i] = 0;
    }
    y[i] += random(1,3);
      if (y[i] > height ) {
        starSize[i] = 0;
      }
    }
}




