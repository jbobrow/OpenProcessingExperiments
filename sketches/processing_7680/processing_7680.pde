
int[] xpos = new int[50];
int[] ypos = new int[50];

void setup()  {
 size(200,200);
 smooth();

// initialize
for (int i = 0; i < xpos.length; i++)   {

 }
}

void draw() {
background(255);
fill(100);
rect(0,0,100,100);
rect(0,100,100,100);
fill(100);


// shift array values
for (int i = 0; i < xpos.length-1; i++)   {
 xpos[i] = xpos[i+1];
 ypos[i] = ypos[i+1];
}

// new location
xpos[xpos.length-1] = mouseX;
ypos[ypos.length-1] = mouseY;

// draw
for (int i = 0; i < xpos.length; i++)   {
 noStroke();
 fill(255-i*5);
ellipse(xpos[i],ypos[i],i,i);
}
}

