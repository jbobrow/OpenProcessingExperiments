
int patternSeperationX = 90;
int patternSeperationY = 90;
void setup(){
size(450,450);

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
strokeWeight(1);
fill(14,89,149,50);
ellipse(450,450,900,900);

line(0,0,50,50);
line(0,50,50,0);
line(25,75,0,50);
line(50,50,25,75);
line(0,0,450,450);
}

