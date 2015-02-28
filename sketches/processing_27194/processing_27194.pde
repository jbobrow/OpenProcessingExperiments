

int x[] = new int[50];
int y[] = new int[50];
PImage fireworks;

void setup() {
  fireworks=loadImage("fireworks.jpg");
size(500, 450);
smooth();
}


void draw() {
 background(0);
image(fireworks,0,0);



for (int i = x.length-1; i > 0; i--) {
x[i] = x[i-1];
y[i] = y[i-1];
}
x[0] = mouseX;
y[0] = mouseY;
for (int i = 0; i < x.length; i++) {
  noStroke();
  
if(mousePressed == true) { 
    fill(0 ,random(100,150), random(150,255) ,i * 4);
  }
  else {
    fill(random (150,255) ,random(100,150), 0 ,i * 4);
  }

ellipse(x[i], y[i], random (40,70) , random (40,70));

}

for (int j=0; j<width; j+=10) {
for(int k=0; k<height; k+=10){
  noFill();
  strokeWeight (1);
  stroke(200,180,0,50);
  ellipse(j,k,10,10);
}
}

}



