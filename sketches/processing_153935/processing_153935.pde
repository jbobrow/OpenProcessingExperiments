
void setup() {
  size(615, 615);
  rectMode(CORNERS);
  noStroke();
  //frameRate(1);  // set the frame rate to 1 draw() call per second
  randomSeed(day() + month() + year() + hour() + minute() + second() + millis());
  frameRate(10);
} //end of setup


void draw() {
  if (mousePressed) {
    
    background(210);
    
    float os = 1.0;     // The offset from the edge of the screen and random max distance from central point of square
    float sqR = 120.0;  // The width of the square from the centre
    float fRed = 0.5;   // The frequency of red squares on the grid
    
    for (int x=0; x<5; x++) {
      for (int y=0; y<5; y++) {
        if (random(1)<fRed) 
          fill(#993322, 64);
        else
          fill(#885555, 64);
        float rot = random(5)-2.5;
        translate(0, 0);
        rotate(radians(rot));
        float xP = x*sqR+os;
        float yP = y*sqR+os;
        float osX = xP + random(os*2)-os;
        float osY = yP + random(os*2)-os;
        rect( osX, osY, xP+sqR, yP+sqR);
        println("x=",x,", y=",y,", xP=",xP,", yP=",yP,", osX=",osX,", osY=",osY,", rot=",rot);
      }
    }
  }
} //end of draw 

