
int xDim = 9;
int yDim = 4;

Clock[] c = new Clock[xDim*yDim];

void setup() {
    strokeWeight(0.5);
  println(xDim*yDim);
  size(xDim*80, yDim*80);

  int x=40, y=40;

  for (int i=0;i<c.length;i++) {
    println("i ["+i+"]    c.length ["+c.length+"]");

    c[i] = new Clock(x, y); 
    c[i].setTimeImediate( int( random(12) ), int(random(60) ) ); 

    if ( x < xDim*70) {
      x+=80;
    } 
    else {
      x=40;
      y+=80;
    }
  }
  smooth();
}

void draw() {
  background(255);
  for (int i=0;i<c.length;i++) {
    c[i].render();
  }
}

class Clock {
  boolean move=true;
  int x=0;
  int y=0;
  float minPos=0;
  float hourPos=0;

  float minStop=90;
  float hourStop=70;

  public Clock( int x, int y) {
    this.x=x;
    this.y=y;
  }

  public void setTimeImediate(int h, int m) {
    minPos = map(m, 0, 60, 0, 360);
    hourPos = map(h, 0, 60, 0, 360);
  }
  public void setTime(int hours, int minutes) {
    minPos=0;
    hourPos=0;

    minutes += hours*60;
    minStop   = map(minutes, 0, 60, 0, 360 );

    println( "mins = ["+minStop+"]    hours = ["+hourStop+"]");
  }



  public void render() {
    pushMatrix();
    translate(x, y);
    rotate( radians(-90) );

    noFill();
    stroke(0);
    ellipse(0, 0, 80, 80);

    pushMatrix();

    if (dist( mouseX, mouseY, this.x, this.y) < 50 && mousePressed) {
      this.move = false;
    }
    

    if ( dist( mouseX, mouseY, this.x, this.y) > 50) {


      if (keyPressed) {
        this.move  = true;
        if (this.move) {

          minPos-=10/2;
          hourPos-=0.825/2;
        }
      }
      else {
        if (this.move) {
          minPos+=10/2;
          hourPos+=0.825/2;
        }
      }
    }
    else {
      stroke(255, 0, 0);
    }

    rotate( radians( minPos ) );

    line(0, 0, 38, 0);
    popMatrix();

    pushMatrix();
    rotate( radians( hourPos ) );

    line(0, 0, 18, 0);
    popMatrix();

    popMatrix();
  }
}

