
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import java.awt.event.KeyEvent;

Starfield starfield;
Comet comets[];
Ship ships[];
Torpedo torpedos[];
Planet planets[];
int COMET_AMOUNT = 12;
int MAX_TORPEDOS = 10;
int MAX_BOOM = 25;
int SHOOTING_DELAY = 18;
float ROT_INTERVAL = .1;
int INVIC_TIME = 5;
int RESPAWN_TIME = 25;
int TORPEDO_POWER = 100;
//Add images
PImage boom;
PImage backG;
Boolean started = false;

//Add audio from library
Minim backMusic;
AudioPlayer song;
Minim effect1;
AudioPlayer bang;

//Add animation
Animation animation1;

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
  //println(KeyEvent.getKeyText(keyCode)+ ": "  + keyCode);
}

void keyReleased()
{ 
  keys[keyCode] = false;
}


void setup() {
  size(1024, 650);
  starfield = new Starfield( 100 );
  effect1 = new Minim(this);
  bang = effect1.loadFile("explosion-4.wav");
  //Load background image
  backG = loadImage("SpaceBackground.jpg");
  //backG.resize(640, 480);

  //Play background music
  backMusic = new Minim(this);
  song = backMusic.loadFile("backgroundSound.wav");
  song.play();
  song.loop();

  //Create custom comets
  comets = new Comet[COMET_AMOUNT];//cometCreator();
  for (int c = 0; c < COMET_AMOUNT; c++)
    comets[c] = cometCreator();
  torpedos = new Torpedo[MAX_TORPEDOS];
  for (int t = 0; t < torpedos.length;t++)
  {
    torpedos[t] = new Torpedo(20, 10, 240);
    torpedos[t].active = false;
  }
  PImage simg = loadImage( "ship1.png" );
  PImage simg2 = loadImage( "ship2.png" );
  PImage plimg = loadImage( "Planet1.png" );
  PImage plimg2 = loadImage( "Planet2.png" );
  //Resize ship to be smaller
  int shipW = 64;
  int shipH = 64;
  int planetW = 200;
  int planetH = 200;
  simg.resize(shipW/2, shipH/2);
  simg2.resize(shipW/2, shipH/2);
  plimg.resize(planetW, planetH);
  plimg2.resize(planetW, planetH);
  ships = new Ship[2];


  planets = new Planet[2];

  planets[1] = new Planet( plimg.width, height/2, plimg, 1, ships[1]);
  planets[0] = new Planet( width-plimg2.width, height/2, plimg2, 0, ships[0]);

  ships[1] = new Ship(planets[1].x, planets[1].y, 5, simg, 1);
  ships[0] = new Ship(planets[0].x, planets[0].y, 5, simg2, 0);
  ships[0].direction = PI;

  boom = loadImage( "boom.png" );
  boom.resize(50, 50);

  frameRate( 25 );

  //Create animation
  animation1 = new Animation("explode", 3, 64, 64, true);
  
  smooth();
  }

int backX = 0;
int backX2 = 1921;

