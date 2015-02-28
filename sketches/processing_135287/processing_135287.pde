
//Control 1 - Decisions
//Exercise #3
/*3. Add an else to the code from exercise 2 to change which code
 is run.*/


int y = 300;
int x = 0;
float t= 0;
void setup () {
  size (400, 400);
}

void draw () {
  ellipse(200, 200, 100, 200);

  line(200, 300, 200, y);
  y--;

  if (y< 100) {
    x=x+1;
    fill(x);
    ellipse(200, 200, 100, 200);
  }
  else {
    t = t+0.05;
    line(150,200, 150+t, 200);
  }
  
  

  if (y< 0 ) {
    y = 300;
  }

  if (x > 255) {
    x = 0;
  }
  println(y, x);
} 



