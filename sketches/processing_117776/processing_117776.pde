
import ddf.minim.*;

int numFrames = 12;
int numAlien = 2;
int frame = 0;
int alien = 0;
PImage[] images = new PImage[numFrames];
PImage[] aliens = new PImage[numFrames];
PImage astronaut, ship1, ship2, bg1, bg2, bgwin, bglose, heart, watergrass;
float ship = 200;
float subtractor;

Minim minim;
AudioSample eating;
AudioPlayer bgsound;


void setup() {
  size(600, 600);
  smooth();
  frameRate(12);
  page = 1;
  
  minim = new Minim(this);
  eating = minim.loadSample("eating.mp3");
  bgsound = minim.loadFile("bgm.mp3");
  bgsound.loop();
  
  images[0]  = loadImage("earth1.gif");
  images[1]  = loadImage("earth2.gif");
  images[2]  = loadImage("earth3.gif");
  images[3]  = loadImage("earth4.gif");
  images[4]  = loadImage("earth5.gif");
  images[5]  = loadImage("earth6.gif");
  images[6]  = loadImage("earth7.gif");
  images[7]  = loadImage("earth8.gif");
  images[8]  = loadImage("earth9.gif");
  images[9]  = loadImage("earth10.gif");
  images[10] = loadImage("earth11.gif");
  images[11] = loadImage("earth12.gif");
  
  aliens[0]  = loadImage("alien1.gif");
  aliens[1]  = loadImage("alien2.gif");
  
  bg1 = loadImage("bg1.gif");
  bg2 = loadImage("bg2.gif");
  bgwin = loadImage("bgwin.gif");
  bglose = loadImage("bglose.gif");
  ship1 = loadImage("ship1.gif");
  ship2 = loadImage("ship2.gif");
  heart = loadImage("heart.gif");
  astronaut = loadImage("astronaut.gif");

}
 
int x1 = int(random(50,550));
int y1 = 0;
int x = int(random(50,550));
int y = 0;
int number = 5;
int count = 0;
int level = 1;
int bouns = 0;
int page;


void draw() {
  //Page1
    if (page == 1) {
    background(255);
    image(bg1, 0, 0);
    stroke(50);
    strokeWeight(2);
    
  frame = (frame+1) % numFrames;
  image(images[frame], 0,0);
  
  fill(255);
  textSize(20);
  text("Attack 30 Aliens",230,210);
  text("to win the chance of",210,240);
  textSize(30);
  text("Space Tour!",230,270);
  textSize(15);
  text("( Score > 3000 )",300,290);
    
    if(mouseX > 200 && mouseX < 400 && mouseY > 470 && mouseY < 520) {
      fill(247, 216, 70);
    }
    else {
      fill(2, 98, 159);
    }
    rect(200, 470, 200, 50);
    fill(255);
    textSize(25);
    text("START", 265, 498);
    textSize(15);
    text("Save the Earth",250,512);
  }

  //page2
  else if (page == 2) {
  background(0);
  image(bg2, 0, 0);
  
  // Create Player
  player();
  
  strokeWeight(1);
  stroke(255, 255, 0);
  line(0, 480, width, 480);  
  
    //Shooting light
    if (mousePressed) {
   stroke(0, 255, 255);
    strokeWeight(2);
    line(mouseX,450,mouseX,mouseY);
    }
    
  //Score
  fill(255);
  textSize(30);
  text("Score:"+ count*100,50,70);
 
  //remain life
  remainlife();

  //Alien
  alien = (alien+1) % numAlien;
  image(aliens[alien], x,y);
  //image(rubbish, x, y); 
  x+=random(-50,50);
  y+=random(80);
  
  //floating spaceship  
  ship = ship - 2; 
  if (ship < 0) { 
  ship = 600; 
  } 
  image(ship1, ship+200, 250); 
  image(ship2, ship-100, 200); 
  image(ship2, ship+250, 350); 
  image(ship1, ship-150, 100);
  
 tint(255);
 
   //Score
  fill(255);
  textSize(15);
  text("Click To Attack !!!", 230, 550);

  // IF Hit
  if (mouseX > x-50 && mouseX < x+50 && mousePressed == true) {
    textSize(40);
    fill(0);
    noStroke();
    fill(200,200,30,50);
    ellipse(x, y, 100,100);
    fill(200,100,30,50);
    ellipse(x, y, 50,50);
    x = int(random(50,550));
    y = 0;
    count++;
    eating.trigger();
  }
 
  // IF Not Hit
  if (y> 450|| y1> 450) {
    x = int(random(50,550));
    y = 0;
    number--;
    count -= 2;
  }
  }

 //Gameover Win
  if (count >=30) {
  replay();
  page = 3;
  }
  
// IF GameOver
  if (number <= 0) {
    background(0);
    image(bglose, 0, 0);
  }
  
  else if (page == 3) {
  //Back to Score 0
  number = 5;
  count = 0;
  y = -15;
  
  //BG image
  background(0);
  image(bgwin, 0, 0);
  
  //Text
  fill(255);
  textSize(18);
  text("Scan the QR code to enjoy your Space Trip !",110,200);
  }
  
}
//END OF DRAW

 
//Repaly Setting
void replay() {
    number = 5;
    count = 0;
    y = -15;
}

//Mouse Press to next page
void mousePressed() {
    if (page == 1 && mouseX > 200 && mouseX < 400 && mouseY > 470 && mouseY < 520) {
    page = 2;
    replay();
    
    }
    
  }
  
 
// The layer
void player() {
  image(astronaut, mouseX-45, 450);
  //image(astronaut, mouseX-45, mouseY-10);
}
 
 
// Remain life
void remainlife() {
  for (int num = 0; num < number; num++) {
    image(heart, 500-60*num, 30);
  }
}

//http://amachamusic.chagasi.com/image_hageshii.html
//Photo Ref
//Earth: http://us.123rf.com/400wm/400/400/lello4d/lello4d1201/lello4d120100009/11779729-planet-earth-with-some-clouds-atlantic-ocean-view-where-are-partially-visible-the-americas-africa-an.jpg
//Astronaut : http://mikyunglim.files.wordpress.com/2013/07/1-astronaut-floating-in-space-stocktrek-images.jpg

