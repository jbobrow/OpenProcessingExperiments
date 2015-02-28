

/* @pjs font="DawningofaNewday.ttf, Satisfy-Regular.ttf, IstokWeb-Bold.ttf, BadScript-Regular.ttf"; */


ArrayList myThoughts; 
float frogX; 
float frogY; 
PFont bad;
PFont dawn;
PFont sat;
PFont is; 

void setup() {
size (500,500); 
ellipseMode(CENTER); 
bad=loadFont ("BadScript-Regular.ttf");
dawn = loadFont ("DawningofaNewday.ttf"); 
sat = loadFont ("Satisfy-Regular.ttf");
is = loadFont ("IstokWeb-Bold.ttf"); 
frogX = width/2; 
frogY = height-50; 




myThoughts = new ArrayList(); 



for (int i = 0; i <20; i++) { 
myThoughts.add(new Thoughts()); 
}
}
void draw () {
background (#074289);


for (int i = 0; i < myThoughts.size(); i++) { 
Thoughts Thoughts = (Thoughts) myThoughts.get(i);   
  Thoughts.display(); 
  Thoughts.drive(); 

PVector frogLoc = new PVector(frogX, frogY); 
float d = (Thoughts.loc).dist(frogLoc); 
  if (d < 80){
    Thoughts.alive = false; 
  }
} 
  for (int i = 0; i < myThoughts.size(); i++) { 
  Thoughts Thoughts = (Thoughts) myThoughts.get(i); 
  if (Thoughts.alive==false){
  myThoughts.remove(i); 
  }

}  
  

fill (#F6FF03); 
textFont (is, 16); 
text ("Click, then press the arrow keys to erase negative thoughts!", 26, 30); 
stroke (#000000); 
fill (#074289); 
ellipse (frogX, frogY, 50, 50); 

}


void keyPressed(){ 
  println ("key presssed = " + keyCode);  
if (keyCode==39){   
   frogX=frogX + 20; 
}
if (keyCode==38){ 
  frogY=frogY - 20;
}

if (keyCode==40){ 
  frogY=frogY + 20;
}
if (keyCode==37){ 
  frogX=frogX - 20; 
}
if (frogX>width){ 
  frogX = 0; 
} 
if (frogY>height){ 
  frogY = 0; 
}
}


class Thoughts{ 

 PVector loc; 
 PVector vel; 
 color myColor; 
 boolean alive; 
 Thoughts (){ 
   
   loc = new PVector(random(width), random(height)); 
   vel = new PVector(random(-5, 5), 0); 
   myColor = color(random (255), random (255), random (255), 200); 
   alive = true; 
 }
 
 
void display() { 
noStroke(); 
     
fill (myColor); 
textFont (bad, 40);  
text ("I can't!", loc.x, loc.y); 
textFont (dawn, 25); 
text ("I'm dumb.", loc.x, loc.y+35); 
textFont (sat, 35); 
text ("I suck.", loc.x, loc.y+80); 
textFont (dawn, 25); 
text ("My ideas are silly.", loc.x, loc.y+115); 
textFont (bad, 40); 
text ("Why even try?", loc.x, loc.y+160); 
}

void drive (){ 

 
 loc.add(vel);
 
  if (loc.x> width){
  loc.x=0; 
}

if (loc.y>height){ 
  loc.y = 0; 
}

} 
} 
 





