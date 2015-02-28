
void setup(){
size(400,400);
smooth();  
PImage b;
b = loadImage("StandingOnOneLeg_02.jpg");
image(b, 0, 0);


PFont font;
textSize(30);
font = loadFont("GiddyupStd-48.vlw"); 
textFont(font, 32); 
textSize(60);
text("Hellooooo", 200, 100);//can also put weigh and height;



stroke(255,120);
translate(66,33);

for( int i=0; i<20;i++){
strokeWeight(i);
rotate(PI/12);
line(0,0,55,0);
}
}



void draw(){

if (mousePressed) {
  for( int i=0; i<20;i++){
strokeWeight(i);
rotate(PI/12);
line(mouseX,mouseY,55,0);
}
}
}

