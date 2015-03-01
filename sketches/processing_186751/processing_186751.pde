
PFont fontHeader;
//PFont fontBody;
Ball[] ball;//[] makes an array
int id;


void setup() {
  size(800, 800);
  fontHeader = loadFont("SourceSansPro-Bold-48.vlw");
  //fontBody = loadFont("SourceSansPro-ExtraLight-48.vlw");
  ball = new Ball[100];
  for (int i=0; i < ball.length; i++) {
    ball[i] = new Ball(random(1000), random(1000), i);
  }
}

void draw() {
  background(0);


  for (int i=0; i < ball.length; i++) {
    ball[i].display();
    ball[i].collision();
  }
  textFont(fontHeader, 32);
  textSize(64);
  //text("Rachel Rosenson.", 20, 80); 
  // textFont(fontBody, 32);
  // text("Designer,", 20, 80); 
  // text("Designer,", 20, 200); 
  // text("Researcher,", 20, 280); 
  //text("Coder,", 20, 360);
  //text("Designer,", 20, 440);
   // text("Design. Hack. Build Forts.", 25, 400);
  text("Design. Hack. Build Forts.", 25, 400);
 // text("Hacker,", 20, 600);
  //text("& Fort Builder.", 20, 680);
}



class Ball {
  float  x, y, targetX, targetY, easing;
  float id;
  Ball (float _x, float _y, int _id) {
    x = _x;
    y = _y;
    id = _id;
    targetX= width/2;
    targetY= height/2;
    easing = .01;
  }


  void display() {
    float diffX = targetX - x;
    float diffY = targetY - y;
    x +=diffX*easing;
    y += diffY*easing;

    fill (255);
    ellipse(x, y, 5, 5);

    if (y>350 && y<450 && x>350 && x<450) {
      easing*=-1;
      x +=diffX*easing;
      y += diffY*easing;
    } else if (y>750 && y<800 || y>0 && y<50 || x>750 && x<800 ||x>0 && x<50) {
      // else if (y>700 && y<750 || y>0 && y<50 || x>750 && x<800 ||x>0 && x<50) {
      easing = .01;

      //ellipse(x, y, 5, 5);
    } else if (y>750 && y<800 || y>0 && y<50 || x>750 && x<800 || x>0 && x<50) {
      //else if (y>350 && y<450 || x>350 && x<450) {
      easing = .01;
      //x +=diffX*easing;
      //y += diffY*easing;
      // ellipse(x, y, 5, 5);
    }
  }

  void collision() {
    stroke(255);
    for (int i=0; i < ball.length; i++) {
      if (id !=i) {
        if (dist(x, y, ball[i].x, ball[i].y)<50) {
          line(ball[i].x, ball[i].y, x, y); //intersecting code
        }
      }
    }
  }
}



