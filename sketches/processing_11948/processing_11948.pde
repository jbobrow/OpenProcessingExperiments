
/**
 * bomb drop by Steven Kay, 2010
 */

LinkedList allobjects; // list of all game objects
LinkedList spawnings; // list of objects to spawn in the next frame
ListIterator li;
score sc;
shield sh;
PFont caption;
boolean gameover;

void setup() {
  caption=loadFont("2006-48.vlw");
  textFont(caption,100.0);
  allobjects=new LinkedList();
  spawnings=new LinkedList();
  
  size(512,512);
  background(0);
  reset();
  noCursor(); // no mouse pointer, ta.
}

// reset() is called when the game starts

void reset() {
  sc=new score();
  allobjects=new LinkedList();
  allobjects.add(sc);
  sh=new shield(0.0,height-50);
  allobjects.add(sh);
  allobjects.add(new crosshair());
  gameover=false;
  frameCount=0; // reset difficulty :)
}

// main game loop. 
  
void gameLoop() {  
  // for each game object in the linked list...
  li=allobjects.listIterator(0);
  while (li.hasNext()) {     
    gameObject go=(gameObject)li.next();
    if (go.alive) {
      // object is alive so animate and draw
      go.whenTick();
      go.draw();
      // object implements collision detection?
      if (go instanceof collisionDetection) {
        // test for collisions
        ListIterator objex=allobjects.listIterator(0);
        while (objex.hasNext()) {
          gameObject other=(gameObject)objex.next();
          if (other.alive && other!=go) {
            // call whenCollided() whenever a collision is detected
            if (((collisionDetection)go).hasCollidedWith(other)) {
              ((collisionDetection)go).whenCollided(other);
            }
          }
        }
      }
    } else {
      // object is dead, so remove from list
      if (!go.alive) li.remove();
    } 
  }
  // now, add new spawnings. can't do this in the loop above or you'll get a
  // concurrentModificationException - you can't modify a structure as you're iterating
  // over it!
  li=spawnings.listIterator(0);
  while (li.hasNext()) {  
    allobjects.add(li.next());
    li.remove();
  }
  //if (frameCount%20==0) print("Objects ["+allobjects.size()+"] fps="+frameRate+" fps fc="+frameCount+" \n");
}

/**
 * game event handlers follow
 *
 */

void mousePressed() {
  if (!gameover) {
    allobjects.add(new explosion(mouseX,mouseY));
  }
}

void keyPressed() {
  reset();
}

void draw() {
  background(0);
  gameLoop();
  if (random(0,10000)>9900-(frameCount/100)) {
    // spawn a new missile at random
    // as time progresses, missiles appear more often :)
    li.add(new missile());
  }
  if (random(0,10000)>9980) {
    // spawn a new aircraft at random
    li.add(new aircraft());
  }
  if (random(0,10000)>9995) {
    // fireworks...
    li.add(new fireworks());
  }
}


