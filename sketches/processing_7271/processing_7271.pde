
PFont fontA;
float ay;
float by;
PVector location;
PVector velocity;
PVector acceleration;
float e=10;
int ec=100;
String message="GAME OVER";
String countt=" "+0;
boolean click=false;
int count=0;
String[] kinglear;
int counter = 145;
String delimiters = ".?!;:[]";
int total;

void setup(){
  size(500,250);
  location=new PVector(50,100);
  velocity=new PVector(random(1,3),random(1,3));
  acceleration=new PVector(.1,.1);
  fontA = loadFont("Haettenschweiler-48.vlw");
  textFont(fontA, 16);
  String url = "http://www.gutenberg.org/dirs/etext97/1ws3310.txt";
  String[] rawtext = loadStrings(url);
  String everything = join(rawtext, "" );
  kinglear = splitTokens(everything,delimiters);
  total=kinglear.length;
  smooth();
}
void draw(){
  fill(200);
  text("game",250,50);
  ay=mouseY;
  by=mouseY;
  background(100);
  location.add(velocity);
  fill(200);
  stroke(0);
  text(""+total,210,20);
  text("/  "+countt,250,20);
  String theword = kinglear[counter];
  textSize(20);
  textAlign(LEFT);
  text(theword,30,50);
  fill(ec);
  rect(0,ay,20,100);
  rect(480,by,20,100);
  ellipse(location.x,location.y,e,e);
  countt=" "+count;
  if((location.x>475-(e/2)&&location.y>by&&location.y<by+100)
    ||(location.x<25+(e/2)&&location.y>ay&&location.y<ay+100) // uncomment me to see the problem!
  ){
    velocity.x=velocity.x*-1;
    velocity.y=velocity.y*-1;
    velocity.add(acceleration);
    counter = (counter + 1) % kinglear.length;
    count();
  }
  if(location.y>height-5||location.y<5){
    velocity.y=velocity.y*-1;
  }
  if(location.x<-e||location.x>(500+e)||location.y<0||location.y>(250+e)){
    fill(200);
    textSize(32);
    text("GAME OVER",250,75);
    delay(5000);
    location.x=width/2;
    location.y=height/2;
    count=0;
  }
}
void mousePressed(){
  click=!click;
  if(click){
    loop();
  } 
  else {
    noLoop();
    fill(200);
    text("PAUSE",50,250);
  }
} 
void count(){
  count=count+1;
}





















