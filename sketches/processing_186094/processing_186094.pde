
ArrayList <Bot> bots = new ArrayList <Bot> (); 
ArrayList <Dron> drons = new ArrayList <Dron> (); 
Base myBase1;
Res myRes1;
Water myWater1;
void setup() {
size(900, 600);
// base = loadImage("Space_station.jpg");
myBase1 = new Base();
myRes1 = new Res();
myWater1 = new Water();

bots = new ArrayList();

for (int i = 0; i < 50 ; i++) {

float x = random(-40, width - 40);
float y = random(-40, height - 40);
float m = random(5,15);
float st = (random(1,5)/3);

bots.add(new Bot(x,y,m));

}

drons = new ArrayList();

for (int i = 0; i < 50 ; i++) {

float x = random(-40, width - 40);
float y = random(-40, height - 40);
float m = random(5,15);
float st = (random(1,5)/3);

drons.add(new Dron(x,y,m));

}

}
void draw() {
background(0);
fill(247,107,107);
myBase1.script();
myRes1.script();
myWater1.script();


//image(base, 0,325,400,300);
for (int i = 0; i< 1; i++) {
Dron myDron = (Dron) drons.get(i);
myDron.script(); 
myDron.locateWater(myWater1.getX(), myWater1.getY());

myDron.script(); ///// THIS BLOCK WAS MISSING!
}

for (int i = 0; i< 1; i++) {
Bot myBot = (Bot) bots.get(i);
myBot.script(); 
myBot.locateRes(myRes1.getX(), myRes1.getY());


myBot.script(); ///// THIS BLOCK WAS MISSING!
}

} 



class Base { 

PVector location;
PVector status; // x - resorses on our base, y - water on it

Base () {
location = new PVector (random (0, width), random (0, height));
status = new PVector (random (10, 15), random (15, 20));

}

void display(){

ellipse(location.x,location.y, 20,20);
}
void repair(){

status.x = status.x - 0.01;
status.y = status.y - 0.01;
println(status.x);


}

void recovery(){
// if ((bots.getX() == location.x) && (myBot1.getY() == location.y)) status.x= status.x + 0.02;
// if ((myDron1.getX() == location.x) && (myDron1.getY() == location.y)) status.y= status.y + 0.02;
}

void script(){
display();
repair();

}

float getX () {
return location.x;
}

float getY () {
return location.y;
}

float getRes(){
return status.x;
}
float getWater (){
return status.y;
}
}

class Bot { 

//color c;
// float storage; // maximum "value" of our bot 
float m; //weight
PVector location;
PVector speed;

PVector WaterLocation;
PVector ResLocation;
PVector BaseLocation;
PVector velocity;
PVector target;
PVector acceleration;
float storage = 0;
float state = 0;
float stop_distance = 100;
float maxforce = 5;
float maxspeed = 3;


Bot( float tempXpos, float tempYpos, float tempm) { 
m = tempm;
location = new PVector (random (0, tempXpos), random (0, tempYpos));
//speed = new PVector (random(1,5)/m, random(1,5)/m);
speed = new PVector (10/m, 10/m);
target = new PVector (50,50);
velocity = new PVector (0,0);
acceleration = new PVector (0,0);


//resourseLocation = new PVector (200,250); 
//waterLocation = new PVector (30,40);

}




int atTarget(){
if (abs(location.x - target.x) < 20 && abs(location.y - target.y) < 20 && target.x != 50 && target.y != 50) 
return 1;
else 
return 0;
}

void display() {
fill(255);
ellipse(location.x, location.y, 6, 6);
}


void locateRes (float x, float y) {
ResLocation = new PVector(x, y);
}

void changeState() {

if (myBase1.getRes() < 3) state = 1;
if (state == 1) {setTarget (myRes1.getX(), myRes1.getY());}

if ( (atTarget() == 1) && (storage < 10)) state = 2;

if (state ==2 ) storage = storage +0.01;

if (storage == 10) state = 3;
if (state == 3) {setTarget (myBase1.getX(), myBase1.getY());}

if ( (atTarget() == 1) && (storage < 0)) state = 4;
if (state == 4 ) storage = storage - 0.01;

text(storage,40,100);

}

void move() {
seek(target);
update();
changeState();
}

void seek(PVector target) {
PVector desired = PVector.sub (target, location);
float d = desired.mag();
desired.normalize();

if (d < stop_distance) {
float con = map (d, 0, stop_distance, 0, maxspeed);
desired.mult (con);
}

else {
desired.mult(maxspeed);
}

PVector steer = PVector.sub(desired, velocity);
steer.limit (maxforce/m);

acceleration.add (steer);
}

void update() {
velocity.add (acceleration);
velocity.limit (maxspeed);
location.add (velocity);
acceleration.mult(0);
}

void setTarget (float x, float y) {
target.x = x;
target.y = y;

}

void script(){

//life();
move();
display();
changeState();
}

float getX () {
return location.x;
}

float getY () {
return location.y;
}
}


