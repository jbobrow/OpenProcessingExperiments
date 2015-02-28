
int patternSeperationX = 65;
int patternSeperationY = 65;
void setup(){
size(450,450);
background(255);
smooth();
 
for(int i = 0; i < width/patternSeperationX; i++){
for(int j = 0; j < height/patternSeperationY; j++){
pushMatrix();
translate(i*patternSeperationX, j*patternSeperationY);
yourFunction();
popMatrix();
}
}
 
}
void draw()
{
 
}
void yourFunction(){
  noFill();

arc(50, 55, 50, 50, 0, PI/2);
noFill();
arc(50, 55, 60, 60, PI/2, PI);
arc(50, 55, 70, 70, PI, TWO_PI-PI/2);
arc(50, 55, 80, 80, TWO_PI-PI/2, TWO_PI);

arc(55, 50, 50, 50, 0, PI/2);
noFill();
arc(55, 50, 60, 60, PI/2, PI);
arc(55, 50, 70, 70, PI, TWO_PI-PI/2);
arc(55, 50, 80, 80, TWO_PI-PI/2, TWO_PI);

arc(60, 50, 50, 50, 0, PI/2);
noFill();
arc(60, 50, 60, 60, PI/2, PI);
arc(60, 50, 70, 70, PI, TWO_PI-PI/2);
arc(60, 50, 80, 80, TWO_PI-PI/2, TWO_PI);



fill(237,83,41,30);
ellipse(55,55,45,45);
fill(237,83,41,50);
ellipse(60,50,45,45);
fill(237,83,41,90);
ellipse(65,45,45,45);

}