void draw() {
  //Black background base
  background(0);
  //Add scrolling background image
  image (backG, backX, -100);
  backX = backX - 1;
  image (backG, backX2, -500);
  //backX2 = backX2 - 1;
  //image(backG, backX2 * 2, -100);
  starfield.draw();


  for (int p = 0; p < planets.length;p++)
  {
    planets[p].draw();
  }
  for (int t = 0; t < torpedos.length;t++)
  {
    torpedos[t].update();
    torpedos[t].draw();
  }




  if ( ships[0].canShoot == true && ships[0].boom_count <= 0 && ships[0].respawn <= 0) {
    //if ( keyPressed == true) {
    if (checkKey(38) == true) {
      ships[0].up();
    } 
    else if ( checkKey(40) == true) {
      ships[0].down();
    }
    if ( checkKey(37)) {
      ships[0].left();
    } 
    else if (checkKey(39)) {
      ships[0].right();
    }

    if (checkKey(47)  && ships[0].canShoot ) {
      ships[0].createTorpedo();
      //torpedo.x = ship.x + ship.img.width/2 - 20;
      // torpedo.y = ship.y;
      //torpedo.active = true; placeholder torpedo code
    }
  }
  //}

  if ( ships[1].canShoot == true && ships[1].boom_count <= 0 && ships[1].respawn <= 0) {
    //if ( keyPressed == true) {
    if ( checkKey(87) == true) {
      ships[1].up();
    } 
    if ( checkKey(83) ) {
      ships[1].down();
    }
    if ( checkKey(65)) {
      ships[1].left();
    } 
    else if (checkKey(68)) {
      ships[1].right();
    }
    if (checkKey(32)  && ships[1].canShoot ) {
      ships[1].createTorpedo();
      //torpedo.x = ship.x + ship.img.width/2 - 20;
      // torpedo.y = ship.y;
      //torpedo.active = true; placeholder torpedo code
    }
  }
  // } 

  for (int s = 0; s < ships.length; s++)
  {
    ships[s].timers();
    if (ships[s].boom_count > 0) {
      //Display explosion animation
      animation1.display(ships[s].getBox().x1, ships[s].getBox().y1); 
      //Play sound effect

      if (ships[s].boom_count == MAX_BOOM)
      {

        bang.play();
        bang = effect1.loadFile("explosion-4.wav");
      }
      ships[s].boom_count--;
      if (ships[s].boom_count == 0)
      {

        ships[s].x = planets[s].x;
        ships[s].y = int(random(height/3, height - height/3));
        ships[s].direction = PI * (1-s);
        ships[s].invincible = INVIC_TIME;
        ships[s].respawn = RESPAWN_TIME;
      }
    }
    else
    {
      if (ships[s].respawn <= 0)
        ships[s].draw();
    }


    for (int t = 0; t < torpedos.length;t++)
    {
      if ( torpedos[t].active && ships[1-(torpedos[t].creator.identifier)].getBox().isOverlap(torpedos[t].getBox()) && ships[1-(torpedos[t].creator.identifier)].boom_count <= 0 && ships[s].respawn <= 0) {
        ships[1-(torpedos[t].creator.identifier)].boom_count = 25;
        torpedos[t].active = false;
      }
    }
  }

  for (int c = 0; c < comets.length; c++) {
    cometDraw(comets[c]);
  }


  for (int t = 0; t < torpedos.length;t++)
  {
    for (int o = 0; o < torpedos.length;o++)
    {
      if (torpedos[t].active && torpedos[o].active && torpedos[t].getBox().isOverlap(torpedos[o].getBox()) && torpedos[t].creator.identifier != torpedos[o].creator.identifier)
      {
        torpedos[t].active = false;
        torpedos[o].active = false;
      }
    }
  }

  for (int t = 0; t < torpedos.length;t++)
  {
    if (torpedos[t].active && planets[1-torpedos[t].creator.identifier].getBox().isOverlap(torpedos[t].getBox())) {
      Planet pl = planets[1-torpedos[t].creator.identifier];
      if (pl.shield > 0)
        pl.shield -= 1;
      else
        pl.hp -= TORPEDO_POWER;
      if (pl.cooldown <= 0)
        pl.cooldown = 25 * 3;
      torpedos[t].active = false;
    } 
    //planet stuff
  }
  for (int p = 0; p < 2; p++)
  {
    pushMatrix();
    Planet plan = planets[p];
    strokeWeight( 1 );
    float MAX_HP = 5000.0;

    int HUD_HEIGHT = 16;
    float HUD_WIDTH = 256.0;
    if (p == 1)
    {
      fill(255, 0, 0);
      noStroke();
      rect(0, 0, HUD_WIDTH *(planets[p].hp/MAX_HP*100)/100, HUD_HEIGHT);
      stroke(85);
      noFill();
      rect(0, 0, HUD_WIDTH, HUD_HEIGHT);
      stroke(255);
      fill(0, 0, 255);
      for (int s = 0; s < planets[p].shield; s++)
        rect(s * 16, HUD_HEIGHT, 16, 16);
      fill(255);
      textSize(16);
      text("Player " + p, 50, HUD_HEIGHT + 16);
    }
    else
    {
      fill(255, 0, 0);
      noStroke();
      rect(width - HUD_WIDTH*(planets[p].hp/MAX_HP*100)/100, 0, HUD_WIDTH, HUD_HEIGHT);
      stroke(85);
      noFill();
      rect(width - HUD_WIDTH, 0, HUD_WIDTH, HUD_HEIGHT);
      stroke(255);
      fill(0, 0, 255);
      for (int s = 0; s < planets[p].shield; s++)
        rect(width - ((s+1) * 16), HUD_HEIGHT, 16, 16);
      fill(255);
      textSize(16);
      text("Player " + (p+2), width-50-textWidth("Player 2"), HUD_HEIGHT + 16);
    }
    popMatrix();
  }
}

