
// doug's hello class, as minimal as possible infact it gets so small it
// just up and goes poof, an unfortunate side effect of minimal program creation
// that continues to baffle scientists.

//variables
int x=1;
int poof=0;

PImage[] p = new PImage[5];

void setup() {
  size(200, 200);
  
  background(255);
  fill(255);
  noStroke();
  smooth();
  
  for(int i=0;i<5;i++)
    p[i]=loadImage("poof"+(i+1)+".jpg");
  
}

void draw() {
  background(51,51,51);  
  if(x>0) {
    int time=(int)(millis()%11000.0/10.0); // use millis to set rate
    x=500-time;
    ellipse(100,100,x,x);
  }
  else {
    if(poof<5) {
        image(p[poof],60,60,80,80);
        delay(25);
        poof++;
    }   
  }  

}

