
boolean txt = false;

PFont f;
Blob[] blob = new Blob[9];
String[] name = {
"China:",
"India:",
"United States:",
"Indonesia:",
"Brazil:",
"Pakistan:",
"UK:",
"Nigeria:",
"Australia:",

};

 
int[] population = {
1330044544  ,
1147995904  ,
303824640   ,
237512352   ,
196342592   ,
172800048   ,
62300000   ,
146255312   ,
22700000   ,

};

PImage world;
 
void setup(){
  size(800,476);
  background(100);
  f = loadFont ("MicrosoftNewTaiLue-Bold-48.vlw");
  world = loadImage("map.png");
  smooth();
  for(int i=0; i<9; i++){
    int id = i;
    String n = name[i];
    int pop = population[i];
    color c = color(random(255),random(255),random(255));
    blob[i] = new Blob((pop/10000000),(pop/10000000),c, n, id, pop);
  }
}
 
void draw(){
  image(world,0,0);
  
 for(int i=0; i<9; i++){
   blob[i].check();
   blob[i].info();
   
    blob[i].render();
    
  } 
 
}

class Blob{
 float x;
 float y;
 float startW = 50;
 float startH = 50;
 float w;
 float h;
 color c;
 String n;
 int id;
 int p;
 
 public Blob( float w, float h, color c, String n, int id, int p) {
 
  
  this.w = w;
  this.h = h;
  this.c = c;
  this.n = n;
  this.id = id;
  this.p = p;
 
    if(id == 0){
    x=600;
    y=220;
  }
  if(id == 1){
    x=560;
    y=250;
  }
  if(id == 2){
    x=160;
    y=200;
  }
  if(id == 3){
    x=650;
    y=300;
  }
  if(id == 4){
    x=270;
    y=330;
  }
  if(id == 5){
    x=530;
    y=230;
  }
  if(id == 6){
    x=370;
    y=160;
  }
  if(id == 7){
    x=400;
    y=285;
  }
  if(id == 8){
    x=700;
    y=360;
  }
  
 }
 void check(){
   float disX = x - mouseX;
   float disY = y - mouseY;
   if (sqrt(sq(disX) + sq(disY)) < 50/2){
    startW = w;
    startH = h;
    txt = true;
   }else if(mousePressed){
     startW = w;
    startH = h;
    txt = false;
   } else {
     startW = 50;
     startH = 50;
     txt = false;
   }
   
 }
 void info(){
   if(txt == true){
   textFont(f, 20);
   fill(0);
   text(n, 30, 410);
   text(p,30, 440);
   }else {
     textFont(f, 15);
   fill(0);
     text("Hover over the circles to reveal the population of the countries. Press the mousebutton to compare the  sizes.", 30, 470);
   }
 }
 void render() {
  noStroke();
 fill(c); 
 ellipse(x,y,startW,startH);
 }
}

 