Comet cometCreator() {
  PImage cimg = loadImage( "asteroidCustom.png" );
  //Randomly resize comet
  int cometW = int(random(40, 100));
  int cometH = (cometW - cometW/3);
  int cometSp = int(random(2, 4));
  cimg.resize(cometW, cometH);
  Comet comet = new Comet(int(random(260, width-260)), (height-cimg.width)*round(random(1)), cometSp, cimg);//new Comet( width + cimg.width/2, int( random( height - cimg.width ) + cimg.width/2), cometSp, cimg );
  comet.active = true;
  return comet;
}

void cometDraw (Comet comet) {  
  if (comet.active == true)
  {
    for (int s = 0; s < ships.length; s++)
    {
      if ( ships[s].getBox().isOverlap( comet.getBox()) && comet.boom_count <= 0 && ships[s].boom_count <= 0 && ships[s].invincible <= 0 && ships[s].respawn <= 0) {
        ships[s].boom_count = 25;
        comet.boom_count = 25;
      }
    } 

    for (int p = 0; p < planets.length;p++)
    {
      if (planets[p].getBox().isOverlap(comet.getBox()) && comet.boom_count <= 0)
      {
        int force = comet.img.width * comet.speed;
        if (planets[p].shield > 0)
        {
          int sh = planets[p].shield;
          planets[p].shield -= round(force/90) ;
          force -= sh*90;
          if (planets[p].shield < 0)
            planets[p].shield = 0;
          if (planets[p].cooldown <= 0)
            planets[p].cooldown = 25*3;
        }
        if (force > 0)
          planets[p].hp -= force;
        comet.boom_count = 25;
      }
    }


    for (int t = 0; t < torpedos.length;t++)
    {
      if ( torpedos[t].active && comet.getBox().isOverlap( torpedos[t].getBox()) && comet.boom_count <= 0) {
        comet.boom_count = 25;
        torpedos[t].active = false;
      }
    }

    if ( comet.boom_count == 0 ) {  
      comet.update();
      comet.draw();
    } 
    else if ( comet.boom_count == 1 ) {
      image( boom, comet.getBox().x1, comet.getBox().y1 );
      comet.reset();
      comet.boom_count--;
    } 
    else {
      image( boom, comet.getBox().x1, comet.getBox().y1 );
      comet.boom_count--;
    }
  }
}

void stop()
{
  song.close();
  backMusic.stop();
  effect1.stop();
  super.stop();
}

class Animation {
  PImage[] images;
  int imageCount;
  int frame;
  int w;
  int h;

