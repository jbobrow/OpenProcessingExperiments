
void setup ()               
{
    size( 800, 600 );   
    background (random(255), random(255), random(255));
}   
void draw() {

noStroke();

if(mousePressed){
 background(random(255), random(255),(145));
}
int x=mouseX;
int y=mouseY;
smooth();
ellipse(x,y,random(3000),random(800));
// 75% opacity.
fill(random(255),random(255),54,random(12
));



}

