
MyGlitter[] bugs = new MyGlitter[100];

void setup() {
  size(1200, 600);

  for (int i = 0; i < bugs.length; i++) {
    bugs[i] = new MyGlitter(i);
    
  }
}

void draw() {
  background(0);

  for (int i = 0; i < bugs.length; i++) {     
     bugs[i].display();
   } 
 } 

class MyGlitter {   

float xpos;   
float ypos;   
int bugWidth;   
int bugHeight;   
int index;
int shape;
color bColor;   
int internalCounter = 0;
boolean active;
int limit = 10;
float speed = 0.1;
int cycles = 0;
float nextXPos;

MyGlitter(int i) {
 index = i;
 xpos = random(5) + index*13;
 ypos = 0;
 bColor = color(index+60,index+60,index+60);
 bugWidth = 12;
 bugHeight = 12;
 speed = i/2.5;
 shape = int(random(3));
}   

void display() {     
   fill(bColor); 
   //bColor = color(index*2+random(75),index*2+random(75),index*2+random(75));
 
   switch(shape)
    {
      case 1:
        ellipse(xpos,ypos,bugWidth,bugHeight);
      break;
      case 2:
        rect(xpos,ypos,bugWidth,bugHeight);
      break;
      default: 
      break;
    }
    ypos = ypos + speed + 1;
    if (ypos > 600)
      ypos = 0;
   
   internalCounter = internalCounter+1;
   if (internalCounter == limit-1) {   
     shape = int(random(3));
     if(index == 0)
       println(shape);
     internalCounter = 0;
   }
   
   cycles = cycles+1;
   if (cycles % 14 == 0) {
     speed = speed*-1;
     nextXPos = random(600);
   }
   else {
     xpos = nextXPos;
   }

}   

}




