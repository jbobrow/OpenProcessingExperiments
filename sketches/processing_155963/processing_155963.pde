
float x = 0;
float y = 0;
float r = 0;

void setup() {
 
size(500,500);
noStroke();
smooth();
ellipseMode(CENTER);
}

void draw() { 
  line(random(100), random(100), random(100), random(100));
  background(0,0,random(102));
  fill(255,255,255);
  ellipse(0,0,250,100); //cloud
  ellipse(170,0,250,100); //cloud
  ellipse(300,0,250,100); //cloud
  ellipse(450,0,250,100); //cloud
  ellipse(250, 250, 80,80); //Head
  ellipse(250, 350, 150,150); //Body
  fill(0,0,0);
  ellipse(230, 244, 10,10); //Left eye
  ellipse(270, 244, 10,10); //Right eye
  fill(255,69,0);
  triangle(245, 250, 260, 270, 270, 270); //Nose
  fill(0,0,0);
  ellipse(250,220,100,30);
  ellipse(250,200,70,50);
  fill(255,255,255);
  x = x + 0.5;
  y = y + 0.6;
  
  
  for(int i = 0; i<=29; i++) {
   ellipse(20 + (i*20), random(x), random(7), random(7)); 
  }
  translate(mouseX, mouseY);
  rotate(r);
  ellipse(0,0,22,22);
  r = r + 0.1;

}




