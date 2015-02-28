
void setup() {
  size(500, 500);
  frameRate(20);
}
 
void draw() {
int xPosition;
int yPosition;
int ellipse1;
int ellipse2;
float rect1;
float rect2;

int ellipse1x;
int ellipse2x;
float rect1x;
float rect2x;

 
xPosition = round( random(350, 400) );
yPosition = round( random(220, 250) );
ellipse1 = round( random(150) );
ellipse2= round( random(100) );
rect1 = random(100);
rect2 = random (200);

ellipse1x = round( random(200) );
ellipse2x = round( random(100) );
rect1x = random(100);
rect2x = random(200);


 
noStroke();
fill(0, 255, 255, 100);
ellipse(xPosition, yPosition, ellipse1x, ellipse1);
 
fill(255, 255, 0, 100);
ellipse(xPosition, ellipse1+yPosition, ellipse1x, ellipse2);



noStroke();
fill(#C6B6B6);
rect(xPosition,yPosition,10,40);

fill(#C67070);
rect(xPosition,yPosition,30,30);

//hey static?
noStroke();
fill(#C67070);
rect(0,0,30,30);

fill(#C6B6B6);
rect(10,30,10,40);


fill(#F1F58D);
rect(0,400,10,40);

fill(#F1F58D);
rect(10,400,10,40);

fill(#F1F58D);
rect(25,400,10,40);


fill(#FFFFFF);
rect(70,410,100,20);


}








