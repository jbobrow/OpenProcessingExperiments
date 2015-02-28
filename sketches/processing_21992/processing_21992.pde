
//Jason Fitzgerald
//photofilter 
//"Trapped under ice"
//math and prog spring 2011
//Prof. Nick Lally

PImage img;


void setup() {
  size (600,400,JAVA2D);
  img = loadImage ("monkey.png");
  background(255);
  smooth();
 //////////////I took out void draw(); it was fun to watch it draw it.

  for(int i = 1; i < 10000; i ++) { //I finally used a for loop without looking in the book! DERP DERP!!
    int x = int(random(img.width));
    int y = int(random(img.height));
    int loc = x + y*img.width;


    float r = red(img.pixels[loc]);
    float b = blue(img.pixels[loc]);
    float g = green(img.pixels[loc]);
    //////////////rectangle style//////////////

    strokeWeight(2);
    stroke(b,g,r,random(25,100));
    fill(b,g,r,random(0,75));//switching RGB around for cooler colors
    rect(x,y,random(2,15), random(2,15));
    line(x,y,x,y);
    //////////// line styles////////////////



    strokeWeight(.25);
    stroke(g,g,b,random(10,50));//switching RGB around for cooler colors
    line(random(width),random(height),random(random(height)), random(width));
  }
}


