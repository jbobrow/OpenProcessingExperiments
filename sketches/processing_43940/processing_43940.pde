
//Declare Variables
 float x = 0;
 float y = 0; 
 float d = 0;
 float end;
 int r = 25;
 
 int counter;

 //Declare variables for timer
 float timer, start, totalTime;

 //Balloon Variables
 int bSize = 200;//no of balloons
 Balloon[] balloon = new Balloon[bSize];
 int value=0;

 void setup() 
 {
   PFont font;
 smooth(); 
 stroke(50);
 size(500, 600); //Size of window
// background(255);
// font= loadFont("AngsanaNew-Bold-48.vlw");
// textFont(font);
// fill(0);
// text("game will start in 2...",70,40,50);

 for (int i=0;i<bSize;i++) {
 balloon[i] = new Balloon(random(width), random(height+600), random(1), random(361), (int)random(100)+155); //new balloon with random positioning
 }
 }

 void draw() {
 cursor(CROSS); //Cursor is set to cross almost like an aim
// end=650;
 start = 600;
 timer += 1;
 totalTime = timer;

//if (totalTime>start){
 fill(135, 206, 250);
 rect(0, 0, width, height);
 //delay(6000);
 for (int i=0;i<bSize;i++) {
 balloon[i].update();
 }

 text("score:" +counter, 10,15);
 }

 class Balloon {
 float x=0;
 float y=0;
 float d=0;
 float a=0;
 int c=0;
 boolean popped=false;
 //int counter=0;

 public Balloon(float x, float y, float d, float a, int c) {
 this.x = x;
 this.y = y;
 this.d = d;
 this.a = a;
 this.c = c;
 }

 public void update() {
 stroke(10);
 ellipseMode(CENTER);
 fill(random(255), random(255), random(255));
 if (!popped)
 ellipse(x, y, 40, 50);
 y-=2;
 //if (popped = true);
 //score++;
 //fill(255);
 //text("score:" +score+" ",10,15);


 if ( mousePressed == true &&
 dist(x, y, mouseX, mouseY) < r && popped==false) {
 fill(135, 206, 250);
 popped=true;
 println("Hit");
 counter+=1;
 }

 if(popped==true)
 {
 //counter++;
 println(counter);
 } 

 //println("Time = " + timer);

 if (totalTime > start) {
 background(0);
 PFont font;
 font = loadFont("AngsanaNew-Bold-48.vlw");
 textFont(font);
 fill(255);
 text("Game over",100,40,50);
 }
 }

 }

