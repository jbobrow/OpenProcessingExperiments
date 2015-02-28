
import netscape.javascript.*;



/*
Very simple Game. The rules are simple. Destroy Rebecca Black before she destroys you.
 Use Mr.Ferraro or the guy in the suit to destroy Rebecca Black.
 He will appear randomly and Rebecca will appear every 5 seconds.
 Everytime you use Ferraro to destroy Rebecca, your score will increase as well as the speed of your snake
 Use the arrow keys to move your snake.
 I know Rebecca is merciless, so press 'r' to revive yourself.
 This is a game where points don't necessarily matter.
 You will have 10 lives
 To enhance gameplay, play "Friday" by Rebecca Black in the background
 
 Used codes from:
 
 DrivingCirclesDemo by Michael Ferraro, licensed under Creative Commons Attribution-Share Alike 3.0 and GNU GPL license.
 Work: http://openprocessing.org/visuals/?visualID=28570
 License:
 http://creativecommons.org/licenses/by-sa/3.0/
 http://creativecommons.org/licenses/GPL/2.0/
 
 Also from:
 
 http://processing.org/discourse/yabb2/YaBB.pl?num=1276644884/4
 
 
 */


int speed = 7;
ArrayList<itms> items ;
itms item2 ;
Snake mySnake;
ArrayList<Border> allLine;
ArrayList<Border> borderLine;
boolean gameOver = false;
PFont fonts;
boolean up = false;
boolean down = false;
boolean left = false;
boolean right = false;
boolean start = true;
boolean startGame = false;
int count = 1;
int d = 0;
int current = 0;
float x ;
float y ;
PVector item = new PVector();
ArrayList<PVector> pv;
PVector nuclear = new PVector();
int numOfTime;
ArrayList<PVector> nuc;
int howMuch;
ArrayList<Snake> snakey;
PImage rebecca;
PImage ferraro;
int used;
PVector previous;
int howMany;
PImage friday;
int lives;



void setup() {
  size(500, 500);
  fonts = loadFont("Arial-BoldMT-48.vlw");
  frameRate(20);
  mySnake = new Snake(20, color(0), width/2, height/2 );

  allLine = new ArrayList<Border>();
  borderLine = new ArrayList<Border>();
  items = new ArrayList<itms>();
  pv = new ArrayList<PVector>();
  nuc = new ArrayList<PVector>();
  snakey = new ArrayList<Snake>();
  ferraro = loadImage("ferraro.jpg");
  rebecca = loadImage("Black.png");
  friday = loadImage("itsfriday.png");
  used = 0;
  allRoad(allLine);
  bor(borderLine);
  headNbody(snakey);
  lives = 10;
}

void mouseClicked() {
  startGame = true;
}

void allRoad(ArrayList<Border> r) {
  int a = 0;
  r.add( new Border(a, a, width-a, a) );
  r.add( new Border(width-a, a, width-a, height-a) );
  r.add( new Border(a, height-a, width-a, height-a) );
  r.add( new Border(a, a, a, height-a) );
}
void bor(ArrayList<Border> e) {
  int d = 18;
  e.add( new Border(d, d, width-d, d) );
  e.add( new Border(width-d, d, width-d, height-d) );
  e.add( new Border(d, height-d, width-d, height-d) );
  e.add( new Border(d, d, d, height-d) );
}
void headNbody(ArrayList<Snake> a) {
  if (a.size() == 0) {
	a.add(mySnake);
  }
}
void item() {
  boolean Stack = true;
  item = new PVector(random(50, width-65), random(50, height-65));
  if (pv.size() > 0) {
	while (Stack) {
  	for (int i = 0 ; i <pv.size() && Stack ; i++) {
    	// println(i);
    	// if item is made within the range of another item, find a different coordination
    	if (pv.get(i).dist(item) < 200  || mySnake.getVect().dist(item) < 200) {
      	item = new PVector(random(50, width-65), random(50, height-65));
      	Stack = true;
    	}
    	else {
      	Stack = false;
    	}
  	}
	}
  }

  pv.add(item);
}
void drawItem(PVector pos) {
  fill(color(0, 200, 66));
  imageMode(CENTER);
  image(rebecca, pos.x, pos.y);
  // draw Rebecca Black
}

