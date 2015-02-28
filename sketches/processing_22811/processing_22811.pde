
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
fill(37,137,43,30);
ellipse(0,0,250,250);
} 

