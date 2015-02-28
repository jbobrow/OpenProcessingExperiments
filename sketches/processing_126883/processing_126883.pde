
int second = 0;
boolean cols = false;
color c1 = color(102, 204, 0);
int count = 0;
int pos = 250;
boolean dir = false;
int speed = 3;

void setup()
{
  size(500, 500);
  background(255);
}

void draw()
{
    if (dir) {
      pos = pos + speed;
    }
    else {
      pos = pos - speed;
    }
    
    if (pos > 450 || pos < 50) {
      dir = !dir;
      count = count + 1;
    }

    if (cols) {
      c1 = color(102, 204, 0);
    }
    
    if (!cols) {
      c1 = color(255, 0, 0);
    }
    
    if (dir) {
      background(255);
      stroke(0);
      fill(c1);
      rect( pos-50, 250-65, 100, 130 );
      fill(255, 102, 102);
      rect( pos-10, 250+10, 60, 40);
      fill(255, 51, 51);
      rect( pos+5, 250+40, 20, 10);
      fill(255);
      rect( pos, 250-35, 25, 40);
      fill(c1);
      ellipse( pos-50, 250+20, 30, 30);
    }
    else {
      background(255);
      stroke(0);
      fill(c1);
      rect(pos-50, 250-65, 100, 130);
      fill(255, 102, 102); 
      rect( pos-50, 250+10, 60, 40);
      fill(255, 51, 51);
      rect( pos-25, 250+40, 20, 10);
      fill(255);
      rect( pos-25, 250-35, 25, 40);
      fill(c1);
      ellipse( pos+50, 250+20, 30, 30);
    }
    
    if (count > 9) {
      count = 0;
      cols = !cols;
    }

}
