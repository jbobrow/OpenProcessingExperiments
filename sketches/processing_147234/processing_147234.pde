
/*Car myCar1; 
Car myCar2; 
//Word myWord1; 
*/

int amt = 50; 
Car[] myCars = new Car [amt] ; //an array is square brackets

void setup () {
size (500,500); 
//myCar1 = new Car(); 
//myCar2 = new Car (); 
for (int i = 0; i < amt; i++) { 
myCars [i] = new Car (); 
}

}

void draw (){
background (random(255));


/*myCar1.display() ; 
myCar1.drive(); 
println(myCar1.x); //print out x location
myCar2.display() ; 
myCar2.drive(); 
*/

for (int i = 0; i < amt; i++) { 
myCars[i].display(); 
myCars[i].drive(); 

}


}

class Car{ 
 // beginning and ending curly bracket contains everything in the class file 
 
 //attribute 
float x ; // could be an int...
 float y; 
 float v; 
 color myColor; 
 //constructor - has to fill all the attributes 
 Car (){ 
   x = random(width); //every car you instantiate has its own x position - all at 0 now
   y = random (height); 
   v = random (1, 5); 
   myColor = color(random (255), random (255), random (255)); 
 }
 
 //methods 
void display() { 

fill (myColor, random (300)); 
ellipse (x, y, random (100), random (50)); 
}

void drive (){ 
  x=x+v; 
  if (x>width){ 
    x = 0; 
  }
    y=y+3; 
  if (y>height){ 
    y = 0; 
  }
} 
 
 }


