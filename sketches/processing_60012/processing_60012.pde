
void setup() {
size(400,400);
smooth();
background(#FFE308);}

void draw() {

if(mousePressed){
noStroke();
fill(255,100,0,5);
ellipse(width/2, height/2, random(800), random(800));

}else{
stroke(#FF855D);
noFill();
ellipse(width/2, height/2,mouseX,mouseY);}
}