void drawNuc(PVector pos) {
  fill(color(0));
  image(ferraro, pos.x, pos.y);
  // draw the nuclear weapon a.k.a Ferraro
}


void makeRandomNuc() {
  boolean Stack = false;
  // make random nuclear weapon at a random time
  if (int(random(0, 125)) == 0) {
	while (numOfTime == 0) {
  	// make random nuclear weapon at random location
  	nuclear = new PVector(random(50, width-65), random(50, height-65));

  	fill(color(0));
  	nuc.add(nuclear);
  	numOfTime++;
  	// everytime nuclear bomb is used, speed increases
  	if (speed < 25) {
    	speed++;
  	}
	}
  }
}



void draw() {
  // start the display street
  if (startGame == false) {
	background(255);
	textFont(fonts);
	fill(24, 60, 150);
	text("Click to Start", 100, 55);
  }  

  //game started
  if (gameOver == false && startGame == true) {
	//  background(255);
	background(friday);
	textFont(fonts);
	fill(24, 60, 150);
	text(howMany, width - 70, 55);

	makeRandomNuc();

	//make all the outer border ( can"t see)
	for ( Border border : allLine ) {
  	border.render();
	}

	//make the inner border(the part that causes collision)
	for (Border aborder: borderLine) {
  	aborder.render();
	}

	//draw all nuclear weapons
	for (PVector b : nuc) {
  	drawNuc(b);
	}

	// create item( Rebecca) around every 5 seconds
	if (frameCount % 50 == 0 ) {
  	item();
  	howMuch++;
	}

	//draw items(Rebecca)
	for (PVector a: pv) {
  	drawItem(a);
  	if (mySnake.getVect().dist(a) < 40) {
    	gameOver = true;
  	}
	}

	//use the nuclear weapon to remove everything in the item arrayList
	for (int i = 0 ; i < nuc.size() ; i++) {
  	if (mySnake.getVect().dist(nuc.get(i)) < 43) {
    	numOfTime--;
    	used++;

    	for (int a = 0 ; a< pv.size(); a++) {
      	pv.remove(a);
      	a--;
      	howMany++;
    	}

    	nuc.remove(i);
  	}
	}

	// draw the snake

	mySnake.render();




	//move the snake
	moveWhere();
  }


  // if game is over, press 'r' to revive
  if (gameOver == true) {

	background(255);
	textFont(fonts, 33);
	fill(25);
	text("Game Over!", width/2-110, 55);
	text("Score: " + howMany, width/2-80, height/2);
	text("Rebecca is merciless.", width/2-180, height/2 +30);
	text("Press 'r' to revive  ", width/2-150, height/2 +60);


	if (lives != 0 ) {
  	if (keyPressed) {
    	if (key == 'r' ) {
      	startGame = true;
      	gameOver= false;
    	}
  	}
	}
  }
}





// move MySnake when it is pressed
void moveWhere() {
  headNbody(snakey);
  PVector moveVector;
  moveVector = new PVector(0, 0);
  if (start) {
	moveVector.y = -speed;
  }

  if (up) {
	moveVector.y = -speed;
  }
  if (down)
	moveVector.y = speed;
  if (right)
	moveVector.x = speed;
  if (left)
	moveVector.x = -speed;

  for (Snake a : snakey) {
	a.move(moveVector);
  }
}


void keyPressed() {

  switch (keyCode) {
  case UP:
	down = false;
	left = false;
	right = false;
	up = true;
	start = false;
	break;

  case DOWN:
	start = false;
	down = true;
	left = false;
	right = false;
	up = false;

	break;

  case LEFT:
	start = false;
	down = false;
	left = true;
	right = false;
	up = false;
	break;

  case RIGHT:
	down = false;
	left = false;
	up = false;
	right = true;
	start = false;
	break;
  }
}



// creates the snake item

class Snake {
  color c;
  PVector loc;
  int radius;

