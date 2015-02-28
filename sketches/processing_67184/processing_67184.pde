
float [] ypositions = new float[50];
float yvelocity;

int startTime;
int currentTime;
int intervalTime;
int linenumber;
int linenumber2;

float[] xpositions = new float [30];
float xvelocity;

void setup() {
  size(500, 500);
  startTime= millis();
  intervalTime=80;
  linenumber = 0;
  linenumber2 =0;
  yvelocity=-3;
  xvelocity=-2.5;

  for (int i=0; i<50; i++) {
    ypositions[i] = height;
  }
  for (int k=0; k<30; k++) {
    xpositions[k] =width;
  }  
}

void draw() {

  currentTime=millis();  

  if (currentTime-startTime >= intervalTime) {
    if (linenumber < 50) {
      linenumber+=1;
  }

  if (linenumber >50) {
    linenumber = 0; 
  }
  
 //test 
    if (currentTime-startTime >= intervalTime) {
    if (linenumber2 < 30) {
      linenumber2+=1;
  }

  if (linenumber2 >30) {
    linenumber2 = 0; 
  }
  //test
  
  
    startTime = millis();
  }

  stroke(random(122-59), random(46), random(255));
  for (int i = 0; i < linenumber; i++) {
    ypositions[i]=ypositions[i] + yvelocity;
    line(0, ypositions[i], width, ypositions[i]);
  
    if (ypositions[i]<0) {
      ypositions[i]=height;
    }
  }
stroke(random(155), random(131), random(133-151));
  for (int k=0; k<linenumber2; k++) {
    xpositions[k]=xpositions[k] +xvelocity;
    line(xpositions[k],0, xpositions[k], height);
  
    if (xpositions[k]<0) {
      xpositions[k]=width;
    }
  }
}
}

