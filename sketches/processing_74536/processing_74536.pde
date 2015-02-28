
Obj o[] = new Obj[2000];


void setup() {

  size(800, 300);
  noStroke();
  smooth();
  for (int i=0;i<o.length;i++) {
    o[i]=new Obj();
  }
}


void draw() {
  background(0);

  for (int i=0;i<o.length;i++) {
    o[i].render();
  }
}

void keyPressed(){
    for (int i=0;i<o.length;i++) {
    o[i]=new Obj();
  }
}


class Obj {
  float xPos=200;
  float yPos=100;
  float m=0;
  float a=0;
  float d=0;
  boolean drawMe=true;
  public Obj() {

    xPos = random(width);
    yPos = random(height);

    m=random(2, 3);
    a=random(360);
    d=random(2, 7);
  }

  void render() {
    if (drawMe) {

      if(this.xPos > mouseX){
        fill(255);
        this.m=0;
      }else{
        fill(random(255));
        m=random(2, 3);
      }
      /*
      for (int i=0;i<o.length;i++) {
       
       if (this.xPos != o[i].xPos && this.yPos != o[i].yPos) {
       
       if (dist(this.xPos, this.yPos, o[i].xPos, o[i].yPos) < this.d) {
       //drawMe=false;
       this.m=0;
       //this.d =10;
       }
       }
       }    
       */


      if (xPos > width) {
        xPos=0;
      }
      if ( xPos < 0) {
        xPos=xPos-2;
      }
      if (yPos > height) {
        yPos=0;
      }
      if (yPos < 0)
      {
        yPos=height;
      }
      float xDiff = cos(radians(a));
      float yDiff = sin(radians(a+=(random(10)-5.2) ));


      // m+=0.1;
      xPos += (m* xDiff);
      yPos += (m* yDiff);


      ellipse(xPos, yPos, d, d);
      line(xPos, yPos, xPos+(xDiff*m), yPos+(yDiff*m));


      //    if(xPos < 0){  m*=(-1); }
    }
  }
}


