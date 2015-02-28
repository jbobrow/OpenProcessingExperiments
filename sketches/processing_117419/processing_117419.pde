
float yoff = 0.0; // 2nd dimension of perlin noise
float xoff1 = 0.0;
float xincrement = 0.01;
int count = 0;


void setup() {
size(640, 400);
}

void draw() {
  
  count++;
  noStroke();
background(46,28,131);
textSize(50);

fill(255);
// We are going to draw a polygon out of the wave points
beginShape(); 

float xoff = 0; // Option #1: 2D Noise
// float xoff = yoff; // Option #2: 1D Noise

// Iterate over horizontal pixels
for (float x = 0; x <= width; x += 10) {
// Calculate a y value according to noise, map to 
float y = map(noise(xoff, yoff), 0, 1, 200,300); // Option #1: 2D Noise
// float y = map(noise(xoff), 0, 1, 200,300); // Option #2: 1D Noise

// Set the vertex
fill(111,86,224);
vertex(x, y); 
// Increment x dimension for noise
xoff += 0.05;
}
// increment y dimension for noise
yoff += 0.01;
vertex(width, height);
vertex(0, height);
endShape(CLOSE);


// Create an alpha blended background
fill(0, 10);
rect(0, 0, width, height);

//float n = random(0,width); // Try this line instead of noise

// Get a noise value based on xoff and scale it according to the window's width
float n = noise(xoff1)*width;
xoff1 += xincrement;
fill(23,53,160,95);
  textSize(150);
if (count>150){
text("James", n*+0.2+90, 270);
}

// With each cycle, increment xoff

fill(244,100);
if (count>10){
ellipse (n*.5,55,100,100 );
}



 fill(5,98,155,95);
 textSize(50); 
if (count>100){
text("By", n-100, 150);
}


 fill(29,151,224,87);
 textSize(80);
if (count>50){
text("Directed", n*-0.2+180, 100);
}

fill(23,53,160,95);
  textSize(150);
if (count>150){
text("James", n*+0.2+90, 270);
}

fill(39,22,118,90);
  textSize(80);
if (count>200){
text("Cameron", n*.3, 350);
}

fill(39,22,118,90);
  textSize(35);
if (count>250){
text("Titanic", n-1*.99, 380);
}


}
