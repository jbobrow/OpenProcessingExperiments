

int bc = 0;
float sz = 20;

void setup(){
size (255,255);
noCursor();
}

void draw(){
 
  background(0,0,mouseY+30);

   // Estrellas del cielo
  fill(255,255,255);

  ellipse (18,204,random(2),random(2));
  ellipse (50,100,random(2),random(2));
  ellipse (100,140,random(2),random(2));
  ellipse (140,210,random(2),random(2));
  ellipse (179,60,random(2),random(2));
  ellipse (20,50,random(2),random(2));
  ellipse (220,155,random(2),random(2));
  ellipse (150,10,random(2),random(2));
  ellipse (20,155,random(2),random(2));
  // Luna
  
  strokeWeight(5);
  stroke(255,255,mouseX,200);
fill(255, 255, mouseX);
  ellipse(mouseX, mouseY, mouseY, mouseY);
 noStroke();
  fill(0,0,mouseY+30);
  ellipse(mouseX+20,mouseY+1,mouseY-20,mouseY-20);
  
// Suelo
  fill (0,64,0);
  noStroke();
  rect(0, 225, 255, 255);


fill (255,255,255);
noStroke();
rect(0,0,10,255);
rect(0,0,255,10);
rect(0,245,255,10);
rect(245,0,10,255);
 
}
