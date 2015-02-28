
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
        if((additive < 30 || additive > height-30) == false){
      wta=random(-1, 1);
        }
        else {
          if(additive < 75) {
            wta = 1;
          }
          if(additive > height-75) {
            wta = -1;
          }
        }
      for(int i = 0; i < 30; i++) {
        additive+=wta;
        ylist.add(additive);
      }
      }
}
void draw() {
  stroke(255);
  x+=xvel;
  ybase = ylist.get(int(200+x));
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
  if(x<1 && xvel < 0) {
    x-=xvel;
  }
  //this generates the terrain
  if(ylist.size() < x+401) {
        for(int j = 0; j < width/30+2; j++) {
        if((additive < 30 || additive > height-30) == false){
      wta=random(-1, 1);
        }
        else {
          if(additive < 50) {
            wta = 1;
          }
          if(additive > height-50) {
            wta = -1;
          }
        }
      for(int i = 0; i < 30; i++) {
        additive+=wta;
        ylist.add(additive);
      }
      }
  }
      //finished
  background(0);
  ellipse(200, y-10, 20, 20);
    beginShape();
    vertex(0, 400);
  for(int i = 0; i < width; i++) {
    //point(i, ylist.get(i));
    vertex(i, ylist.get(int(i+x)));
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
  }
