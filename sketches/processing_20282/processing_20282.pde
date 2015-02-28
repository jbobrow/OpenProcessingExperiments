
void setup (){
  size(800,500);
  background(255);
  smooth();
  rectMode(CORNERS);

}

int k = 700;
int c = 0;
int r = 0;
int Size = 0;
int wheelSize = 0;

// Colors
color Red = color(255,0,0);
color Green = color(0,255,0);
color Blue = color(0,0,255);

void draw(){
background(255); 

fill(0);

beginShape();
vertex(784,288);
vertex(784,323);
vertex(10,323);
vertex(10,231);
vertex(93,231);
vertex(131,171);
vertex(212,171);
vertex(212,288);
vertex(784,288);
endShape();

fill(c);

//Truck bed
beginShape();
vertex(229,171+Size);
vertex(229,323+Size);
vertex(784,323);
vertex(784,171);
vertex(229,171+Size);
endShape();

fill(255);
noStroke();

rect(0,323,800,500);

stroke(3);
fill(0,0,255);
strokeWeight(3);
triangle(93,231,129,231,129,174);
rect(130,173,187,231);

for(int x = 50; x < 800; x+= k){
fill(85);

ellipse(x,311,75+wheelSize,75+wheelSize);
fill(0);
ellipse(x,311,50+wheelSize,50+wheelSize);
fill(222,161,38);
ellipse(x,311,40+wheelSize,40+wheelSize);



}
}
void keyPressed() {
  
// Number of Tires  
  if(key == '2'){
   k=700;
} 

else if(key == '3'){
    k=300;
}
else if(key == '4'){
   k=200;
}    
else if(key == '5'){
   k=150;
}
else if(key == '6'){
   k=125;
}   
else if(key == '7'){
   k=115;
}
else if(key == '8'){
   k=100;
}


//Color of Truck
if(key == 'r'){
   c=Red;
}
else if(key == 'g'){
   c=Green;
}
else if(key == 'b'){
   c=Blue;   
}  

// Truck Bed Rise/Fall
if( keyCode == UP){
    Size+= 10;
  }
 else if( keyCode == DOWN){
    Size-= 10;
  }  

// Wheel Size
if (keyCode == RIGHT){
  wheelSize++;
}
 else if (keyCode == LEFT){
  wheelSize--;
 }  
} 

