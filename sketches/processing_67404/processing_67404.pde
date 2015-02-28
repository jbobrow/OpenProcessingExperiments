
int xMax = 101;
int yMax = 10;
boolean primeHighlight = false;
boolean outline = true;
boolean negative = true;
float cellSizeX, cellSizeY;

int[] brightness;
int[] theprimes;
int maximum;

void setup() {
  size(600, 650);
  background(-1);
  cellSizeX = width/(float)(xMax + 2);
  cellSizeY = (height-50)/(float)(yMax + 2);  
  brightness = new int[xMax*yMax];
  maximum = 0;
  for (int a = 0; a<xMax; a++)
    for (int b = 0; b<yMax; b++) {
      PVector bright = extended_gcd(new PVector(a, b));
      brightness[b*xMax + a] = (int)abs(bright.x - bright.y);
      maximum = max(maximum, brightness[b*xMax + a]);
   }

  colorMode(RGB, maximum);
  if(outline && negative)
    stroke(0);
  else if(outline && !negative)
    stroke(maximum/12);
  for (int a = 0; a<xMax; a++)
    for (int b = 0; b<yMax; b++) {
      color thefill = (negative)? maximum-brightness[b*xMax+a]:brightness[b*xMax+a];
      fill(thefill);
      rect(cellSizeX*(a+1), cellSizeY*(b+1), cellSizeX, cellSizeY);
    }
  noLoop();
  theprimes = new int[max(xMax, yMax)+1];//0 will be used as length-holder
  theprimes[0] = 1;
  theprimes[1] = 2;
}

void draw() {
  int a = (int)floor(mouseX/cellSizeX)-1;
  int b = (int)floor(mouseY/cellSizeY)-1;
  fill(-1);
  noStroke();
  rect(0, height-50, width, 50);
  fill(0);
  textSize(20);
  textAlign(CENTER);
  if (0<=b*xMax+a && (b*(xMax)+a)<brightness.length)
    text("a: " + a + ", b: " + b + " :: " + brightness[b*xMax + a], width/2, height-25);
  if (primeHighlight)
    highlightPrimes();
}
void highlightPrimes() {
  colorMode(HSB, 100);
  noStroke();
  fill(50, 60, 60, 70);
  for (int a=2; a<max(xMax,yMax); a++) {
    if (isPrime(a)) {
      rect(cellSizeX*(a+1), 0, cellSizeX, height);
      rect(0, cellSizeY*(a+1), width, cellSizeY);
    }
  }
}

boolean isPrime(int n) {
  boolean prime = true;
  for (int i=1; i<=theprimes[0]&′ i++) {
    prime = prime && (n%theprimes[i] != 0);
  }
  if (prime) {
    theprimes[theprimes[0]+1] = n;
    theprimes[0]++;
  }
  return prime;
}
PVector extended_gcd(PVector higher) {
  if (higher.y == 0)
    return new PVector(1, 0);
  else {
    int q = (int) floor(higher.x / higher.y);
    int r = (int) (higher.x - q*higher.y);
    PVector lower = extended_gcd(new PVector(higher.y, r));
    return(new PVector(lower.y, lower.x - q*lower.y));
  }
}
void mouseMoved() {
  redraw();
}
void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP)
      yMax = max(yMax-1, 1);
    else if (keyCode == DOWN)
      yMax++;
    else if (keyCode == LEFT)
      xMax = max(xMax-1, 1);
    else if (keyCode == RIGHT)
      xMax++;
  }
  else if (key == 'p') {
    primeHighlight = !primeHighlight;
  }
  else if(key == ' '){
     outline = !outline;
  }
  else if(key == 'n'){
    negative = !negative;
  }
  setup();
  redraw();
}
