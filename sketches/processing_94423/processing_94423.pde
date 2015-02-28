
ArrayList <Float> ylist = new ArrayList<Float>();
int scrollx = 200;
float additive = 200;
float wta;
int x = 200; 
float y = 200;
float xvel, yvel = 0, ybase;
void setup() {
  size(400, 400);
  strokeWeight(1);
  stroke(255);
  ylist.add(float(200));
      for(int j = 0; j < width/30+1; j++) {
      wta=random(-1, 1);
      for(int i = 0; i < 30; i++) {
        additive+=wta;
        ylist.add(additive);
      }
    }
}
void draw() {
  stroke(255);
  x+=xvel;
  ybase = ylist.get(int(x));
  if(y >= ybase) {
    yvel=0;
    y=ybase;
  }
  else {
    yvel+=0.4;
  }
  if(keyPressed && key == ' ' && y>=ybase) {
    yvel = -7;
  }
  if(x>width-1 && xvel > 0) {
    x-=xvel;
  }
  if(x<1 && xvel < 0) {
    x-=xvel;
  }
  background(0);
  ellipse(x, y-10, 20, 20);
    beginShape();
    vertex(0, 400);
  for(int i = 0; i < width; i++) {
    //point(i, ylist.get(i));
    vertex(i, ylist.get(i));
  }
  vertex(400, 400);
  endShape();
  if(keyPressed) {
      if(key == 'd') {
      xvel = 2;
      }
    if(key == 'a') {
    xvel = -2;
    }
    }
    else {
      xvel = 0;
    }
    y+=yvel;
    stroke(100);
    line(x, 0, x, 400);
    line(0, ylist.get(x), 400, ylist.get(x));
  }
