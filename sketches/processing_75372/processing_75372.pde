
float xPosition;
float yPosition;
float xSpeed= 4;
int dir =1;

void setup(){
  size(400,600);
  frameRate(20);
  background(0);
  yPosition = height/2;
  smooth();

}

void draw(){
  background(0);
  noStroke();
  //moon
  fill(255);
  ellipse(width/2, height/2, 200, 200);
  //stars
  fill(random(0,255));
  ellipse(50, 45, 5, 5);
  
   fill(random(0,255));
  ellipse(375, 60, 5, 5);
  
   fill(random(0,255));
  ellipse(200, 125, 5, 5);
  
  fill(random(0,255));
  ellipse(100, 470, 5, 5);
  
  fill(random(0,255));
  ellipse(300, 550, 5, 5);  
  
  //moon shadows
  fill(225);
  ellipse(170,300,50,50);

   fill(255);
  ellipse(180,300,50,50); 
 
   fill(225);
  ellipse(220,255,30,30);

   fill(255);
  ellipse(230,255,30,30); 
  
    fill(225);
  ellipse(240,355,20,20);

   fill(255);
  ellipse(245,355,20,20); 
 
 //moon moving shadow 
  fill(0);
  ellipse(xPosition, yPosition, 200, 200);
 
  if(xPosition>width || xPosition <0){ // && : and, || or
   dir = dir *-1;
  }
   xPosition= xPosition+ (xSpeed*dir);
}