  Snake(int r, color a, float tempX, float tempY) {
	c = a;
	loc = new PVector(tempX, tempY);
	radius = r;
  }

  PVector getVect() {
	previous = loc;
	return loc;
  }

  void setVect(PVector previous) {
	loc = previous;
  }

  void render() {
	stroke(0);
	fill(c);
	ellipseMode(CENTER);
	ellipse(loc.x, loc.y, 25, 25);
  }

  void move(PVector moveVector) {
	loc.add(moveVector);
	//	PVector these = new PVector();
	//	for(int i = 1 ; i < snakey.size(); i++){
	//  	these = snakey.get(i-1).getVect();
	//  	snakey.get(i).setVect(previous);
	//    
	//	}

	if (isCollision()) {
  	gameOver = true;
	}
  }

  // collision method for detecting collision with borders
  public boolean isCollision() {

	for (Border seg : allLine) {
  	PVector a = seg.A;
  	PVector b = seg.B;
  	if (a.dist(loc) <= radius)
    	return true;
  	if (b.dist(loc) <= radius)
    	return true;

  	PVector distance = getDistance(a.x, a.y, b.x, b.y, loc.x, loc.y);
  	PVector closest = new PVector(distance.x, distance.y);
  	float dist = distance.z;
  	float lessX = a.x, greatX = b.x;
  	if (a.x > b.x) {
    	float tmp = lessX;
    	lessX = greatX;
    	greatX = tmp;
  	}
  	float lessY = a.y;
  	float greatY = b.y;
  	if (a.y > a.y) {
    	float tmp = lessY;
    	lessY = greatY;
    	greatY = tmp;
  	}

  	if (closest.x >= lessX && closest.x <= greatX
    	&& closest.y >= lessY && closest.y <= greatY) {
    	if (closest.dist(loc) <= radius) {
      	return true;
    	}
  	}
	}  
	return false;
  }
}



//creates the object aBorder
class aBorder {
  PVector A, B;

  aBorder(int x, int y, int x1, int y1) {
	A = new PVector(x, y);
	B = new PVector(x1, y1);
  }

  void render() {
	stroke(0);
	line(A.x, A.y, B.x, B.y);
  }
}


//creates the object Border
class Border {

  PVector A, B;

  Border(int x, int y, int x1, int y1) {
	A = new PVector(x, y);
	B = new PVector(x1, y1);
  }

  void render() {
	stroke(0);
	line(A.x, A.y, B.x, B.y);
  }
}


//creates the object Itms(rebecca's duplicates)
class itms {
  PVector A;
  PVector B;
  itms(PVector a) {

	A = new PVector(66, 67);
	B = new PVector(a.x, a.y);
  }

  PVector getX() {
	return A;
  }

  PVector getY() {
	return B;
  }


  void render() {
	stroke(0);
	fill(22, 25, 34);
	image(rebecca, 20, 20);
  }
}

//creates the object nuclearItm(Ferraro's duplicates)
class nuclearItm {
  PVector a;
  PVector b;

  nuclearItm(PVector b) {
	// a = new PVector(ferraro);
	// b= new PVector(b.x,b.y);
  }
  void render() {
	stroke(0);
	fill(0);
	//image(ferraro,pos.x,pos.y);
  }
}







/**
 * from http://processing.org/discourse/yabb2/YaBB.pl?num=1276644884/4
 */
PVector getDistance( float x1, float y1, float x2, float y2, float x, float y ) {
  PVector result = new PVector();

  float dx = x2 - x1;
  float dy = y2 - y1;
  float d = sqrt( dx*dx + dy*dy );
  float ca = dx/d; // cosine
  float sa = dy/d; // sine

  float mX = (-x1+x)*ca + (-y1+y)*sa;

  if ( mX <= 0 ) {
	result.x = x1;
	result.y = y1;
  }
  else if ( mX >= d ) {
	result.x = x2;
	result.y = y2;
  }
  else {
	result.x = x1 + mX*ca;
	result.y = y1 + mX*sa;
  }

  dx = x - result.x;
  dy = y - result.y;
  result.z = sqrt( dx*dx + dy*dy );

  return result;
}


