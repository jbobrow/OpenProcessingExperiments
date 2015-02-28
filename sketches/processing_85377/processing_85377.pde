
import java.util.concurrent.ConcurrentHashMap;
import java.util.LinkedList;
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer song;
AudioSample laugh;
AudioInput input;

boolean inPlay = false;
boolean instructDisplay = false;
boolean gameOver = false;

PImage instruct, menu, bg, over;

KeyReader reader;
Player p;

public boolean up; public boolean left; public boolean right;

int sideScrollSpeed = -6;

World world;

void mouseClicked(){
  if(!inPlay && !instructDisplay){
    if(mouseX>=216 && mouseX<=389 && mouseY>=415 && mouseY<=485){
      inPlay = true;
    }
    else if(mouseX>=551 && mouseX<=834 && mouseY>=416 && mouseY<=486){
      instructDisplay = true;
    }
  }
  if(!inPlay && instructDisplay){
    if(mouseX>=413 && mouseX<=586 && mouseY>=416 && mouseY<=486){
      instructDisplay = false;
    }
  } 
  if(gameOver) {
    p.score = 0;
    gameOver = false;
    setup();
  }
}


void setup()
{
  size(1000, 500);  
  reader = new KeyReader();
  world = new World();
  
  p =  new Player(new PVector(3*width/4, height/3), sideScrollSpeed);
  world.add(p);
 
  //NEW init platforms
  for (int i = 0; i < 7; i++) {
    world.add(new Platform( new PVector(width/2+60+i*144*1.5, height-(60 + i*45)), sideScrollSpeed ));
    
  //music!
  minim = new Minim(this);
  song = minim.loadFile("Beat04.mp3");
  song.loop();
  laugh = minim.loadSample("bawk.mp3", 2048);
  }
  
  
  
  world.add(new Pigeon( new PVector(0,0), p, 1, -1*sideScrollSpeed));
  world.add(new Pigeon( new PVector(0,0), p, 2, -1*sideScrollSpeed));
  world.add(new Pigeon( new PVector(0,0), p, 3, -1*sideScrollSpeed));
  world.add(new Pigeon( new PVector(0,0), p, 4, -1*sideScrollSpeed));
  //left = false; right = false; up = false;
  
  instruct = loadImage("Instructions.png");
  menu = loadImage("StartScreen.jpg");
  bg = loadImage("Background.png");
  over = loadImage("GameOverScreen.png");
}

void draw()
{
  if (inPlay){
    image(bg,0,0);
    world.updateObjects();
  }
  else if (instructDisplay)
    image(instruct, 0, 0);
  else if (gameOver) {
    image(over,0,0);
    textSize(64);
    fill(0,0,0);
    text(Integer.toString(p.score), 280, 350);
  }
  else 
    image(menu,0,0);
}

// ADDED
void keyPressed()
{
  if(key == CODED){ 
    if (keyCode == UP)
      up = true;
    else if (keyCode == DOWN)
    { }
    if (keyCode == LEFT)
      left = true;
    else if (keyCode == RIGHT)
      right = true;
  }
  reader.onKeyPressed();
}

void keyReleased()
{
  if(key == CODED){ 
    if (keyCode == UP)
      up = false;
    else if (keyCode == DOWN)
    { }
    if (keyCode == LEFT)
      left = false;
    else if (keyCode == RIGHT)
      right = false;
  }
  reader.onKeyReleased();
}
//ADDED

boolean collisionWall(int x, int y1, int y2)
{
  /*int dy = sign(y2 - y1);
  y1 -= dy;
  while (y1 != y2) {
    y1 += dy;
    if (x < 0 || x >= width || y1 < 0 || y1 >= height)
      continue;
    if (y1 >= cmap.height || cmap.pixels[x + y1*width] == color(0))
      return true;
  }*/
  return false;
}

/*boolean collisionCeil(int y, int x1, int x2)
{
 if (y >= cmap.height)
    return true;
  int dx = sign(x2 - x1);
  x1 -= dx;
  while (x1 != x2) {
    x1 += dx;
    if (y < 0 || y >= height || x1 < 0 || x1 >= width)
      continue;
    if (y >= cmap.height || cmap.pixels[y*width + x1] == color(0))
      return true;
  }
  return false;
}*/

