
int x = 30;
//boolean switch to start the bot
boolean start = true;
boolean mouseon = false;
int xp = 35;
//stores random value
int r;
//stores the x positions of the cubes
int [] xarray = new int[5];

void setup(){
size(500,500);
//slow and nice
frameRate(5);
//for loop to store the first five cubes' Xs
for(int i = 0; i <= 4;i++){
    xarray[i] = x;
    x = x + 50;
  }
}

void draw(){
background(163,209,245);
display();
fill(255);
//for loop to draw five cubes
for(int i = 0; i < xarray.length;i++){
  strokeWeight(2);
  rect(xarray[i],50,50,50);
  }
  fill(0);
  bot();
  fill(0);
  text("X: " + mouseX,50,300);
  text("Y: " + mouseY,50,350);
  text("Bot's Xposition: " + xp,50,400);
}

//bot code
void bot (){
if (start == true){
  start();
  start = false;
  }
  else {
  action();
  }
}

//draws bot in leftmost cube
void start(){
rect(xp, 55, 40, 40);
action();
}

void action (){
randomiser();
if(r == 1){
  //moves rightwards
  move(3);
  }
if (r == 2){
 //moves leftwards
  move(9);
  }
else {
  //stays still
  move(0);
  }
}

//function to get a random value
int randomiser (){
  r = int(random(1,10));
  return r;
}

int move (int m){
if (m == 3){
  if(xp < 235){
    xp = xp + 50;
    rect(xp,55,40,40);
    }
  }
if (m == 9){
  if(xp > 35){
    xp = xp - 50;
    rect(xp,55,40,40);
    }
  }
if(m == 0){
  rect(xp,55,40,40);
  }
  return m;
}

void display(){
fill(0);
textSize(25);
text("Bot Project",200,20);
if(mouseon == true){
  text("The Bot Project is being developed",5,140);
  text("by Shinichi in the Summer of 2013.",5,170);
  text("A simple bot with a simple goal.",5,200);
  }
}

void mousePressed (){
fill(0);
if(mouseon == true){
  mouseon = false;
  }
 else if(mouseon == false){
  mouseon = true;
  }
}
