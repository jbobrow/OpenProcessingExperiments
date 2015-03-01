
// With this sketch I want to keep my idea of first assignment. This time I want to focus on projections. In the begining I wanted to
// make few than 10 projetion, but I felt it better with hunderdth of projetion. I like it better.
// furthermore I added lava chanels running down the vulcano cone

// I you feel like, you can change the number of projections with this constant below, namely numberOfProjections
// and run again
int numberOfProjections = 200;
int coneHighest = 400;
color[] paletteProjections = {#3B000F, #5C1802, #C97204, #FFC907, #FFFF00};


void setup() {
  size(800, 600);
  noStroke();
  //background
  background(#253263);
  fill(#331134);
  rect(0,450,800,150);
  //noLoop();
}

void draw() {
  // drawing vulcano cone
  //drawing 10 projections
    //background
    background(#253263);
    fill(#331134);
    rect(0,450,800,150);
  int imax = numberOfProjections;
  for(int i=0; i < imax; i++) {

    // draw cone when half of projections are drawn then there is a illusion it is in the middle
    if(i == int(imax/2)){
      noStroke();
      fill(#000000);
      beginShape();
      vertex(0,600);
      vertex(350-40,coneHighest);
      vertex(350+40,coneHighest);
      vertex(800,600);
      endShape(CLOSE);
    }
    // start point
    int x0;
    int x = 350 + int(random(-40.0,40.0));
    int y0;
    int y = coneHighest;
    // starting radius
    int r0 = int(random(6,22));
    int r = r0;
    // properties of the curve
    //float xStep = random((i-imax/2)/(imax/5)-0.5,(i-imax/2)/(imax/5)+0.5)*10;
    float xStep = random(-20.0,22.0);
    float yStep = -random(10.0,30.0);
    float yHeight = random(0,2.0);
    // draw projection
    for(int n = 0; n <= 16; n++) {
      x0 = x; // keep last position
      y0 = y;
      x += xStep; // drawing a parabol
      y += yStep + yHeight*n;
      r = int(r0/pow(1.1, n + 1)); // thickness decreasing
      stroke(paletteProjections[min(int(n/3),4)]);
      strokeWeight(r+1);
      line(x0, y0, x, y);
    } // end draw projection
  } // end draw 10 projection
 
  // lava chanels, 4 segments going down
  for(int i = 0; i < 50; i++){
     // start point
    int x0;
    int x = 350 + int(random(-30.0,30.0));
    int y0;
    int y = coneHighest;
    // thickness
    float w0;
    float w = random(20.0);
    // drawing a chanel
    for(int n = 0; n < 4; n++){
      // upper side
      x0 = x; y0 = y;
      // lower side
      x += random(-80, 80); y += random( 50) + 30 - n*5;
      // w0 is width of upper side, w is with of lower side (decreasing)
      w0 = w; w = w * random(0.5, 0.8);
      // color is getting dimmer
      noStroke();
      fill(paletteProjections[4-n]);
      // drawing a quadangle
      quad(x0-w0, y0, x0+w0, y0, x+w, y, x-w, y);
    }  
    // drawing last segment of the chanel, same process than the other ones
    // except that is a triangle
    x0 = x; y0 = y;
    x += random(-80, 80); y += random( 30) + 30;
    w0 = w; w = 0;
    noStroke();
    fill(paletteProjections[0]);
    //quad(x0-w0, y0, x0+w0, y0, x+w, y, x-w, y);
    triangle(x0-w0, y0, x0+w0, y0, x, y);
  }
}



