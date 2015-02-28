
color[] palette = {#FFDF0D, #FF19B7, #17B200, #21FF00};
color[] palette1 = {#0C7F05, #FFDF0D, #030075, #13CC07};
float x;
float b = random(2);

void setup() {
  size (900, 600);
  smooth();
  background(#170021);
  fill(0);
}

void draw() {
  //big synapse
  float r = random(4);
  float s = random(150);
  float t = 300;
  x+= random(10);
  strokeWeight(2);
  stroke(palette[int(r)]);
  fill(palette[int(r)],60);
  noStroke();
  ellipse(width/2, height/2, s, 150);
  ellipse(width/2, height/2, 100, random(100));
  
  // I used an if/else statement to create dynamic connections.
  // it will draw a vertical or an horizontal line each time.
  if (s < 100) {
   strokeWeight(random(10));
   stroke(palette[int(r)]);
   line(width/2, 0, width/2, 600);   
  } else {
    strokeWeight(random(10));
   stroke(palette[int(r)]);
   line(0, height/2, 900, height/2);  
  }
  // conection point
  fill(0);
  ellipse(width/2, height/2, 10, 10);
  noFill();
  stroke(0);

// background synapses
  float u = random(50);
  x+= random(10);
  strokeWeight(2);
  stroke(palette1[int(r)]);
  fill(palette1[int(r)], 80);
  noStroke();
  ellipse(200, 100, u, 50);  
  
  x+= random(10);
  strokeWeight(2);
  stroke(palette1[int(r)]);
  fill(palette1[int(r)], 40);
  noStroke();
  ellipse(200, 500, u, 50);
  
  x+= random(10);
  strokeWeight(2);
  stroke(palette1[int(r)]);
  fill(palette1[int(r)], 40);
  noStroke();
  ellipse(200, 500, u, 50);
  
  x+= random(10);
  strokeWeight(2);
  stroke(palette1[int(r)]);
  fill(palette1[int(r)], 40);
  noStroke();
  ellipse(700, 500, u, 50);
  
    x+= random(10);
  strokeWeight(2);
  stroke(palette1[int(r)]);
  fill(palette1[int(r)], 40);
  noStroke();
  ellipse(700, 100, u, 50);
  
  //connections  
    if (s < 100) {
   strokeWeight(random(5));
   stroke(palette[int(r)]);
   line(200, 0, 200, 600);   
  } else {
    strokeWeight(random(5));
   stroke(palette[int(r)]);
   line(0, 100, 900, 100);  
  }
  
   if (s < 100) {
   strokeWeight(random(5));
   stroke(palette[int(r)]);
   line(700, 0, 700, 600);   
  } else {
    strokeWeight(random(5));
   stroke(palette[int(r)]);
   line(0, 500, 900, 500);  
 }
}
