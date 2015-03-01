
float x = 0;
float y = 0;
void setup() {
  size(500, 500);
  strokeWeight(5);
}

void draw() {
  background(0);
  if (keyPressed == true) {
    if ((key >= 48) && (key <= 57)) {
      stroke(x/1.1,150,x/1.1,120);
      x = map(key, 48, 57, 0, 500);
      y++;
    }
  } else { 
    y-=x/500;
    x+=x/250;
  }
  line(x,y+150,x,500);
  line(x+20,y+112,x+20,500);
  line(x+25,y+120,x+25,500);
  line(x+35,y+110,x+35,500);
}


