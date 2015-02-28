
void setup() {
size(300,300);
noStroke();
}
void draw() {
int randomPos= int(random(300.0));
int randomFill= int(random(255.0));
int randomFill1= int(random(255.0));
int randomFill2= int(random(255.0));
int randomPos2= int(random(300.0));
fill(randomFill, randomFill1, randomFill2);
noStroke();
rect(randomPos,randomPos2,50,50);
}
