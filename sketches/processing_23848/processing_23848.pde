
int num = 50; 
int[] x = new int[num]; 
int[] y = new int[num];

void setup() { 
  size(350, 350); 
  smooth(); 
  noStroke(); 
  ellipseMode(RADIUS);
  
  
}

void draw() { 
  

    PImage img;
  img = loadImage("brush.gif"); 
  image(img, 0, 0);
  
  fill(0, 12); 
  rect(0, 0, width, height); 
  fill(255);
 

for (int i = num-1; i > 0; i--) {
x[i] = x[i-1];
y[i] = y[i-1];
}

x[0] = mouseX; 
y[0] = mouseY; 
for (int i = 0; i < num; i++) {
ellipse(x[i], y[i], i/2.0, i/2.0);
}


if (mousePressed == true) {
  noLoop();
	
}
}

