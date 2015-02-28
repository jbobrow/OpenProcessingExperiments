
class Invader {
 
float x;
float y;
float gravity= .4;
   
float ySpeed;
float xSpeed;
 
void prime(float a, float b) {
x=a;
y=b;
ySpeed = random(1, 8);
xSpeed = 2;
}
 
void animate() {
    
fill(0);
smooth();
noStroke(); 
rect(x+75,y+50,100,20); //top rect
rect(x+50,y+70,150,30); // row 2 rect
rect(x+30,y+100,190,60); //row 3 rect
rect(x+90,y+160,30,20); //rect 1 left
rect(x+60,y+180,30,20); //rect 2 left
rect(x+30,y+200,30,20); //rect 3 left
rect(x+130,y+160,30,20); //rect 1 right
rect(x+160,y+180,30,20); //rect 2 right
rect(x+190,y+200,30,20); //rect 3 right
 
fill(255); //white color
rect(x+75,y+100,30,30); //square eyeball left
rect(x+135,y+100,30,30); //square eyeball right
}
 
 
 
void move(){
     
if (mousePressed) {
     
if(y<=0 || y>=height-100) {
ySpeed= ySpeed *-1;
xSpeed= xSpeed *-1;
       
}
    
y = y + ySpeed;
ySpeed = ySpeed + gravity;
      
x = x + xSpeed;
xSpeed = xSpeed + gravity;
     
}
}
}