abstract class GameObject {
  PVector position;
  PVector dimensions;
  PVector speed;
  PVector acceleration;
  
  World world;
  Sprite sprite;
  
  GameObject(PVector pos) {
    position = pos;
    dimensions = new PVector(0,0);
    speed = new PVector(0,0);
    acceleration = new PVector(0,0);
  }
  
  void init(World w){
    world = w;
  }
  
  void kill(){
    world.remove(this);
  }
  
  //BEGIN Collision Detection
  int checkCollisions(){
    int count = 0;
    for(GameObject gameObject : world.gameObjects())
      if (gameObject != this && this.colliding(gameObject)){
        count++;
        this.onCollision(gameObject);
      }
    return count;
  }
  
  boolean colliding(GameObject other){
    //AABB
    return xOverlap(other) && yOverlap(other);
  }
  
  boolean xOverlap(GameObject other){
    return ! ((this.position.x > other.position.x + other.dimensions.x) ||
      (this.position.x + this.dimensions.x < other.position.x));
  }
  
  boolean yOverlap(GameObject other){
    return ! ((this.position.y > other.position.y + other.dimensions.y) ||
	(this.position.y + this.dimensions.y < other.position.y));
  }
  
  PVector center(){
    return new PVector((int)(position.x + .5 * dimensions.x), 
      (int)(position.y + .5 * dimensions.y));
  }
  //END Collision Detection
  
  //Sprite Stuff
  void setSprite(String spritepath, int frames){
    //We will use only CORNER sprites in this game.
    sprite = new Sprite(spritepath, frames, Sprite.CORNER);
    dimensions.x = sprite.width;
    dimensions.y = sprite.height;
  }
  
  void render() {
    //if(position.x + dimensions.x < 0)
      //this.kill();
    //System.out.println(speed);
    
    speed.add(acceleration);
    position.add(speed);
    sprite.render(position);
  }
  
  //BEGIN Sprite Stuff
  
  //BEGIN Abstract Functions
  abstract void onCollision(GameObject other);
  //END Abstract Functions
	
	
}
class KeyReader
{
  private boolean[] keys;
  private HashMap<String, Integer> keyMap;
    
  KeyReader()
  {
    keys = new boolean[256];
    keyMap = new HashMap<String, Integer>();
    for (int i = 0; i < keys.length; i++)
      keyMap.put(KeyEvent.getKeyText(i).toLowerCase(), i);
  }
  
  boolean check(String k)
  {
    Integer code = keyMap.get(k.toLowerCase());
    return code != null && keys[code];
  }
  
  void onKeyPressed()
  {
    keys[keyCode] = true;
    //println(KeyEvent.getKeyText(keyCode).toLowerCase());
  }
  
  void onKeyReleased()
  {
    keys[keyCode] = false;
  }
}
class Pigeon extends GameObject
{
  Player player;
  int pig_num;
  
  Pigeon(PVector pos, Player player, int num, int sideScrollSpeed) {
     super(pos);
     this.player = player;
     this.pig_num = num;
  }
  
  void init(World w) {
      super.init(w);
      setSprite("PigeonStrip.png", 3);
  }
  
  void render() {
    if (pig_num == 1) {
      position = player.pig1.removeFirst();
      position.x -= 90*-sideScrollSpeed;
    }
    if (pig_num == 2) {
      position = player.pig2.removeFirst();
      position.x -= 110*-sideScrollSpeed;
    }
    if (pig_num == 3) {
      position = player.pig3.removeFirst();
      position.x -= 60*-sideScrollSpeed;
    }
    if (pig_num == 4) {
      position = player.pig4.removeFirst();
      position.x -= 80*-sideScrollSpeed;
    }
    super.render();
  }
  
  void onCollision(GameObject other){
    //Platform's onCollision should never be called, the other things one should be called.
    System.out.println("Something collided with a PLATFORM!!!");
  }

}
    
class Platform extends GameObject
{
  Platform(PVector pos, int speed) {
    super(pos);
    this.speed.x = speed;
  }
  
