
PImage table;
PImage lacewing1;
PImage lacewing2;
PImage lacewing3;
PImage motar;

 
float orbitDuration = 2*1000; // 1.5 second orbit
float orbitRad = 75; // Radius 50px
float xPos;
float yPos;

float a=0;

void setup() {
  size(1000,409);
  table = loadImage("table2.png");
  lacewing1 = loadImage("lacewing.png");
  lacewing2 = loadImage("lacewing2.png");
  lacewing3 = loadImage("lacewing3.png");
  ellipseMode(CENTER);
  motar = loadImage("motar.png");

   smooth();
  noStroke();
}
  
void draw() {
  image(table,0,0);  
  image(motar,mouseX,mouseY);

translate((width/2.2),height/2); // centers in window
  
  float ang = TWO_PI * millis() /orbitDuration; //equation for orbit
  float x = cos(ang)*orbitRad;
  float y = sin(ang)*orbitRad;
  float xPos = sin(ang)*orbitRad;
  float yPos = cos(ang)*orbitRad;
 
if (keyPressed) { //one the outermost circle will show first and then the rest if mouse is pressed
  if (key == 'r');
//lacewing one
 image(lacewing1,xPos*.2,yPos*.2); //size of orbiting circle
 
//lacewing two
 image(lacewing2,yPos*1,xPos*1); //size of orbiting circle
  
 //lacewing three
 image(lacewing3,xPos*2,yPos*2); //size of orbiting circle
 
 
} 
  
if(mousePressed){a=a+0.01;
}
translate(45,0);
noStroke();
for(int i=0;i<200;i=i+9)
{fill(209,48,150,25);rotate(a);rect(0,0,i,i);
}

}