class Dron { 

//color c;
// float storage; // maximum "value" of our bot 
float m; //weight
PVector location;
PVector speed;
PVector acceleration;
PVector velocity;
PVector WaterLocation;
PVector BaseLocation;
PVector target;
float storage = 0;
float state = 0;
float stop_distance = 70;
float maxforce = 5;
float maxspeed = 3;

Dron( float tempXpos, float tempYpos, float tempm) { 
m = tempm;
location = new PVector (random (0, tempXpos), random (0, tempYpos));
//speed = new PVector (random(1,5)/m, random(1,5)/m);
speed = new PVector (10/m, 10/m);
target = new PVector (50,70);
velocity = new PVector (0,0);
acceleration = new PVector (0,0);




//resourseLocation = new PVector (200,250); 
//waterLocation = new PVector (30,40);

}




int atTarget(){
if (abs(location.x - target.x) < 20 && abs(location.y - target.y) < 20 && target.x != 50 && target.y != 50) 
return 1;
else 
return 0;
}

void display() {
fill(53,71,250);
ellipse(location.x, location.y, 6, 6);
}

void locateWater (float x, float y) {
WaterLocation = new PVector(x, y);
}


void changeState() {

if (myBase1.getWater() < 5) state = 1;
if (state == 1) {setTarget (myWater1.getX(), myWater1.getY());}

if ( (atTarget() == 1) && (storage < 10)) state = 2;

if (state ==2 ) storage = storage +0.01;

if (storage == 10) state = 3;
if (state == 3) {setTarget (myBase1.getX(), myBase1.getY());}

if ( (atTarget() == 1) && (storage < 0)) state = 4;
if (state == 4 ) storage = storage - 0.01;

text(storage,40,120);

}
void seek(PVector target) {
PVector desired = PVector.sub (target, location);
float d = desired.mag();
desired.normalize();

if (d < stop_distance) {
float con = map (d, 0, stop_distance, 0, maxspeed);
desired.mult (con);
}

else {
desired.mult(maxspeed);
}

PVector steer = PVector.sub(desired, velocity);
steer.limit (maxforce/m);

acceleration.add (steer);
}

void update() {
velocity.add (acceleration);
velocity.limit (maxspeed);
location.add (velocity);
acceleration.mult(0);
}

void setTarget (float x, float y) {
target.x = x;
target.y = y;

}

void move() {
seek(target);
update();
changeState();
}

void script(){

//life();
move();
display();
changeState();
}

float getX () {
return location.x;
}

float getY () {
return location.y;
}
} 

class Res {

int size = 40;
PVector location;
// PImage resourse;

Res () {
location = new PVector (random (0, width), random (0, height));
}

void display() {
pushStyle();
strokeWeight (2);
stroke (18,144,7); 
fill(68,240,100);
ellipse(location.x,location.y,size,size);
popStyle();
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
class Water {

int size = 40;
PVector location;
// PImage resourse;

Water () {
location = new PVector (random (0, width), random (0, height));
}

void display() {
pushStyle();
strokeWeight (2);
stroke (53,189,250); 

fill(5,51,229);
ellipse(location.x,location.y,size,size);
popStyle();
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


