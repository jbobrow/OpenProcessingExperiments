
   
//lluis hernandez


float r; 
float g;
float b;
float a;
  
float diam;
float x = 280;   
float y = 90;
float speed = 1;
float gravity = 0.1;
 
 
void setup() {
size(560,400);
noStroke();
}
 
 
int value = RGB;
 
 
void draw() {

   

smooth() ;
size(560,400);
 

noStroke();
fill(250);
rect(0,0,600,400);
 

stroke(50);
strokeWeight(35);
fill(70);
quad(-100,310,600,200,600,700,-100,600);
 

noStroke();
fill(40,46,18,80);
ellipse(800,100,45,35);
noStroke();
fill(23,90,18);
ellipse(150,20,25,25);
 

noStroke();
fill(5,170,255,150);
ellipse(115,180,35,35);
noStroke();
fill(5,157,255);
ellipse(125,180,30,30);
 

noStroke();
fill(175,12,23,80);
ellipse(150,300,45,45);
noStroke();
fill(175,12,23,90);
ellipse(150,300,20,20);
 


 

fill(199,146,46,50);
ellipse(450, 350, 85, 88);
fill(179,82,50,150);
ellipse(500, 351, 50, 53);
 

fill(50,40,31,180);
ellipse(430, 210, 60, 63);
fill(174,40,31,170);
ellipse(430, 210, 48, 53);
 

fill(55,56,58,200);
ellipse(500, 100, 100, 50);
fill(55,56,58);
ellipse(500, 150, 40, 40);
 

    
  fill(r,g,b,a);
   

   
  fill(value);
  ellipse(x,y,200,315);
  y = y + speed;
  speed = speed + gravity;
  if (y > height) {
    speed = speed * -0.95;
     
  }
}
 
void mouseClicked() {
  if(value == 0) {
    value = 255;
  } else {
    value = 0;
  }
}
 
void mouseDragged()
{
  value = value + 5;
  if (value > 255) {
    value = 0;
     
  }
}
 
void keyPressed() {
  if (value == 0) {
    value = 30;
  } else {
    value = 0;
  }
}