  Animation(String imagePrefix, int count, int w, int h, Boolean resize) {
    imageCount = count;
    images = new PImage[imageCount];
    this.w = w;
    this.h = h;
    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into four digits
      String filename = imagePrefix + nf(i, 2) + ".png";
      images[i] = loadImage(filename);
      if (resize)
        images[i].resize(w, h);
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
    if (b.x1 < x2 && b.x2 > x1 && b.y2 > y1 && b.y1 < y2) {
      //if ((( x1 <= b.x1 && b.x1 <= x2 ) || ( x1 <= b.x2 && b.x2 <= x2 ))
      //&& (( y1 <= b.y1 && b.y1 <= y2 ) || ( y1 <= b.y2 && b.y2 <= y2 ))) {
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
  int boom_count = 0;
  Boolean active = false;
  float direction;
  public Comet( int x, int y, int speed, PImage img ) {
    this.x = x;
    this.y = y;
    this.speed = speed;
    this.img = img;
    this.alph = 0;
    if (y < height/2) //bottom half
    {
      if (round(random(3)) == 0) {
        if (round(random(1)) == 0)
          this.direction = random(PI/2, PI);
        else
          this.direction = random(0, PI/2);
      }
      else
        this.direction = random(0, PI);
    }
    else
    {
      if (round(random(3)) == 0) {
        if (round(random(1)) == 0)
          this.direction = random(PI, 3*PI*2);
        else
          this.direction = random(3*PI*2, TWO_PI);
      }
      else
        this.direction = random(PI, TWO_PI);
    }
  }

  public void update() {
    alph-= 0.1;
    y += speed * sin(direction);
    x += speed * cos(direction);
  }

  public void reset() {
    x = int(random(260, width-260));
    y = (height-img.width)*round(random(1));
    if (y < height/2)
      this.direction = random(0, PI);
    else
      this.direction = random(PI, TWO_PI);
  }

  public void draw() {
    pushMatrix();
    translate ( x, y );
    rotate( alph );
    image( img, -img.width/2, -img.height/2 );
    popMatrix();
    if ((x > width && cos(direction) > 0) || (x < 0 && cos(direction) < 0) || (y > height && sin(direction) > 0) || (y < 0 && sin(direction) < 0)) 
      reset();
    //Box b = getBox();
    //rect(b.x1, b.y1, b.x2 - b.x1, b.y2 - b.y1);
  } 

  public Box getBox() {
    return new Box( x-img.width/2, y-img.height/2, x+img.width/2, y+img.height/2);
  }
}

public class Planet {
  int x;
  int y;
  PImage img;
  float hp = 5000.0;
  int identifier;
  Ship owner;
  int shield = 3;
  int cooldown = 0;
  PImage shimg;


  public Planet( int x, int y, PImage img, int id, Ship own) {
    this.x = x;
    this.y = y;
    this.img = img;
    identifier = id;
    owner = own;
    shimg = loadImage( "shield.png");
    shimg.resize(200, 200);
  }

  public void draw() {
    pushMatrix();
    translate ( x, y );
    image( img, -img.width/2, -img.height/2 );
    popMatrix();
    //Box box = getBox();
    //rect(box.x1, box.y1, box.x2-box.x1, box.y2-box.y1);
    if (cooldown > 0)
      cooldown--;
    else
      if (cooldown <= 0) {
        if (shield < 3)
          shield++;
        cooldown = 25 * 3;
      }
    if (shield > 0)
    {
      pushMatrix();
      tint(255, 126);  // Display at half opacity
      translate ( x, y );
      image( shimg, -img.width/2, -img.height/2 );
      tint(255, 255);
      popMatrix();
    }
    if (hp <= 0)
    {
      bang = effect1.loadFile("explosion-4.wav"); 
      bang.play();
      stroke(255);
      textSize(26);
      fill(255);
      text("Player " + (identifier + 1) + " Wins!", width/2- textWidth("Player " + (identifier + 1) + " Wins!")/2, height/2);
      noLoop();
    }
  } 

  public Box getBox() {
    return new Box( x-img.width/3, y-img.height/3, x+img.width/3, y+img.height/3);
  }
}

public class Ship {
  PImage img;
  int speed;  
  int x;
  int y;
  int boom_count = 0;
  int identifier = 0;
  Boolean canShoot = true;
  int cooldown = 0;
  int invincible = 0;
  float direction = 0; //radians
  int respawn = 0;

  public Ship( int x, int y, int speed, PImage img, int identifier ) {
    this.speed = speed;
    this.x = x;
    this.y = y;
    this.img = img;
    this.identifier = identifier;
  }

  void timers() {
    if (cooldown > 0)
      cooldown--;
    if (invincible > 0)
      invincible--;
    if (respawn > 0)
    {
      respawn--;
    }
  }

  void draw() {
    pushMatrix();
    translate ( x, y );
    rotate(direction);
    image( img, -img.width/2, -img.height/2 );
    popMatrix();
    if ( y > height - img.height/2 ) 
      y = height - img.height/2;
    if ( y < img.height/2 ) 
      y = img.height/2;
    if ( x > width - img.width/2 ) 
      x = width - img.width/2;
    if ( x < img.width/2 ) 
      x = img.width/2;
  }

  void createTorpedo()
  {
    if (cooldown <= 0)
    {
      int ti = -1;
      for (int t = 0; t < MAX_TORPEDOS; t++) 
      {
        if (torpedos[t].active == false)
        {
          ti = t;
        }
      }
      if (ti != -1)
      {
        torpedos[ti].active = true;
        torpedos[ti].x = x + img.width/2 - 20;
        torpedos[ti].y = y;
        torpedos[ti].creator = this;
        torpedos[ti].direction = direction;
        cooldown = SHOOTING_DELAY;
      }
    }
  }

  void up() {
    y += speed * sin(direction);
    x += speed * cos(direction);
    if ( y < img.height/2 ) { 
      y = img.height/2;
    }
  }

  void right() {
    direction += ROT_INTERVAL;
  }

  void left() {
    direction -= ROT_INTERVAL;
  }

  void down() {
    y -= speed/2 * sin(direction);
    x -= speed/2 * cos(direction);
  }

  public Box getBox() {
    return new Box( x - img.width/2, y-img.height/2, x+img.height/2, y+img.height/2);
  }
}

public class Starfield {
  private Star stars[];
  private int count;

  public Starfield( int count ) {
    this.count = count;
    stars = new Star[count];
    for ( int i =0; i < count; i++) {
      stars[i] = new Star( random( width ), random( height ), random( 10 ));
    }
  }

  public void draw() {
    strokeWeight( 4 );
    for ( int i =0; i < count; i++) {
      //Color some stars red and yellow
      if (stars[i].z < 5.8 && stars[i].z > 5.5) {
        stroke( (stars[i].z * 25), (stars[i].z * 25), 0 );
      }
      else if (stars[i].z < 4.3 && stars[i].z > 4.0) {
        stroke( (stars[i].z * 25), 0, 0 );
      }
      else {
        stroke( stars[i].z * 25 );
      } 
      point( stars[i].x, stars[i].y );

      stars[i].x -= stars[i].z;
      if (stars[i].x < 0) { 
        stars[i] = new Star( width, random( height ), sqrt(random( 100 )));
      }
    }
  }
}

class Star {
  float x, y, z;
  Star( float x, float y, float z ) {
    this.x = x;
    this.y = y;
    this.z = z;
  }
}

public class Torpedo {
  PImage img;
  int x;
  int y;
  boolean active;
  Ship creator;
  float direction;

  public Torpedo(int s, int x, int y) {
    img = makeTexture( s );
    this.x = x;
    this.y = y;
    this.active = false;
  }

  void update() {
    if (active) {
      x+=(12*cos(direction));
      y += (12*sin(direction));
      if ((x > width && cos(direction) > 0) || (x < 0 && cos(direction) < 0) || (y > height && sin(direction) > 0) || (y < 0 && sin(direction) < 0)) {
        active = false;
      }
    }
  }

  void draw() {
    pushMatrix();
    if (active) {
      blend( img, 0, 0, img.width, img.height, int(x) - img.width/2, int(y) - img.height/2, img.width, img.height, ADD);
    }
    popMatrix();
  }

  public Box getBox() {
    return new Box( x - 20, y-20, x+20, y+20);
  }

  PGraphics makeTexture( int r ) {
    PGraphics res = createGraphics( r * 6, r * 6);
    res.beginDraw();
    res.loadPixels();
    for ( int x = 0; x < res.width; x++) {   
      for ( int y = 0; y < res.height; y++ ) {
        float d = min( 512, 50*  sq( r / sqrt( sq( x - 3 * r) + sq( y - 3 * r))));
        res.pixels[y * res.width + x] = color( d* 0.5, min(255, d*0.8), d* 0.5 );
      }
    }
    res.updatePixels();
    res.endDraw();
    return res;
  }
}



