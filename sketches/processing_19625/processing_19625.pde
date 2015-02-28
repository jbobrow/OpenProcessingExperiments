
float angle=0.0;

void setup(){
size (250,250);
background(250,80);
smooth();
PFont font;
font = loadFont ("CenturyGothic-Bold-48.vlw");
textFont(font);
}

void draw(){
}

void mouseClicked(){
angle = random(0,360); // rate of rotation 
rotate(angle);	// rotate shape at angle value
textSize(random(10,70));
fill(random(10,255),random(20,50),200);
text("M2H 3J3",mouseX,mouseY);
  
}


