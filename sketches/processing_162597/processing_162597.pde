
int x = 190;
int y = 0;

int speed = 3;  


int state = 0;  

void setup() {
  size(200,200);
}

void draw() {
  background(255);


  noStroke(); //"360 noStroke!," my roommate shouted. I laughed
  fill(38,191,191); //for five minutes straight. God I love puns.
  rect(x,y,9,9); //The square has now taken the hue of lovely aqua

  if (state == 0) {
    x = x - speed;
   
    if (x < 0) {
      x = 0;
      state = 1;
    }
  } else if (state == 1) {
    y = y + speed;
    if (y > height) { //This took so long to figure out!
      y = height-10; //Even though it seemed relatively simple at first,
      state = 2; //Given all one had to do was change the direction.
    } //Turns out that's pretty hard.
  } else if (state == 2) {
    x = x + speed;
    if (x > width) {
      x = width-10;
      state = 3;
    }
  } else if (state == 3) {//Only during this assignment did
    y = y - speed; //I finally figure out how to properly
    if (y < 0) { //reverse the direction of the shape.
      y = 0;
      state=0;
    }
  }
}



