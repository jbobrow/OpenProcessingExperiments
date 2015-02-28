


ArrayList myCars; 
float frogX; 
float frogY; 



void setup() {
size (500,500); 
ellipseMode(CENTER); 
frogX = width/2; 
frogY = height-50; 




myCars = new ArrayList(); 



for (int i = 0; i <20; i++) { 
myCars.add(new Car()); 
}
}
void draw () {
background (#074289);


for (int i = 0; i < myCars.size(); i++) { 
Car car = (Car) myCars.get(i);   
  car.display(); 
  car.drive(); 

PVector frogLoc = new PVector(frogX, frogY); 
float d = (car.loc).dist(frogLoc); 
  if (d < 30){
    println ("Found the center!"); 
    car.alive = false; 
  }
} 
  for (int i = 0; i < myCars.size(); i++) { 
  Car car = (Car) myCars.get(i); 
  // check if car is alive// 
  if (car.alive==false){
  myCars.remove(i); 
  }

}  
  

fill (#F6FF05); 
text ("Press the arrow keys to play!", 30, 50); 
text ("Line up the green dots with the black dots.", 30,75); 

fill (0,255,0); 
ellipse (frogX, frogY, 20, 20); 

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

class Car{ 

 PVector loc; 
 PVector vel; 
 color myColor; 
 boolean alive; 
 Car (){ 
   
   loc = new PVector(random(width), random(height)); 
   vel = new PVector(random(-5, 5), 0); 
   myColor = color(#FF0544); 
   alive = true; 
 }
 
 
void display() { 
noStroke(); 
    fill (#030000); 
    ellipse (loc.x, loc.y, 20, 20);   
fill (myColor, random (300)); 
ellipse (loc.x, loc.y, random (250), random (150)); 
ellipse (loc.x, loc.y, random (250), random (150)); 
ellipse (loc.x, loc.y, random (250), random (150)); 
ellipse (loc.x, loc.y, random (250), random (150));  

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
 





