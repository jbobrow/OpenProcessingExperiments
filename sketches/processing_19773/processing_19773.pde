
float x;
float angle = 0.0; 
void setup(){
size(250, 250);
background(0);
smooth();

}
void draw(){
 noStroke();
fill(10, 15); 
rect(0, 0, 250, 250); 
fill(255); 
x= x+4.0;
translate (x, 20);
angle = angle + 0.4; 
translate(150, 100); 
rotate(angle); 
fill(#00DBFF);
rect(50, 50, random(250), random(200)); 
if (x>250);{
  x=-50;
}
}



