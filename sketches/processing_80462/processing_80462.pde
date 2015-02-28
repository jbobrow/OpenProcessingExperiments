
int x; //coordinates for x
int y; //coordinate for y
boolean maxormin = false; //boolean that determines if it's hit a max or min
void setup () {
  size (600, 600); //size of window
  x = width/2; //x starts out in the middle
  y = height/2; //y starts out in the middle
}

void draw () {
  
  background (0); //draws black background
  rect (x, y, 20, 20); //rect drivven on x and y ars
  
  if (y <= 200) { //if it reaches 200, you've hit the min value
    maxormin = true;
  }
  if (y >= 400) { //if it reaches 400, you'e hit the max value
    maxormin = false;
  }
  
  if (maxormin == true) { //if you've hit the min, increase your value
    y ++;
  }
  if (maxormin == false) { //if you've hit the max, decremet your value
    y --;
  }
  
}

