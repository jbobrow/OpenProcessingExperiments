
int patternSeperationX = 100;
int patternSeperationY = 100;
void setup(){
size(400,400);
 
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
fill(41,175,141,162); rect (0,0,50,50);
fill(411,15,161,62); rect (0,50,50,50);
fill(41,175,141,162); rect (50,50,50,50);
fill(411,15,161,62); rect (50,0,50,50);
fill(41,175,141,162); rect (100,100,50,50);
fill(411,15,161,62); rect (100,150,50,50);
fill(41,175,141,162); rect (150,150,50,50);
fill(411,15,161,62); rect (150,100,150,150);
fill(41,175,141,162); rect (200,200,50,50);
fill(411,15,161,62); rect (200,250,50,50);
fill(41,175,141,162); rect (250,250,50,50);
fill(411,15,161,62); rect (250,200,150,150);
}


