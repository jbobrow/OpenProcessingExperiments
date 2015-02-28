
PImage a;
PImage b;
PImage c;
PImage d;
PImage e;

Timer timer;

int teller;

int x = 100;

boolean horizontaal = false;
boolean verticaal = false;
boolean snelheidAan = true;

int snelheid = 1;

PImage[] animatie;

void setup(){
  size(400,400);
  animatie = new PImage[4];
  
  animatie[0] = loadImage("moonwalk1.png");
  animatie[1] = loadImage("moonwalk2.png");
  animatie[2] = loadImage("moonwalk5.png");
  animatie[3] = loadImage("moonwalk4.png");
  
  e = loadImage("stage.jpg");
//  a = loadImage("moonwalk1.png");
//  b = loadImage("moonwalk2.png");
//  c = loadImage("moonwalk5.png");
//  d = loadImage("moonwalk4.png");

  timer = new Timer(180);
  timer.start();
}

void draw(){
  image(e,0,0);                 //achtergrondafbeelding
  image(e,0,0,400,400);
 
  snelheid = 7/2;
  
  ellipseMode(CENTER);
  ellipse(x,190,30,30);  //hoofd
  
  stroke(255,0,0);           //lichaam
  strokeWeight(5);
  line(x-2,205,x-15,250);
  
  stroke(255,0,0);
  strokeWeight(3);          //arm naar hoed
  line(x-3,210,x+25,210);
  line(x+25,210,x+20,190);
  
  stroke(0);
  strokeWeight(7);       //de basislijn van de hoed
  line(x-15,170,x+20,190);
  
  stroke(0);
  strokeWeight(20);        //gedeelte op de hoed
  line(x,170,x+13,177);
  
  stroke(255,255,255);  //het lintje op de hoed als detail
  strokeWeight(0);
  line(x-9,169,x+16,183);
  
   image(animatie[teller],x-95,250);
   
     if (timer.isFinished()) {
      teller = teller + 1;
  if (teller > 3){
    teller = 0;
  }
  println(teller);
  
    timer.start();
  }
  
  
 
  
  if(x > 400) {
    horizontaal = !horizontaal;
  }
  
  if( x < 0) {
    horizontaal = !horizontaal;
  }
  
  if(horizontaal == true){
    x = x + snelheid; }
    else{x = x-snelheid;}
    
}
 
 



