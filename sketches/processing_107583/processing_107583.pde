
void setup() {
size(400, 400);
smooth();
}

void draw() {
background(0);
noStroke();
fill(255,200,255);
ellipse(width/2, height/2, 300, 300);

translate(width/2, height/2);  
pushMatrix();
stroke(255,0,255);
rotate(radians(hour()*30)); //24
line(0, 0, 0, -80);
popMatrix();

pushMatrix();
stroke(255,255,0);
rotate(radians(minute()*6)); //59
line(0, 0, 0, -130);
popMatrix();

pushMatrix();
stroke(0,255,255);
rotate(radians(second()*6)); //59
line(0, 0, 0, -105);
popMatrix();
}
