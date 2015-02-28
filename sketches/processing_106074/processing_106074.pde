
 import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

public class Torpedo {
  PImage img;
  int x;
  int y;
  boolean active;
  float degrees;

  public Torpedo(int s, int x, int y) {
    img = makeTexture( s );
    this.x = x;
    this.y = y;
    this.active = false;
    this.degrees = 0;
  }

  void update() {
    x+= 20 * cos(degrees);
    y+= 20 * sin(degrees);
  }

  void draw() {
    blend( img, 0, 0, img.width, img.height, int(x) - img.width/2, int(y) - img.height/2, img.width, img.height, ADD);
  }

  public Box getBox() {
    return new Box( x - 20, y-20, x+20, y+20);
  }

  PGraphics makeTexture( int r ) {
    PGraphics res = createGraphics( r * 6, r * 6, JAVA2D);
    res.beginDraw();
    res.loadPixels();
    for ( int x = 0; x < res.width; x++) {   
      for ( int y = 0; y < res.height; y++ ) {
        float d = min( 512, 50*  sq( r / sqrt( sq( x - 3 * r) + sq( y - 3 * r))));
        res.pixels[y * res.width + x] = color( min(255, d), min(255, d*0.8), d* 0.5 );
      }
    }
    res.updatePixels();
    res.endDraw();
    return res;
  }
}

class Animation {
  PImage[] images;
  int imageCount;
  int frame;
  int repeatCount;
  int currCount;
  Animation(String imagePrefix, int count) {
    imageCount = count;
    images = new PImage[imageCount];
    repeatCount = 4;
    currCount = 0;
    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into four digits
      String filename = imagePrefix + nf(i, 2) + ".png";
      images[i] = loadImage(filename);
    }
  }

  void display(float xpos, float ypos) {
    frame = (frame+1) % imageCount;
    image(images[frame], xpos, ypos);
  }
  
  int getWidth() {
    return images[0].width;
  }
}
public class Box {
  int x1, x2;
  int y1, y2;
  
  Box( int x1, int y1, int x2, int y2 ) {
    this.x1 = x1;
    this.y1 = y1;
    
    this.x2 = x2;
    this.y2 = y2;
  }
  
  boolean isOverlap( Box b ) {
    if ((( x1 <= b.x1 && b.x1 <= x2 ) || ( x1 <= b.x2 && b.x2 <= x2 ))
     && (( y1 <= b.y1 && b.y1 <= y2 ) || ( y1 <= b.y2 && b.y2 <= y2 ))) {
      return true; 
    }
    return false;
  }  
}
public class Comet {
  int x;
  int y;
  int speed;
  PImage img;
  float alph;
  int val;
  
  public Comet( int x, int y, int speed, PImage img, int val ) {
    this.x = x;
    this.y = y;
    this.speed = speed;
    this.img = img;
    this.alph = 0;
    this.val = val;
  }
  
  public void update() {
    alph-= 0.1;
    if (val == 0){
      x += speed;
      if (x > width)
        reset();
}
    else if (val == 1)
    {
      x -= speed;
      if (x < 0)
        reset();
    }
    else if (val == 2)
    {
      y += speed;
      if (y > height)
        reset();
    }
    else
    {
      y -= speed;
      if ( y< 0)
        reset();
    }
  }
  
  public void reset() {
     val = int(random(4));
     if (val == 0)
    {
        x = 0 - img.width;
        y = int(random(height));
    }
    else if (val == 1)
    {
        x = width + img.width;
        y = int(random(height));
    }
    else if (val == 2)
    {
        x = int(random(width));
        y = 0 - img.height;
    }
    else
    {
       x = int(random(width));
       y = height + img.height;
    }
  }
  
  public void draw() {
    pushMatrix();
    translate (x,y);
    rotate( alph );
    image( img, -img.width/2, -img.height/2 );
    popMatrix();
  } 
  
  public Box getBox() {
    return new Box( x-img.width/2, y-img.height/2, x+img.width/2 , y+img.height/2);
  }
}

public class Ship {
  PImage img;
  int speed;  
  int x;
  int y;
  boolean done = false;
  
  public Ship( int x, int y, int speed, PImage img ) {
    this.speed = speed;
    this.x = x;
    this.y = y;
    this.img = img;
    angle = 0;
  }
  
  void draw() {
    if (!done)
    {  
      pushMatrix();
      translate ( x, y );
      rotate(angle);
      image( img, -img.width/2, -img.height/2 );
      popMatrix();
    }
  }
  
