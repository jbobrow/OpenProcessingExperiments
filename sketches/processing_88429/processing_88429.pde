
float x;
float y;
float px;
float py;
float easing =.05;

void setup() {
  size(600,600);
  smooth();
  noStroke();
  fill(255,255,255);

}
void draw() {

background(228,226,219);
float targetX = mouseX;
x += (targetX - x) * easing;
float targetY = mouseY;
y += (targetY - y) * easing;
float weight = dist(x, y, px, py);
strokeWeight(weight);

py = y;
px = x;

if (mousePressed){
stroke(random(100),118,108);
}

strokeWeight(weight);
ellipse(138,372,340,340);
strokeWeight(weight/15+15);
fill(255,255,255);
ellipse(138,372,204,204);
strokeWeight(weight);
if (mousePressed){
stroke(random(100),random(255),random(100));
}

ellipse(138,372,91*2,91*2);

strokeWeight(weight);
fill(255,255,255);
if (mousePressed){
stroke(100,100,random(100));
}

ellipse(618,200,123,123);
strokeWeight(weight);
stroke(0,0,0);
if (mousePressed){
fill(random(195),58,68);
}
ellipse(126,25,82,82);
strokeWeight(weight);
line(468,0,288+12,600);
strokeWeight(weight);
line(540,0,600,26);
strokeWeight(weight);
if (mousePressed){
stroke(100,random(100,255),68);
}
line(216+18,600,600,432-6);
strokeWeight(5);
line(216+18,600+17,600,432-6+17);
strokeWeight(27);
if (mousePressed){
stroke(random(100),random(100,255),68);
}
line(396+15,600,600,380);
if (mousePressed){
stroke(100,68,random(100,255));
}
strokeWeight(weight); //green line
stroke(0,0,0);
line(396+12,600,600,360);
if (mousePressed){
stroke(random(100),118,108);
}
strokeWeight(weight); //orange line
line(435,600,600,504);
stroke(0,0,0);
strokeWeight(weight);
line(438+5,600,608,504);
fill(0,0,0);
quad(144-6,600,180+24,534,216+24,576-12,209,600);
fill(0,0,0);
}
