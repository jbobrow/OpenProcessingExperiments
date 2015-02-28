

void setup() {
 
  size(400,600);
      
}
 
void draw () {
 




size(400, 400);
background (255);


// Declare variable 

float rect1;
float rect2;
float xPosition;
float el1;
float rect3;

rect1 = 87;
rect2 = 20;
rect3 = 150;
xPosition = 199;
el1 = 100;

rect1 = random(20,90);
rect2 = random(40,300); 
rect3 = random(50,200);
el1 = random(100,400);

rectMode(CENTER);
fill(0);
rect(200, rect3+100, 30, rect3);
fill(0);
strokeWeight(2);
ellipse(200, 200, el1, 100);
fill(250);
ellipse(180, 200, 30, 50);
fill(250);
ellipse(220, 200, 30, 50);
fill(250);
rect (xPosition, rect1+100, 80, rect2);
fill(0,0,0,10);

}



