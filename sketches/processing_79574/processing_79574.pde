
int unit;
int munit;
int count;
int mcount;
Module[] mods;
Module[] mmods;
int s;
int menu = 3;
int gamecount = 0;
int mainmenucount = 0;
private static final byte buttonNum = 3;
private static final Button[] mainmenu = new Button[buttonNum];
//Button[] optionsmenu;
//Button[] levels;
private static final byte buttonNumG = 1;
private static final Button[] game = new Button[buttonNumG];

void drawMenu(Button[] m){
  for (int i = 0; i < m.length; i++){
    m[i].draw();
  }
}

void setup() {
  s = millis();
  gamecount = 0;
  mainmenucount = 0;
  size(400,400);
  background(0);
    //pos x, pos y, size x, size y, to menu id, from menu id, image name 
  mainmenu[0] = new Button(width/2, (height/2)-40, 160, 40, 3, 1, "PlayButton.jpg");
  mainmenu[1] = new Button(width/2, height/2, 160, 40, 2, 1, "OptionsButton.jpg");
  mainmenu[2] = new Button(width/2, (height/2)+40, 160, 40, 999, 1, "ExitButton.jpg");
  game[0] = new Button(width-10, 10, 20, 20, 1, 3, "BackToMainMenu.jpg");
  unit = width/10;
  munit = unit/10;
  PFont font;
  font = createFont("Onyx",24);
  noStroke();
  
}

void draw(){
  if (menu == 1){
    if (mainmenucount == 0){
       int mwideCount = width / munit;
       int mhighCount = height / munit;
       mcount = mwideCount * mhighCount;
       mmods = new Module[mcount];
       int mindex = 0;
        for (int y=0; y < mhighCount; y++){
          for( int x = 0; x < mwideCount; x++){
              mmods[mindex++] = new Module(x*munit, y*munit, munit/2, munit/2, random(0.5, 1.5), unit);
            }
          }
              mainmenucount++;
       }

      fill(0, 10);
      rect(0,0,width, height);
      for(int i=0; i < count; i++){
        mods[i].update();
        mods[i].draw();
      }
    drawMenu(mainmenu);
  } else if (menu == 2) {
    background(0);
    menu = 1;
  } else if (menu == 3) {
    if (gamecount == 0){
      int wideCount = width / unit;
  int highCount = height / unit;
  count = wideCount * highCount;
  mods = new Module[count];
  int index = 0;
  for (int y=0; y < highCount; y++){
    for( int x = 0; x < wideCount; x++){
      mods[index++] = new Module(x*unit, y*unit, unit/2, unit/2, random(0.5, 1.5), unit);
        }
      }
    }
  gamecount++; 
  float maxdist = 0;
  float cDistance;
  noStroke();
  fill(0, 25);
  rect(0,0,width, height);
  fill(0);
  rect(0, 0, 80, 40);
  for(int i=0; i < count; i++){
    mods[i].update();
    mods[i].draw();
          cDistance = sqrt((((width/2)-mods[i].xOffset)*((width/2)-mods[i].xOffset))+(((height/2)-mods[i].yOffset)*((height/2)-mods[i].yOffset)));
      if( cDistance > maxdist){
        maxdist = cDistance; 
      }
    }
  stroke(255);
  noFill();
  ellipse(width/2, height/2, 100, 100);
  ellipse(width/2, height/2, 2*maxdist, 2*maxdist);
  if(maxdist < 75){
    noLoop();
    background(0);
    text("You Won! Your time was " + (millis()-s-1000)/1000 + " seconds!", width/2-textWidth("You Won! Your time was " + (millis()-s-1000)/1000 + " seconds!")/2, height/2);
  }
  text((millis()-s), 10, 15);
  text(maxdist, 10, 35);
  text("Click to restart.", width/2-(width*.05), height-20);
  drawMenu(game);
  } else if (menu == 999) {
    exit();
  }
  if (menu == 0){
    background(0);
    PImage gstudio = loadImage("GStudio.jpg");
    image(gstudio, width/2 - 50, height/2 - 50);
    if (millis() > s + 3000){ 
    mainmenucount = 0;
    menu = 1;
    }
  }
} 

class Button {
  int px;
  int py;
  int sx;
  int sy;
  int ToMenu;
  int InMenu;
  String sprite;
  PImage img;
  PImage img2;
  //Constructor!
  Button(int tpx, int tpy, int tsx, int tsy, int tToMenu, int tInMenu, String sprite){
    img = loadImage(sprite);
    img2 = loadImage("o"+sprite);
    px = tpx;
    py = tpy;
    sx = tsx;
    sy = tsy;
    ToMenu = tToMenu;
    InMenu = tInMenu;
  }
  void draw(){
      if (mouseX > px-(sx/2) && mouseX < px+(sx/2)){
          if (mouseY > py-(sy/2) && mouseY < py+(sy/2)){
            image(img2, px-(sx/2), py-(sy/2));
          } else { image(img, px-(sx/2), py-(sy/2));
        }
      } else { image(img, px-(sx/2), py-(sy/2));
    }
  }
  void mouseclick(){
    if (mouseX > px-(sx/2) && mouseX < px+(sx/2)){
      if (mouseY > py-(sy/2) && mouseY < py+(sy/2)){
        menu = ToMenu;
      } 
    } 
  }
  //End Class
}

void mousePressed(){
  if (menu==1){
    for (int i = 0; i < 3; i++){
      mainmenu[i].mouseclick();
    }
  } else if (menu==3){
    game[0].mouseclick();
      setup();
      loop();
  }
}

class Module {
  float xOffset;
  float yOffset;
  float x, y;
  int unit;
  float xDirection = 1;
  float yDirection = 1;
  float speed;
  int r = 255;
  int g = 255/2;
  int b = 0;
  int rd = 1;
  int gd = 1;
  int bd = 1;
  
  //Constructor
  Module(float xOffsetTemp, float yOffsetTemp, int xTemp, int yTemp, float speedTemp, int tempUnit){
    xOffset = xOffsetTemp;
    yOffset = yOffsetTemp;
    x = xTemp;
    y = yTemp;
    speed = speedTemp;
    unit = tempUnit;
  }
  
  // Custom method for updating the varibales
  void update() {
    int f;
    float distance = sqrt((((mouseX-25)-xOffset)*((mouseX-25)-xOffset))+(((mouseY-25)-yOffset)*((mouseY-25)-yOffset))); //distance from mouse\
    if (distance < 150*speed){
      f = -2;
    } else {
      f = 1;
    }
      xDirection = sin(((mouseX-25)-xOffset)/distance);
      yDirection = sin(((mouseY-25)-yOffset)/distance);
      xOffset = xOffset + (speed * xDirection * f);
      yOffset = yOffset + (speed * yDirection* f);
  }
  
  // Custom method for drawing dots
  void draw() {
    noStroke();
    if (r == 255 || r == 50){
    rd *= -1;
    }
    if (g == 255 || g == 50){
    gd *= -1;
    }
    if (b == 255 || b == 50){
    bd *= -1;
    }
    r = r + rd;
    g = g + gd;
    b = b + bd;
    fill(r, g, b);
    ellipse(xOffset + x, yOffset + y, 6, 6);
    fill(g, b, r);
  }
}


