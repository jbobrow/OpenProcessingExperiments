
PImage bkg;                    //Background
PImage mouse;                  //Mouse image
PImage coffeeMouse;            //Image if clicked
PFont font;
float h = 0;

int countDown;                // counts down in milliseconds
int maxTime = 100;            // max time in counter

int rectPosX = 70;
int rectPosY = 100;
int textPosX = 70;
int textPosY = 200;

void setup() {
  size(800,600,P2D);
  bkg = loadImage("CoffeeBean.jpg");
  mouse = loadImage("Smiley.png");
  coffeeMouse = loadImage("coffee.png");
  font = loadFont("JazzText-48.vlw");
  countDown = millis();
  colorMode(HSB,100);
}

void draw() {
  int countUp = millis() - countDown;
  tint(h,57,84);
  image(bkg,0,0,800,600);
    if (countUp > maxTime)              // if counter exceeds 100
    {
      if (h > 100)                    // and if h goes over 100
      {
        h=0;                          // resets back, so it can loop
      } else {
        h++;                          // otherwise, keep rainbowing
      }
    }
   
     noStroke();
     fill(0,0,100);
     rect(rectPosX,rectPosY,700,130);
     fill(0);
     textSize(100);
     text("FREE COFFEE",textPosX,textPosY);
     
     fill(0,0,100);
     textSize(24);
     text("Monday, September 15th",475,400);
     text("In the SCA Courtyard",475,425);
     text("Plus Dave Franco",475,500);
     text("will be there",475,525);
     
     noTint();
     image(mouse,mouseX,mouseY,50,50);
       if(mousePressed)
       {
         image(coffeeMouse,mouseX,mouseY,100,100);
       }
}



