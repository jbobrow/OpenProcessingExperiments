
//part of the code taken from http://www.openprocessing.org/visuals/?visualID=31186

PImage img;
PFont font;
float x, y;
float size = 40;


void setup() {
  size(1100,780);
  background(255);
  smooth();
  strokeWeight(0.235);
  img = loadImage ("17.jpg");
  font = loadFont("01.BASE-48.vlw");
  frameRate(100);
}

void draw () {
  image (img, 0,0);
  textFont(font,280);
  for(int i =0;i<1500;i+=30){
    for(int j=0;j<1500;j+=30){
      for(int k=100;k<1200;k+=150){
     
      stroke(i*.785,i*.545,i*.985,80);
      line(i,k,k,j);
      }
    }
  }
  x = x + 0.8; //moves type across screen
  
  if (x > width + size) {
    x = -size;     //loops
  } 
  
  translate(x, height/2-size/2); //moves it across screen horizontally
  noStroke ();
fill (255, 10); //very translucent 
for (int x = -20; x < width; x+=2) {
  textFont(font,56);
  text("c",random(x), height/70);
  text("h",random(x), height/10);
  text("o",random(x), height/4);
  text("o",random(x), height/4.5);
  text("s",random(x), height/3.5);
  text("e",random(x), height/3);
  text("e",random(x), height/100);

}
}

