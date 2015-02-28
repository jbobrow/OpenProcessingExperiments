
void setup()
{


size(600,400);
smooth();
}

int value = 0;

void draw(){
background(199);
ellipse(mouseX,mouseY,20,90);
  float weight = dist(pmouseX,pmouseY,mouseX,mouseY);
  strokeWeight(weight);
  if (mousePressed == true)
  line(pmouseX,pmouseY,mouseX,mouseY);
   
  fill(value);
  rect(width/2, height/2, 60, 60);
}

void mouseDragged() 
{
  value = value + 5;
  if (value > 255) {
    value = 0;
  }
rectMode(CENTER);
stroke(255);
noFill();
rect(width/2, height/2, 60, 60);
stroke(255,0,25);
pushMatrix();
fill(130);
rect(50, 50, 160, 160);
popMatrix();
ellipse(width/2, height/2,90,90);
fill(29);
strokeWeight(6);
beginShape();
pushMatrix();
strokeWeight(0);
line(100, 300, 85, 75);
popMatrix();
line(100, 500, 85, 75);
fill(204, 102, 0);
strokeJoin(ROUND);       
rect(400, 300, 70, 70);
triangle(400, 75, 58, 20, 86, 75);
endShape(CLOSE);
beginShape();
fill(214,6,6);
vertex(180, 82);
vertex(207, 36);
vertex(214, 63);
vertex(407, 11);
vertex(412, 30);
vertex(219, 82);
vertex(226, 109);
endShape();
}


