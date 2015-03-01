
import netscape.javascript.*;

color c = color(0);
float x = 0;
float y = 100;
float speed = 1;

int value=0;
int temp = 350;




void setup() {
  size(300,400, P2D);

}

void draw() {
  background(125);
  fill(51,149,75);
  rect(120,temp,10,10);
  fill(59,51,149);
  rect(0,160,300,10);
  move();
  display();
}

void move() {
  x = x + speed;
  if (x > width) {
    x = 0;
  }
}

void mouseClicked(){
  if(value==0){
    value = 125;
    translate(0,15);
  }
  else{
    value = 0; 
  }
  temp = temp -50;
  
  
}


void display() {
  fill(c);  
  
  fill(71,109,25);
  rect(x,y,30,20);
  translate(60,60);
  
  fill(51,149,75);
  rect(x,y,30,10);
  translate(50,50);
  
  fill(121,49,115);
  rect(x,y,40,20);
  translate(25,45);
  
  fill(61,89,75);
  rect(x-150,y,30,20);
  translate(40,40);
  
  fill(101,19,75);
  rect(x,y,40,20);
  translate(15,15);
  
  fill(31,109,75);
  rect(x-100,y,30,20);
  translate(10,10);
  
  fill(71,69,75);
  rect(x,y-200,30,20);
  translate(10,10);
  
  fill(51,89,75);
  rect(x,y-100,30,20);
  translate(10,10);

}



