
PImage myjlight;
PImage mylight;
PImage mywall;
PFont myfont;
float brightness;
float textfade;
int cha;
float hover;
float distance;
boolean butstate = false;
int c=75;

void setup() {
  //load images
  myjlight=loadImage("jlight.png");
  mylight=loadImage("light.png");
  mywall=loadImage("wall.png");
  //load font
  myfont = loadFont("light.vlw");
  //set to dark
  brightness=0;
  textfade=0;
  size(300, 750);
  
}

void draw() {
  

  background(0);
 
  tint(255, 30);
  image(mywall, 0,0);
  ellipseMode(CENTER);
  fill(255);
  tint(255, 255);
 // ellipse(140, 120, 200, 100);



  if (butstate==true) {
    brightness++;
    textfade= textfade+.15;
    if (brightness>=255) {
      brightness=255;
      
    }
    if (textfade>=255) {
      textfade=255;
      
    }
  }
  else {
    brightness--;
    textfade= textfade-.25;
    if (brightness==0);
    {
      brightness=0;
      textfade=0;
    }
  }


//text
fill(255, 0);
  rect(0, 0, 300, 750);
  fill(255, textfade);
textFont(myfont, 32);
  text("insight", 75, 650);

  //display light beam
  tint(255, brightness);
  image(mylight, 0, 0);
  //display light charachter
  tint(#798AA0, c);
  image(myjlight, 0, 0);

  
  
  distance = dist(mouseX, mouseY, 140, 120);
  println(textfade);
  println(brightness);

if (distance < 100) {

    c= 150;
  }else{c=75;}


}

void mouseClicked() {

  if (distance < 100) {

    butstate=!butstate;
  }
}



