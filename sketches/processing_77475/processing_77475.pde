
/*maybe try: 

if (currentAction == "pushed") {
    if (pushed.display(currentx,currenty))
          currentAction = "getup";
}
to designate "eaten" ???

*////////////////////////////////////////////

Cell[][] grid;
int maxPop = 1000;
int startPop = 100;
//Neme[] neme = new Neme[500];
Microbe[] microbe = new Microbe[maxPop];
//Timer timer;


// Number of columns and rows in the grid
int cols = 10;
int rows = 10;
//int totalNeme = 0;


void setup() {
size(700,700);
smooth();
colorMode(HSB);
frameRate(15);
int w = width/cols;
int h = height/rows;
grid = new Cell[cols][rows];


for(int i = 0; i < startPop; i++) {
microbe[i] = new Microbe();
}
//for(int i = 0; i < totalNeme; i++) {
//neme[i] = new Neme();
//}
// The counter variables i and j are also the column and row numbers
// In this example, they are used as arguments to the constructor for each object in the grid.
for (int i = 0; i < cols; i ++ ) {
for (int j = 0; j < rows; j ++ ) {
// Initialize each object
grid[i][j] = new Cell(i*w,j*h,w,h);
}
}
//timer = new Timer (10000);
//timer.start();
}

void draw() {
background(255);
noStroke();

//initialize grid function
for (int i = 0; i < cols; i ++ ) { 
for (int j = 0; j < rows; j ++ ) {
grid[i][j].display();
}
}

//if (timer.isFinished()) {
//neme[totalNeme] = new Neme();
//totalNeme++;
//if (totalNeme >= neme.length) {
//totalNeme = 0;
//}
//timer.start();
//}


//initialize nemetode functions
//for (int i = 0; i < totalNeme; i++) {
//neme[i].move();
//neme[i].display();
//neme[i].intercept();

//}

//initialize microbe functions
for (int i = 0; i < startPop; i++) {
microbe[i].move();
microbe[i].display();

//microbe[i].eat();
microbe[i].divide();
microbe[i].die();


}
//for(int i = 0; i < totalNeme; i++) {
//for (int j = 0; j < startPop; j++) {
//if (neme[i].intersect(microbe[j])) {
//microbe[j].eaten();
//}
//}
//}

//for(int i = 0; i < startPop; i++) {
//for(int j = 0; j < cols; j++ ) { 
//for (int k = 0; k < rows; k++ ) {
//if (microbe[i].intersect(grid[j][k])) { // && microbe[i].eaten()
//grid[j][k].state = grid[j][k].state + microbe[i].die;

//}
//}
///}
//}
} //end of draw

 /////////////////////////////////////////////////////////////////////////////////////////

////microbe class
class Microbe {
color c;
float r;
float state;
//float repstate;
//Pvector pos,vel,dir;
float x,y;
float searchDist; //water function -- ability to move
float maxVal; //awareness of cell.state
float die;

///microbe constructors
Microbe () {
c = color(236,162,160);
r = 18;
state = random(3,20);
//repstate = 12;
x = random(width);
y= random(height);
//pos = new PVector(_x,_y);
//vel = new PVector(0,0);
searchDist =1;
maxVal = 23;
die = (0.75 *(random(6,50)/random(6,50))- 0.05);
}

///microbe functions
void move() {
x += random(searchDist);
y += random(searchDist);

if (x > width || x < 0) {
searchDist *= -1;
}
if (y > height || y < 0) {
searchDist *= -1;
}
}

void display() {
stroke(0);
fill (c);
ellipse(x,y,r,r/2);
}

 

void divide() {
if(state > 12){
Microbe m = new Microbe();
microbe = (Microbe[]) append(microbe,m);
fill(150,162,160);
}
}

void die() {
if (state < 4) {
searchDist = 0;
//cell.state = cell.state/2 + 4;
}
}

boolean eaten() {
if (eaten() == true) {
return true; 
}else {
return false;
}
}

//boolean intersect(Cell c) {
//float distance = dist(x,y,c.x,c.y);
//if (distance == 0); if ("eaten" == true) { 
//(eaten())
//return true;
//} else {
//return false; 
//}
//}
} //end class Microbe

 

 /////////////////////////////////////////////////////////////////////////////////////////

///Neme 
class Neme {
float x,y;
float speed;
color c;
float r;

Neme() {
r = 60;
x = -r;
y = random(height);
speed = random(1,4);
c = color(170,192,153);
}

void move() {
x += speed;
}

boolean reachedSide() {
if (x > width + r*2) {
return true;
} else {
return false;
}
}


boolean intersect(Microbe d) {
float distance = dist(x,y,d.x,d.y);
if (distance < ((r + d.r)/3)) {
return true;
} else {
return false; 
}
}

void display() {
fill(c);
noStroke();
ellipse(x,y,r,r/30);
}


}

///timer
class Timer {
int savedTime;
int totalTime;
Timer(int tempTotalTime) {
totalTime = tempTotalTime;
}

void start() {
savedTime = millis();
}

boolean isFinished() {
int passedTime = millis() - savedTime;
if (passedTime > totalTime) {
return true;
} else {
return false;
}
}
}

 /////////////////////////////////////////////////////////////////////////////////////////

// A Cell object 
class Cell { 
float x,y; 
float w,h; 
float state;
float h1;
float h2;
float h3;
float s;
float b;

// Cell Constructor 
Cell(float tempX, float tempY, float tempW, float tempH) { 
x = tempX;
y = tempY;
w = tempW;
h = tempH;
state = int(random(6,50));
h1 = random(56,90); // POSSIBLE TO MAKE THIS INCREMENTAL? check colors
h2 = random(38,55);
h3 = random (20,37);
s=162;
b=160;
}


//display cell color according to CN value
void display() { 
noStroke();
rect(x,y,w,h);

if (state <= 20) { // NOT SURE ABOUT THIS ... ASSIGN COLOR RANGE TO STATE...
// darkest green
fill(h1,s,b);
} else if (state <= 35 && state >=21) { //HOW WRITE between 21-35? Use AND?
// medium green
fill(h2,s,b);
} else if (state <= 50 && state >= 36) { // 35-50
// brown
fill(h3,s,b);
}
}

}

 

 

 

