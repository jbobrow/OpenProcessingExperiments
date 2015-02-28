
//variables
float x;
float y;

//int r; // red 0-255
//int g; // greed 0-255
//int b; // blue 0-255

boolean colorchange; //true or false
color yellow = color (0, 200, 200);
color pink= color (250, 0, 250);
float lerp = 0.0;

PImage img;

void setup () {
  size (600, 600);
  background(x);
  //r=255;
  //g=250;
  //b=247;
  colorchange= false;
  
   img = loadImage("SCARY-DUMBO.jpg");
  // Load image from a web server
  image(img, 0,0, 600,600);
}

void draw () {
  stroke(255,255,255,100);
  x= mouseX;
  y= mouseY;
  //fill (r, g, b);

  if (mousePressed) {
    color temp = lerpColor (yellow, pink, lerp);
    fill(temp);
    ellipse(x, y, x/4,x/4);
    ellipse(y/2, x/2, y/8, y/8);
    if (!colorchange) { //colorchange==false
      lerp +=0.01;
      //r--;
      //g--;
      //b--; //if -1 everytime (b=b-1; b-=1;)
    }
    else if (colorchange) {//color==true
      lerp -=0.01;
      //r++;
      //g++;
      //b++;// at some point b will equal to 255
    }
    if (lerp <=0.001 || lerp >= 0.999) {
      //if (b <=0|| b>=255){
      colorchange = !colorchange; //flipswitch. if colorchange used to be true it is now
    }
  }
}



