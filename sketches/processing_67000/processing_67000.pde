
int e = 50;
int t = 140;
float r,g;
float fo = 0.0;
String letters = "Victory";
bouncingBall b1, b2, b3;

void setup() {
textFont(loadFont("Algerian-48.vlw"));
textAlign(CENTER);
fill(33);  
background(255);
size(400,400);
noStroke(); 
smooth();
 frameRate(38);

  b1 = new bouncingBall(23, width/2, height/4);

    b2 = new bouncingBall(68, width/2, height * 0.75);

    b3 = new bouncingBall(90, width/3, height/4);


}
int a = 0;
int b = 100;
int c = 0;
void draw() {
    fill (0, 34);
    rect(0, 0, width, height);
    b1.display(); // A
    b2.display(); // B
    b3.display(); // C
    bounce(b1, b2, 'A', 'B');
    bounce(b2, b3, 'B', 'C');
    bounce(b1, b3, 'A', 'C');
  text(letters,e+t , 80);
  println(e+t);
 ellipseMode(CENTER);
stroke(b,a,a);
noFill();
ellipse(width/2,height/2,c,c);
 a+=10;
  b-=10;
  c+=10;
  if (a>100){ a=0;
  }
if (b<0){b=0;
  }
  if (c>400){
    background(255);
    c=0;
  }
}
 
void bounce(bouncingBall pointA, bouncingBall pointB, char pointAname, char pointBname) {
    if(dist(pointA.x, pointA.y, pointB.x, pointB.y) < 30) {

     println(pointAname + " bounced with " + pointBname); // debug

        pointA.xMagn *= -1;

        pointB.xMagn *= -1;

        pointA.yMagn *= -1;

        pointB.yMagn *= -1;

        pointA.a = random(180);

        pointB.a = random(180);
    }
}
class bouncingBall {
    float x, y; 
    float a; // Angle
    int xMagn = 3, yMagn = 3; 
    int ialpha = 156;
 int colourCycle = 10; 
    // random colour

    int[] fillrand = randCol();
    int r = fillrand[0], g = fillrand[1], b = fillrand[2];
    int[] bgrand = randCol();
    int bgr = bgrand[0], bgg = bgrand[1], bgb = bgrand[2];
    bouncingBall(float angle, float xStartingPoint, float yStartingPoint) {

     a = angle;
       x = xStartingPoint;
        y = yStartingPoint;

    }
    void display() {
        fill(bgr, bgg, bgb);

        ellipse(x, y, 58, 58);

fill(fadeColour());
 ellipse(x, y, 38, 38);

        x += cos(radians(a)) * 8;

        y += sin(radians(a)) * 8;

        a++;

        if (x > width) {
          x = 0;

            a = a + random(46);
        }
        if (x < 0) {
            x = width;

            a = a - random(46);

        }
        if (y > height) {

            y = 0;

            a = a - random(46);
        }
        if (y < 0) {


            y = height;

            a = a - random(46);


        } 

        x += xMagn;

        y += yMagn;

    }
    color fadeColour() {
   ialpha -= colourCycle;
        if (ialpha >= 255 || ialpha <= 0) {
            r = bgr; g = bgg; b = bgb;
            fillrand = randCol();
            bgr = fillrand[0];
            bgg = fillrand[1];
            bgb = fillrand[2];
            ialpha = 255;
        }
        return color(r, g, b, ialpha);

    }
    // Set a random colour
    int[] randCol() {
        int temp[] = new int[3];
        temp[0] = floor(random(60, 220));  
        temp[1] = floor(random(60, 220)); 
        temp[2] = floor(random(60, 220)); 
  return temp;
    }
    }

 