  void up() {
    x+= 10 * cos(angle);
    y+= 10 * sin(angle);
   if ( y < 0) { y = height; }
   if (y > height) { y = 0;}
   if (x < 0) {x = width;}
   if (x > width) { x = 0;}
  }
  
  void down() {
   x-= 10 * cos(angle);
   y-= 10 * sin(angle);
   if ( y < 0) { y = height; }
   if (y > height) { y = 0;}
   if (x < 0) {x = width;}
   if (x > width) { x = 0;}

  }
  

  void right() {
    angle += .2;
  }
  void left() {
    angle -= .2;
  }
  
  
  public Box getBox() {
    return new Box( x - img.width/2, y-img.height/2, x+img.height/2, y+img.height/2);
  }
}
 public class Starfield {
  private Star stars[];
  private int count;
  private PImage bubble = loadImage( "bubble.png" );
   
  public Starfield( int count ) {
    this.count = count;
    stars = new Star[count];
    for ( int i =0; i < count; i++) {
      stars[i] = new Star( random( width ), random( height ), random( 10 ));
      stars[i].p = bubble;
    }
  }
  
  
  public void draw() {
    
    strokeWeight( 1 );
    for ( int i =0; i < count; i++) {
      stroke(255,100 ); //stars[i].z
      noFill();
      ellipse( stars[i].x, stars[i].y,10,10 );
      image( bubble, -bubble.width/2, -bubble.height/2 );
      stars[i].y -= stars[i].z;
      if (stars[i].y < 0) { 
        stars[i] = new Star( random( width ),height, sqrt(random( 100 )));
      }
    }
  }
}

class Star {
  float x, y, z;
  PImage p;
  Star( float x, float y, float z ) {
    this.x = x;
    this.y = y;
    this.z = z;
  }
}
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

int rectX, rectY;      // Position of square button
boolean rectOver = false;
int rectSize = 100;

Starfield starfield; 
ArrayList <Comet> comets = new ArrayList<Comet>(); //alien enemies
ArrayList <Torpedo> torpedos = new ArrayList<Torpedo>(); // bullets
int torpedoCount = 0; // number of torpedos present on screen
Ship ship; //object controlled by user

float angle = 0; //angle of ship
int score = 0; //current score in game
int lives = 3; //number of lives in game
PImage img; //background image
PImage life; //image of ship lives
PImage simg; // ship image
PImage cimg;//alien image
int numComets = 1; //number of aliens present on screen
boolean increaseEnemies = false; //boolean val whether the number of aliens should be increased
int boom_count = 0;
int torpedoPause = 5;
int shipX = 0;
int shipY = 0;

Boolean play = true;


//background music
Minim backMusic;
AudioPlayer song;

Minim effect1;
AudioPlayer bang;
//alien explosion sound
Minim effect2;
AudioPlayer boom;

Minim effect3;
AudioPlayer shot;

//Add animation
Animation animation1;

import java.awt.event.KeyEvent;

boolean[] keys = new boolean[526];

boolean checkKey(int k)
{
  if (keys.length >= k) {
    return keys[k];
  }
  return false;
}

void keyPressed()
{ 
  keys[keyCode] = true;
}

void keyReleased()
{ 
  keys[keyCode] = false;
}

void setup() {
  rectX = width/2-rectSize-10;
  rectY = height/2-rectSize/2;
  size(1000, 600);
  //Set up starfield
  starfield = new Starfield( 100 );
  //Play background music
  backMusic = new Minim(this);
  song = backMusic.loadFile("music.mp3");
  song.play();
  song.loop();
  //Load lives image 
  life = loadImage("life.png");
  life.resize(200, 200);
  //Load background image
  img = loadImage("ocean.png");
  cimg = loadImage( "alien.png" );
  cimg.resize(80, 80);
  //For every alien, an x and y is set based on a random val; this allows for aliens to come from all edges of the screen  
  for (int i = 0; i < numComets; i++)
  {
    int x = 0;
    int y = 0;
    int val = int (random (4));
    if (val == 0)
    {
      x = 0 - cimg.width;
      y = int(random(height));
    }
    else if (val == 1)
    {
      x = width + cimg.width;
      y = int(random(height));
    }
    else if (val == 2)
    {
      x = int(random(width));
      y = 0 - cimg.height;
    }
    else
    {
      x = int(random(width));
      y = height + cimg.height;
    }
    comets.add (new Comet( x, y, 5, cimg, val ));
  }
  // load ship image
  simg = loadImage( "boat.png" );
  simg.resize(110, 60);
  ship = new Ship( width/2, height/2, 10, simg );
  frameRate( 25 );
  //Create animation
  animation1 = new Animation("explode", 3);
  smooth();
  effect1 = new Minim(this);
  effect2 = new Minim(this);
  effect3 = new Minim(this);
}

