
int startPnt = 0;   
int myR = 200; 
int myG = 0;
int myB = 230;

void setup(){   
  
  size(500,500);    
  background(255);   
}


void draw() {   

myR--;    
myG++;
myB--;

if (myG > 255) {
   myR = 200; 
   myG = 0;
   myB = 230;
}
  

myrect();  


startPnt ++;  

if (startPnt > width) {
  startPnt = 0;
}
  
}


void myrect(){  
  
fill(myR,myG,myB);   

noStroke();
// rect (x, y, w, h)
pushMatrix();
float myY = random(height);
rect(-30,myY,startPnt+150,35);
rect(0,myY,startPnt-340,2);
translate (50,50);
rect(0,myY,startPnt-150,20);
rect(0,myY,startPnt+20.5,10);
rect(0,myY,startPnt-500.5,5);
popMatrix();
}
