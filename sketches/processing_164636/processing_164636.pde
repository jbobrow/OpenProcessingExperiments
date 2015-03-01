
int lastsecond = 0;
float ms = 0;
float noiseVal;

void setup(){
  size(1000, 1000);
  background(0);
  frameRate(60);
  colorMode(HSB, 360, 255, 255);
}

void draw(){
  int s = second();
  strokeWeight(3);
  if(s != lastsecond){
    lastsecond = s;
    ms = 0;
  }
  int hoursecond = lastsecond + (60 * minute());
  float theda = radians((6 * (hoursecond)) + ms);
  int hours = (12 - ((24 - hour())%12))/12 + 1;
  for(int r = 3; r < 500; r = r + 3){
    noiseVal = noise(r * .01 / (1 + (6/12)), theda * 2 / (1 + (6/12)));
    stroke(200 + (2*(minute()/3.)), noiseVal * 255, r/1.5, 220 - (noiseVal * 220));
    point(width/2 + (r * cos(theda + (3 * PI/2))), height/2 + (r * sin(theda + (3 * PI/2))));
  }
  ms = ms + .1;
  if(ms > 6){
    ms = 0;
  }
  noStroke();
  fill(0, 5);
  arc(width/2, height/2, 1020, 1020, theda + (3 * PI/2), theda + (PI/12) + (3 * PI/2));
}


