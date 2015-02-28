
float posX, posY;
float spreadMin = 5;
float spread = spreadMin;
float spreadMax = 25;


void setup(){
size(250,250);
background (19,63,85);
}

void draw(){
if(mousePressed){
posX = mouseX;
posY = mouseY;
for (int i=0; i<10; i++){
noFill();
ellipse(posX,posY, 40,40);
ellipse(posX,posY, 22,22);
ellipse(posX,posY, 15,15);
ellipse(posX,posY, 10,10);
posX += random(0) - random (1);
stroke(255,10);
}
if(spread<spreadMax){
spread--;
println(spread);
}
} else if (!mousePressed){
spread=spreadMin;
}
}

void keyPressed(){
if(key=='s'){
saveFrame("ex2_smooth.png");
}
} 

