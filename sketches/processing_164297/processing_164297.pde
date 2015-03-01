
int X=0;
int a=600; //sketch size
float s=30; //length of line
float x, y; //start of line
int j = 10; //first "wipe"
int k = -250; //second "wipe"
int m= 0;
long timeToWait = 2000;// in miliseconds
long lastTime;

int numFrames = 3; // The number of frames
int frame = 0; // The first frame
PImage[] img = new PImage[numFrames];

void setup() {
  background(10);
  size(600,600);
  noStroke();
  frameRate(450); //350 is cool, 500 for javascript
 //pictures   
    img[0] = loadImage("bonnie.png");
     img[1] = loadImage("screen05.png");
     img[2] = loadImage("Tumblr_inline_nabj8eeqpz1sm63xe.png");

}
 
void draw() {
  X++;

//Switches out the pictures
frame++;
if (frame == numFrames) {
frame = 0;
}


image(img[frame], 0, 0);

 
    for (int i=0;i<=0.5*a;i++) {
      stroke(random(0,175));
      x = random(0,a);
      y = random(0,a);
      line(x,y,x+random(0,s),y);
  }
  stroke(100,100);
  line(0,j,a,j);
  j++;
  if (j>a) {
    j=0;
  }
  stroke(100,100);
  line(0,k,a,k);
  k++;
  if (k>a) {
    k=0;
  }
  {

//static
      m++;
  for(int i=0;i<300;i+=10){
  translate(width/2, height/2);


  }
  
image(img[0], 0, 0);
  if(m==100){
  filter(INVERT);
   m=0;
   
 image(img[2], 0, 0);
if(m==10){
filter(INVERT);
 m=0;

   }
    }
}
}



