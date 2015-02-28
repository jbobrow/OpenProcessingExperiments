
int blue = int(random(50, 200));

void setup(){
  size(745, 250);
  smooth();
  ellipseMode(RADIUS);
  
}

void draw(){
  background(204);

  
  mouse(pmouseX, 110, blue);
  mouse(95, 110, blue+55);
  mouse(465, 110, blue-50);
  mouse(650, 110, blue+25); 

}

void mouse(int x, int y, int b){
pushMatrix();
translate(x, y);
noStroke();
fill(255);
arc(0, 0, 50, 50, PI, TWO_PI);
triangle(-50, 0, 0, 100, 50, 0);//head
fill(0);
ellipse(0, 100, 5, 5);//nose
fill(210,100, b);
stroke(0);
strokeWeight(8);
ellipse(50, -35, 37.5, 37.5);//right ear
ellipse(-50, -35, 37.5, 37.5);//left ear
strokeWeight(2);
fill(0);
ellipse(-25, 30, 7.5, 7.5);//left eye
ellipse(25, 30, 7.5, 7.5);//right eye
stroke(0);
strokeWeight(3);
line(-35, 85, -10, 80);
line(-30, 75, -10, 80);
line(-25, 95, -9, 82);//left whiskers
line(35, 85, 10, 80);
line(30, 75, 10, 80);
line(25, 95, 9, 82);//right whiskers
noStroke();
fill(255);
ellipse(-21.25, 26.25, 3.5, 3.5);//left eye gleam
ellipse(28.75, 26.25, 3.5, 3.5);//right eye gleam
popMatrix();

}


