
float x=100;
float y=200;
float body=70;
float tall=50;
float speed=3;
PImage img;
PImage img2;
int direction;

//--------------------------------------------
void setup() {
size(1300,800);
smooth();
noStroke();
img = loadImage("city.jpg");
img2 = loadImage("city-front.png");
}

//------------------------------------------------------
void draw(){
image(img,0,0);
  
   x+=speed;
  if (x>width+body) {
    x=-body;
  }
  
  ufo(x,y);
  
 ufo(x-180,y-10*random(2));
  ufo(x-280,y-10*random(2));
   ufo(x-200,y-10*random(2));
    ufo(x-380,y+10*random(2));
     ufo(x-80,y-10*random(2));
      ufo(x-250,y+10+random(6));
       ufo(x-180,y-60+random(3));
        ufo(x-180,y+20+random(10));
  
     if (mousePressed == true) {
       strokeWeight(20);
    stroke(195,255,0);
     line(x,y,mouseX,mouseY);
  }
 noStroke();
 
}

//-----------------------------------------------
void ufo(float x, float y) {
fill(50);
ellipse(x,y,body,tall);
fill(0);
ellipse(x,y,body-50,tall-1);
fill(255);
ellipse(x,y,body-50,tall-30);
}