  void init(World w) {
      super.init(w);
      String num = Integer.toString(int(random(1,10)));
      setSprite("Buildings/"+num+".png", 1);
      //setSprite("bat_larger.png",1);
  }
  
  void render()
  {
    super.render();
    if (position.x+dimensions.x < 0)
      reset();
  }
  
  int random_height() {
    int mid_offset = 60;
    float one = random(20 + mid_offset, height - mid_offset);
    return int(one);
  }
  
  void reset() {
    position.x = width;
    position.y = random_height();
  }
  
  void onCollision(GameObject other){
    //Platform's onCollision should never be called, the other things one should be called.
    System.out.println("Something collided with a PLATFORM!!!");
  }
}

public class Player extends GameObject {  
  public int score = 0;
  public float friction = 0.2;

  public float max_hspeed = 7;
  public float max_vspeed = 22;
  public float gravity = 1.0;
  
  private Sprite spr;
  private boolean midair;
  
  boolean lef; boolean righ; boolean upwar;
        
  LinkedList<PVector> pig1, pig2, pig3, pig4;

  public Player(PVector pos, int sideScrollSpeed) {
    super(pos);

	  //acceleration.y;
  }
  
  public int getScore() {return score;}

  public void init(World w) {
    super.init(w);
    setSprite("BoyStrip.png", 4);
    this.midair = true;
    pig1 = new LinkedList();
    for (int i = 0; i < 90; i++)
      pig1.addLast(new PVector (750/89*float(i) ,166/89*float(i)));
    pig2 = new LinkedList();
    for (int i = 0; i < 110; i++)
      pig2.addLast(new PVector (750/109*float(i) ,166/109*float(i)));
    pig3 = new LinkedList();
    for (int i = 0; i < 60; i++)
      pig3.addLast(new PVector (750/59*float(i) ,166/59*float(i)));
    pig4 = new LinkedList();
    for (int i = 0; i < 80; i++)
      pig4.addLast(new PVector (750/79*float(i) ,166/79*float(i)));
  }
	
  public void render(){
    
    // we could make it harder, depending on the current score!
    score++;
    /*
    if (score > 500) {
      max_hspeed = 8;
    }
    else if (score > 1000) {
      max_hspeed = 10;
    }
    */
    
    if (checkCollisions() == 0)
      midair = true;      
      
    pig1.addLast(position.get());
    pig2.addLast(position.get());
    pig3.addLast(position.get());
    pig4.addLast(position.get());
    
    if(midair) {
      acceleration.y = gravity;
      friction = .01;
    }
    else {
      acceleration.y = 0;
      friction = .5;
    }
    
    // arrow key controls
    /*
    if (keyPressed && key == CODED) {
      if (keyCode == LEFT) {
        lef = true;
        print("LEFT  ");
      } else if (keyCode == RIGHT) {
        righ = true;
        print("RIGH    ");
      }
      else {lef = false; righ = false;}
      if (keyCode == UP) {
        upwar = true;
        print("UPPP  ");
      }
      else {upwar = false;}
    }
    */
           
    // awsd controls
    if ((reader.check("a")||left) && speed.x > -max_hspeed) {
      speed.x -= 0.45;
      if (!midair)
        speed.x -= 0.65;
    } else if ((reader.check("d")||right) && speed.x < max_hspeed) {
      speed.x += 0.45;
      if (!midair)
        speed.x += 0.65;
    }
    if ((reader.check("w")||up) && !midair && speed.y >= 0) {
      if (reader.check("d")||right)
        speed.x += 5;
      if (reader.check("a")||left)
        speed.x += -5;
      speed.y = -22;
      midair = true;
    }
    

    // adding friction
    int s;
    if (speed.x > 0) s = 1;
    else if (speed.x < 0) s = -1;
    else s = 0;
    if (abs(speed.x) <= friction)
      speed.x =0;
    else
      speed.x = s*(abs(speed.x) - friction);
      
    // should stay still
    //position.x += sideScrollSpeed;
    
    if (position.y > height + dimensions.y || position.x < 0 - dimensions.x)
      gameOver();
    
    position.x += sideScrollSpeed;
    
    super.render();
    midair = true;
  }
  void onCollision(GameObject other) {
    
    if (other instanceof Platform){
      
      if (speed.y > 0 && midair) //on a platform
      {
        if ((position.y + dimensions.y) <= other.position.y + 25) {
          position.y = other.position.y - dimensions.y;
          midair = false;
          speed.y = 0;
        }
        
        //speed.x = sideScrollSpeed;
      }
    }
    
    if (other instanceof Pigeon)
      gameOver();
  }
  
