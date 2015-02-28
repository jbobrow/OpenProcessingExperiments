
int circleSize = 0;
int circleX = 100;
int circleY = 100;

void setup (){
  size(300,300);
}

void draw(){


background(255);

stroke(0);
fill(255,0,0);
rect(50,50,  50,50);
noFill();
rect(100,50, 50,50);
noFill();
rect(50,100, 50,50);
fill(255,200,200);  
rect(100,100, 50,50);


fill(255,0,0);
rect(150,50,  50,50);
noFill();
rect(200,50, 50,50);
noFill();
rect(150,100, 50,50);
fill(255,200,200);  
rect(200,100, 50,50);

stroke(0);
fill(255,0,0);
rect(150,150,  50,50);
noFill();
rect(200,150, 50,50);
noFill();
rect(150,200, 50,50);
fill(255,200,200);  
rect(200,200, 50,50);


stroke(0);
fill(255,0,0);
rect(50,150,  50,50);
noFill();
rect(100,150, 50,50);
noFill();
rect(50,200, 50,50);
fill(255,200,200);  
rect(100,200, 50,50);

smooth();
noStroke();

ellipse(circleX, circleY, 50, 50);

circleX = circleX + 5 -4 ;

}






