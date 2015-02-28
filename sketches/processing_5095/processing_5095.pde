
//basis
int x = 0;
int y = 0; 
int speed = 2; 
void setup() { 
size(400,400); 
smooth(); 
} 

//tekenen 
void draw() { 
background(140); 
y = y + speed; 
x = x + speed;
if ((x > height) || (x < 0)) 
if ((y > height) || (y < 0)) { 
speed = speed * -1; 


} 
//vierkanten
fill(255);
rect(100,100,100,100);
rect(200,200,100,100);
rect(0,0,100,100);
rect(300,300,100,100);

//kleine dichte cirkels
ellipse(300,100,100,100);
ellipse(100,300,100,100);

//grote doorzichtige cirkels
stroke(255); 
noFill(); 
ellipse(x,y,300,300); 

stroke(255); 
noFill(); 
ellipse(x,100,320,320); 

stroke(1); 
noFill(); 
ellipse(100,y,300,300);

//kleine doorzichtige cirkels

stroke(255); 
noFill(); 
ellipse(300,y,200,200); 
 
 
stroke(1); 
noFill(); 
ellipse(x,y,140,140); 


}