void draw() {
  if (play)
  {
    if (torpedoPause > 0)  
      torpedoPause--;
    img.resize(1000,600);
    background(img);
    starfield.draw();
    textSize(20);
    text("Click anywhere on screen to pause.", 630, 30);
    //updates torpedos
    for (int i = 0; i < torpedoCount; i++)
    {
      torpedos.get(i).update();
      torpedos.get(i).draw();
    }
    //displays current score
    textSize(30);
    text(score + "", 30, 100);
    fill(255, 255, 255);
    //Adds more enemies based on current score
    if ( increaseEnemies && (score == 10 || score == 50 || score % 100 == 0)) 
    { 
      numComets++;
      comets.add (new Comet( 10, 10, 10, cimg, 10 ));
      increaseEnemies = false;
    }
    //Displays correct number of lives through number of images displayed on screen
    for (int i = 1; i <= lives; i++)
      image(life, (i*65)-110, -60);
    //When number of lives run out, a "GAME OVER!!!" message is displayed on screen 
    if (lives <= 0) {
      textSize (100);
      text("GAME OVER!!!", 170, height/2); 
      fill(255, 255, 255); 
      ship.done = true;
      play = false;
    }
    //User controls
    if ( checkKey(38)) {
      ship.up();
    } 
    if ( checkKey(40)) {
      ship.down();
    }
    if (checkKey(39)) {
      ship.right();
    }
    if (checkKey(37)) 
      ship.left();
    if (checkKey(32) && torpedoPause <= 0 )
    {
      torpedos.add( new Torpedo(10, ship.x, ship.y));
      torpedoCount++;
      torpedos.get(torpedoCount-1).degrees = angle;
      torpedoPause = 5;
      shot = effect3.loadFile("Shot(1).wav");
      shot.play();
    }
    ship.draw();
    if (boom_count > 0)
      boom_count--;
    for (int i = 0; i < numComets; i++)
    {
      //Collision detection b/w ship and alien
      if ( ship.getBox().isOverlap( comets.get(i).getBox()) && boom_count  == 0 && !ship.done) {
        shipX = ship.getBox().x1;
        shipY = ship.getBox().y1;
        lives--;
        comets.get(i).reset();
        comets.get(i).draw();
        boom_count = 25;
        boom = effect2.loadFile("alien_explosion.wav");
        boom.play();
      }  

      if (boom_count > 0)
      {
        animation1.display(shipX, shipY);
        ship = new Ship( -100, -100, 10, simg );
      }

      if (boom_count == 1)
        ship = new Ship( width/2, height/2, 10, simg );

      //Collision detection b/w torpedo/bullet and alien
      for (int x = 0; x < torpedoCount; x++)
      {
        if (comets.get(i).getBox().isOverlap( torpedos.get(x).getBox())) {
          comets.get(i).reset();
          comets.get(i).draw();
          torpedos.remove(x);
          torpedoCount--;
          score += 10;
          increaseEnemies = true;
          //Load Submarine Explosion Sound
          bang = effect1.loadFile("Submarine_explosion (1).wav");
          bang.play();
        }

        //If torpedo leaves screen, it is removed from ArrayList
        else if (torpedos.get(x).x > width || torpedos.get(x).x < 0 || torpedos.get(x).y > height || torpedos.get(x).y < 0) {
          torpedos.remove(x);
          torpedoCount--;
          x++;
        }
      } 
      //update aliens  
      comets.get(i).update();
      comets.get(i).draw();
    }
  }

  update(mouseX, mouseY);
}


void update(int x, int y) {
  if ( overRect(rectX, rectY, rectSize, rectSize) ) {
    rectOver = true;
  }
}

void mousePressed() {
  if (rectOver && play) {
    play = false;
  }
  else
    play = true;
}

boolean overRect(int x, int y, int width, int height) {
  if (mouseX >= x && mouseX <= x+width && 
    mouseY >= y && mouseY <= y+height) 
  {
    return true;
  } 
  else {
    return false;
  }
}



