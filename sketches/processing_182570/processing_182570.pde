
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
target = new PVector (0,0);


hunger = tempHunger;
t = tempT;


}

void setColor (color cC) {
color C = cC;
}

void life() {
  fill(0,0,0);
//text ("hunger", location.x - 10, location.y);
text(hunger, location.x, location.y);

hunger = hunger - 0.01;
//text ("tiredness", 20, 40);
text(t, location.x, location.y - 10);

t = t - 0.05;
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
//fill(c);
ellipse(location.x, location.y, 10, 10);
}

void changeState() {
//state 1 - find food
//state 2 - find rest 
//state 3 - 

if (hunger < 3) state = 1;
if (t < 20) state = 2;

if (state == 1) {

setTarget (foodLocation.x, foodLocation.y);

}

///if (state == 2) {

///setTarget (restLocation.x, restLocation.y);

///}
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

