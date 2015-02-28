
void setup(){
size (400,400);
background(245, 255, 250);
}

void draw(){
  frameRate (100);
blueBubble ();
}


void blueBubble (){
for(int i=0; i<400; i=i+1) {
noStroke();
float r = random(400);
float l = random(150,250);
float m = random(190, 255);
float n = random(200,300);

fill(l,m,255, 90);
ellipse(i, n, n, i);
}
}


