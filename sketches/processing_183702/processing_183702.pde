
Food myFood1;
Rest myRest1;

ArrayList bots;
int size;
void setup() {
size(600, 600);
sizeH = 50;
 
 bots = new ArrayList();
 
  for (int i = 0; i<sizeH ; i++) {
    
   float x = random(-40, width - 40);
    float y = random(-40, height - 40);
    float hunger = random(0,10);
    float t = random(10,20);
    
  Ant myAnt =new Ant(x,y,hunger,t);
  bots.add(myAnt);

  }
    
//myAnt1 = new Ant(color(0, 0, 255), width, height, 2, 5, 10);

myFood1 = new Food();
myRest1 = new Rest();

}

void draw() {
background(255);
fill(247,107,107);
//triangle(width/2, height/2, width/2-30, height/2+50, width/2+30, height/2+50);

// fill(107,247,141);
////////// REAL INTERACTION
myFood1.script();
myRest1.script();

 for (int i = 0; i< size; i++) {
   Ant myAnt = (Ant) bots.get(i);
    myAnt.script();  
    myAnt.locateFood(myFood1.getX(), myFood1.getY());
    myAnt.locateRest(myRest1.getX(), myRest1.getY());
    
// myAnt1.locateFood(myFood1.getX(), myFood1.getY());
// myAnt1.locateRest(myRest1.getX(), myRest1.getY());


}
// myAnt1.script();

}

class Ant { 

//color c;
float hunger;
float t; //tiredness

PVector location;
PVector speed;

PVector foodLocation;
PVector restLocation;
PVector target;

int state = 0;



Ant( float tempXpos, float tempYpos, float tempHunger, float tempT) { 
location = new PVector (random (0, tempXpos), random (0, tempYpos));
speed = new PVector (1, 1);
target = new PVector (50,50);
restLocation = new PVector (200,250); 
foodLocation = new PVector (30,40);
hunger = tempHunger;
t = tempT;


}

void setColor (color cC) {
color C = cC;
}

void life() {
  fill(0,0,0);
//text ("hunger", location.x - 10, location.y);
//text(hunger, location.x, location.y);

hunger = hunger - 0.001;
//text ("tiredness", 20, 40);
//text(t, location.x, location.y - 10);

t = t - 0.005;
}

void setTarget (float x, float y) {
target.x = x;
target.y = y;

}

int atTarget(){
if (abs(location.x - target.x) < 10 && abs(location.y - target.y) < 10) 
return 1;
else 
return 0;
}

void display() {
stroke(0);
fill(random(150),0,0);
ellipse(location.x, location.y, 6, 6);
}

void changeState() {
//state 1 - find food
//state 2 - find rest 
//state 3 - at food
//state 4 - at rest
//state 5 - eat
//state 6 - rest
//
if (hunger < 3) state = 1;

if (state != 1 && t < 15) state = 2;

if (location.x == foodLocation.x && location.y == foodLocation.y ) state = 3;
//if (state == 3 && hunger <3) state = 5;
if (location==restLocation) state = 4;

if (state == 1) {
setTarget (foodLocation.x, foodLocation.y);
}


if (state == 2) {setTarget (restLocation.x, restLocation.y);
}

//if (state == 3) { hunger = hunger + 0.1;
//}

//if (state == 4) {t = t + 1 ;}
//}
}




void locateFood (float x, float y) {
foodLocation = new PVector(x, y);
}

void locateRest (float x, float y) {
restLocation = new PVector(x, y);
}

void move() {
if (location.x > target.x) location.x = location.x - speed.x;
if (location.x < target.x) location.x = location.x + speed.x;
if (location.y > target.y) location.y = location.y - speed.y;
if (location.y < target.y) location.y = location.y + speed.y;
}

void script(){

life();
move();
display();
changeState();
}

}

class Food {

int size = 40;
PVector location;

Food () {
location = new PVector (random (0, width), random (0, height));
}

void display() {
fill(0,255,0);
ellipse( location.x, location.y, size, size);

fill (0,0,0);

 text ("FOOD", location.x - 60, location.y+5);
//text (location.y, location.x, location.y+10);

} 

void script(){
display();
}

float getX () {
return location.x;
}

float getY () {
return location.y;
}

}

class Rest {
int size = 40;
PVector location;

Rest () {
location = new PVector (random (0, width), random (0, height));
}

void display() { 

fill (216,109,255);
ellipse(location.x, location.y, size, size);
fill (0,0,0);
text ("REST", location.x - 60, location.y+5);
// text (location.y, location.x, location.y+10);

} 

void script(){
display();
}

float getX () {
return location.x;
}

float getY () {
return location.y;
}

}

