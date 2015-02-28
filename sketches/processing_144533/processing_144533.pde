
ArrayList clouds;
ArrayList viruses;
//Assigns randomColor to be a random color from colorList

void setup() {
  size(800, 800);
  background(255,255,203);
  frameRate(10);
  smooth();
  clouds = new ArrayList();
  viruses = new ArrayList();
}

void draw() {
  clouds.add(new Cloud());
  viruses.add(new Virus());
  
   // This is why I'm using ArrayList it adds and removes clouds from the array
  for (int i = 0; i < clouds.size(); i++){ 
    Cloud c = (Cloud) clouds.get(i);
      c .move();
      c .display();
  }
  
    for (int i = 0; i < viruses.size(); i++){ 
    Virus v = (Virus) viruses.get(i);
      v .vmove();
      v .vdisplay();
  }
  
  if (clouds.size() > 200){ // max amount of clouds
  clouds.remove(0); // replaces clouds once reach max
  }
  
  if (viruses.size() > 15){ // max amount of viruses
  viruses.remove(0); // replaces viruses once reach max
  }
  
}

class Cloud{
float ranOp = random(1,10);
color[] colorList = {color(0, 64, 86, ranOp), color(44, 133, 141,ranOp),
                     color(116, 206, 183, ranOp),color(201, 255, 213, ranOp)};
color randomColor = colorList[ (int) random(colorList.length)];
float w; // width
float h; // height
float x = width /2; // x position
float y = height /2; // y position
float ranOp; // random opacity
float c; // color
float ranSep; // random seperation
float ranRed;
float ranGre;
float ranBlu;
float ranGry;

  Cloud(){
  ranOp = random(1,10);
  ranRed = random(17,53);
  ranGre = random(128,151);
  ranBlu = random(17,128);
  c = color(ranRed,ranGre,ranBlu, ranOp);
  ranSep = random(30,50);
  }
  

void display(){
  //movement speeds
  //constrains the movement to the stage
  h = (int) constrain(x + random(-30, 30), 0, width);
  w = (int) constrain(y + random(-30, 30), 0, height);
  fill(randomColor);
  rectMode(CENTER);
  noStroke();
  for (int i = 0; i < ranSep; i = i+2){ // random cloud
  ellipse(random(-20,20)+x,random(-20,20)+y, i, i); // CLOUD
  
  x = h;
  y = w;
  }
  
} // Display Cloud


void move(){
  if (x>width-h || x<0+h || y>height-w || y<0+w) {
    h = width/2;
    w = height/2;
  }
}//move Cloud


}// class Cloud


class Virus{
float vw; // width
float vh; // height
float vx = mouseX; // x position
float vy = mouseY; // y position
float vranOp; // random opacity
float vc; // color
float vranSep; // random seperation


  Virus(){
  vc = color(255,255,203,20);
  vranSep = random(30,50);
  }
  

void vdisplay(){
  //movement speeds
  //constrains the movement to the stage
  vh = (int) constrain(vx + random(-20, 20), 0, width);
  vw = (int) constrain(vy + random(-20, 20), 0, height);
  fill(vc);
  rectMode(CENTER);
  noStroke();
  for (int i = 0; i < vranSep; i = i+2){ // random virus
  ellipse(random(-20,20)+vx,random(-20,20)+vy, i, i); // VIRUS
  
  vx = vh;
  vy = vw;
  }
  
    if(mousePressed == true){
   if(vx == vh && vy == vw){
    vx = mouseX;
    vy = mouseY;
   }else{
    vx = vh;
    vy = vw;
   } 
    }
  
  
} // Display Cloud


void vmove(){
  if (vx>width-vh || vx<0+vh || vy>height-vw || vy<0+vw) {
    vh = width/2;
    vw = height/2;
  }
}//move Cloud


}// class Cloud