  void gameOver() {
  
  //System.out.println("GAME OVER!!!!! score = "+ Integer.toString(score));
  inPlay = false;
  gameOver = true;
  laugh.trigger();
  }  
  
}


class Sprite
{
  protected PImage sprite_strip, current_frame;
  protected int nframes, _height, _width;
  protected PVector origin;
  
  public float frame, speed, angle, xscale, yscale;
  public static final int BASE = 0, CORNER = 1, CENTER = 2, RIGHT = 3, TOP = 4, LEFT = 5;
  public int height, width;
  
  public Sprite(String filename, int nframes, PVector origin)
  {
    this.nframes = nframes;
    this.origin = origin;
    xscale = yscale = 1;
    frame = 0;
    speed = 0.25;
    angle = 0;
    sprite_strip = loadImage(filename);
    _height = this.height = sprite_strip.height;
    _width = this.width = sprite_strip.width/nframes;
    current_frame = sprite_strip.get(0, 0, _width, _height);
  }
  
  public Sprite(String filename, int nframes, int originMode)
  {
    this(filename, nframes, new PVector(0, 0));
    if (originMode == BASE) {
      origin.x = _width/2;
      origin.y = _height;
    } else if (originMode == CENTER) {
      origin.x = _width/2;
      origin.y = _height/2;
    } else if (originMode == LEFT) {
      origin.x = 0;
      origin.y = _height/2;
    } else if (originMode == RIGHT) {
      origin.x = _width;
      origin.y = _height/2;
    } else if (originMode == TOP) {
      origin.x = _width/2;
      origin.y = 0;
    }
  }
  
  public Sprite(String filename, int nframes)
  {
    this(filename, nframes, new PVector(0, 0));
  }
  
  public void render(PVector origin)
  {
    PMatrix old = getMatrix();
    PMatrix mat = new PMatrix2D();
    
    update();
    mat.translate(origin.x, origin.y);
    //mat.rotate(angle);
    //mat.scale(xscale, yscale);
    setMatrix(mat);
    image(current_frame, -this.origin.x, -this.origin.y);
    setMatrix(old);
  }
  
  private void render(PVector origin, PGraphics graphics) {
    graphics.pushMatrix();
    graphics.translate(origin.x, origin.y);
    graphics.rotate(angle);
    graphics.scale(xscale, yscale);
    graphics.image(current_frame, -this.origin.x, -this.origin.y);
    graphics.popMatrix();
  }
  
  protected void update()
  {
    frame += speed;
    while (frame > nframes)
      frame -= nframes;
    current_frame = sprite_strip.get((round(frame) % nframes) * _width, 0, _width, _height);
    this.width = int(_width * xscale);
    this.height = int(_height * yscale);
  }
}


class World {
  ConcurrentHashMap<Integer, GameObject> gameObjects;
	
  World(){
    gameObjects = new ConcurrentHashMap<Integer, GameObject>();
  }
  
  Iterable<GameObject> gameObjects() {
    return gameObjects.values();
  }
  
  void add(GameObject gameObject) {
    synchronized (gameObjects){
      gameObjects.put(new Integer(gameObject.hashCode()), gameObject);
    }
    gameObject.init(this);
  }
	
  void remove(GameObject gameObject) {
    synchronized (gameObjects){
      gameObjects.remove(gameObject.hashCode());
    }
  }
  
  void updateObjects(){
    
    /*synchronized (gameObjects){
      Collection<GameObject> sorted = gameObjects.values();
      
      for(GameObject gameObject : sorted){
        gameObject.render();
      }
    }*/
    synchronized (gameObjects){
      for(GameObject gameObject : gameObjects.values()){
        gameObject.render();
      }
    }
  }
}


