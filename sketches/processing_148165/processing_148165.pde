
void setup() { 
size(800,600);
background(0);
fill(17,13,150);
ellipseMode(RADIUS);
stroke(255);
ellipse(650,450,400,400);
noStroke();
ellipseMode(CENTER);
fill(255,0,0);
ellipse(750,600,45,45);
line(750,600,160,90);



stroke(255,0,0);
line(750,600,160,90);
line(160,90,312,230);
}

void draw() {
noStroke();
fill(random(120),100,255,50);
stroke(0);
fill(255,222,173);
rect(10,10,150,80);
triangle(10,10,80,70,160,10);
textSize(20);
fill(255,255,255);
text("0101010101",18, 200);
text("0101010101",10, 300);
text("0101010101",21, 412);
text("0101010101",5, 645);
text("0101010101",35, 140);
text("0101010101",312, 40);
text("0101010101",512, 40);
text("Calcuta",650, 600);
fill(0);
text("e-Mail",97,89);
  if(mousePressed) { 
    fill(255,0,255);
    rect(10,10,150,80);
triangle(10,10,80,70,160,10);
  }
  else {
  fill(255,222,173);
    rect(10,10,150,80);
triangle(10,10,80,70,160,10);
    
  }
}
