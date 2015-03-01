
//Marina
import java.util.Calendar;

hexMar [] hexMars = new hexMar[100];


void setup () {
  size (800, 800);
  for (int i = 0; i < hexMars.length; i++)
  {
    hexMars[i] = new hexMar();
  }
}

void draw () {
  background(255);

  for (int i = 0; i < hexMars.length; i++)
  {
    hexMars[i].display();
    hexMars[i].transparency();
    hexMars[i].move();
    hexMars[i].checkPos();
    hexMars[i].mouseRadius();

  }
}

void keyPressed() {
  if (key == 's' || key == 'S') saveFrame(timestamp()+".png");
}
String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}

//Marina
class hexMar {
  float alfa = 200;
  float radius;
  float rotateFactor = 0;
  PVector pos;
  PVector speed;


  hexMar () {
    radius = width/4;
    pos = new PVector (random(width), random(height));
    speed =   new PVector (0.2, 0.3);
  }
  void display () {

    color [] colorMarine = {
      color(119, 102, 136, alfa), 
      color( 68, 85, 119, alfa), 
      color(34, 51, 68, alfa), 
      color(102, 136, 170, alfa), 
      color(204, 221, 238, alfa), 
      color(153, 187, 204, alfa)
    };
    noStroke();

    float angleStep = 360/(colorMarine.length);

    beginShape(TRIANGLE_FAN);
    vertex(pos.x, pos.y);



    for (float angle = 0; angle <=360; angle+= angleStep) {
      rotate(rotateFactor);
      float vx = width/1.5 + cos(radians(angle))*radius;
      float vy = height/1.5 + sin(radians(angle))*radius;
      vertex(vx, vy);

      int colorStepper = constrain(int(angle/angleStep), 0, 5);
      fill(colorMarine[colorStepper]);
      int colorStepper2 = colorStepper + 1;
      stroke(colorMarine[colorStepper2%5]);
    } 
    ;
    endShape();
  }
  void transparency() {

    float sizeMouse =(width+height)/2 - (mouseX + mouseY) /2;
    alfa = map(sizeMouse, 0, width, 0, 200);
  }
  void move () {
    pos.add(speed);
  }
  void checkPos  () {
    if (pos.x > width || pos.y > height)
    {
      speed.mult(-1);
    }
     if (pos.x < 0 || pos.y < 0)
    {
      speed.mult(-1);
    }
  }
  void mouseRadius  () {
    radius = (width+height)/2 -(mouseX + mouseY)/2 ;
  }
  void rotateL  () {
    rotateFactor = map(mouseX,0,width,0,TWO_PI) ;
  }
}



