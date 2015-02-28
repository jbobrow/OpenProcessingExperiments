
int t, i, w=255;
int x;
int a[]=new int[w*w];
float col;


int[] positionsX = new int[100];
int[] positionsY = new int[100];

boolean paused = false;

void setup() {
  size(192, 1000);
  col=0;
  strokeWeight(0);
  background(255);

  noCursor();
}



void draw() {

  //  background(w);
  smooth();
  stroke(189, 43, 166);
  if (paused == false) {
    beginShape(20);
    col=col+1;
    for (x=0;x<t;x+=2) {
      if (col<1000) {
        stroke(col/2, col/3, col/5);
      }
      if (col>1000) {
        col=0;
      }

      vertex(w+cos((t-x)/255f)*a[x+1], a[x]);
    }
    if (a[t]>0) {
      t+=2;
    }
    endShape();

    a[t]=mouseY;
    a[t+1]=mouseX-455;

    positionsX = append(positionsX, mouseX);
    positionsY = append(positionsY, mouseY);
    for (int j=0; j < positionsX.length; j++) {
      int distance = int(dist(positionsX[j], positionsY[j], mouseX, mouseY));
      float r = random(0, 100);
      if (distance < 20 )  line(positionsX[j], positionsY[j], mouseX, mouseY);
    }
  }
}

void mouseClicked() {
 // if paused == true make it false
 if(paused) {
  paused = false;
   loop(); 
 }
 // otherwise make it true
 else {
  paused = true;
  noLoop();
  text("Click to animate me..", 5, 50);
 }
} 



