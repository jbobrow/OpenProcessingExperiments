
// some play with circles and colors
// LEFT click: add circles, RIGHT: click remove circles, mouse movement: hue & saturation, 'space': brightness, 'c': changing the background color, 'v': reset, 'b': off/on background fluctuation, m/n:strokeweight, 's' screenshot

//global variables
float r=40;
float z=r;
float num=0;
int time=0;
float bri=60; 
boolean briState = true;
int hb;
int sb;
int bb;
color bg;
int screenNum = 1;
boolean backState= true;
int speed;
int weight=2;

void setup() {
  size(720, 720);
  colorMode(HSB, width, height, 100);
  strokeWeight(2);
  hb=int(random(width));
  sb=int(random(height-200));
  bb=int(random(60));
  bg=color(hb,sb,bb);
}

void draw() {
  noFill();
  strokeWeight(weight);
  //background fluctuation
  if ( millis() > time && backState==true) {
    time = millis() + 50;
    hb=hb+int(random(-10,10));
    sb=sb+int(random(-10,10));
    bb=bb+int(random(-2,2));
    bg=color(hb,sb,bb);
    //println(hb+" "+sb+" "+bb);
  }
  background(bg);
  
  speed=round(map(num,0,40,4,1));
  if (speed<1){speed=1;} 
  if (mousePressed == true && (mouseButton==LEFT) && frameCount % speed == 0) {
    num ++;
  } else if (mousePressed == true && (mouseButton==RIGHT)&& num>0 && frameCount % speed == 0) {
    num--;
  }
  //println(num + " " + speed);
  
  
  //changing saturation
  if (bri>85 || bri<1) {briState = !briState;}    
  if (keyPressed == true && (key==' ')) {
    if (briState==true) {bri++;}
    if (briState==false) {bri--;}
    //println(briState+" " +bri);
  }

  
  //draw a set of circles
  z=r;
  while (z<height/2) {
    //draw one line of circles
    for (float i=0; i<2*3.14; i+=2*PI/num) {
      stroke(mouseX+z, mouseY, bri);
      if (num != 0){
      ellipse(width/2+z*cos(i), height/2+z*sin(i), 80, 80);
      } else {ellipse(width/2,height/2,2*r,2*r);}
    }
    z+=r;
  }
}

void keyPressed() {
  if (key=='s' || key=='S') saveFrame("screenshot"+screenNum+".png");
  screenNum++;

  switch(key){
      case 'n':
        weight++;
      break;
      case 'm':
        if (weight>0){
        weight--;
        }
      break;
      case 'c' :
        hb=int(random(width));
        sb=int(random(height));
        bb=int(random(15, 90));
        bg=color(hb,sb,bb);
      break;
      case 'v' :
        num=0;
        weight=0;
      case 'b' :
        backState = !backState;
      break;
  }  
}

