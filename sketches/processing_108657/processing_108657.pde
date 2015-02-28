
void setup() {
size(700, 600);
background(random(0, 255),random(0, 255),random(0, 255));
}

void draw() {
//background(0, 0, 0);
background(random(0, 255),random(0, 255),random(0, 255)); 


//head
//curve(400, 600, 330, 130, 700, 70, 550, 400);
fill(112, 156, 247);
stroke(0);
beginShape();
curveVertex(700, 70);
curveVertex(700, 70);
curveVertex(530, 50);
curveVertex(330, 130);
curveVertex(340, 140);
curveVertex(300, 180);
curveVertex(320, 210);
curveVertex(230, 570);
curveVertex(250, 600);
curveVertex(700, 600);
curveVertex(700, 600);
endShape();

//left eye
fill(255, 255, 255);
ellipseMode(CENTER);
ellipse(370, 130, 50, 50);
fill(0, 0, 0);
ellipseMode(CENTER);
ellipse(365, 140, 20, 20);

//right eye
fill(255, 255, 255);
ellipseMode(CORNERS);
ellipse(500, 170, 580, 220);
//ellipse(550, 200, 70, 70);
fill(0, 0, 0);
ellipseMode(CENTER);
ellipse(520, 200, 25, 25);

//nose
fill(112, 156, 247);
curve(500, 250, 420, 135, 370, 170, 450, 200);
fill(0, 0, 0);
ellipse(385, 170, 10, 10);
ellipse(420, 180, 10, 10);

//mouth
quad(355, 200, 260, 500, 550, 570, 480, 230);
fill(255, 255, 255);

noStroke();
random(255);
fill(255, 255, 255);
curve(550, 570, 260, 500, 495, 300, 550, 570);
triangle(259, 499, 494, 299, 550, 570);

//word bubble
ellipseMode(CORNERS);
ellipse(50, 50, 300, 200);
triangle(190, 190, 240, 180, 250, 250);
textSize(32);
textLeading(25);
fill(random(0, 255),random(0, 255),random(0, 255));
text("H\nA\nL\nP", 150, 110);

textSize(32);
fill(0);
text("WTF", 100, 100);
text("AM I", 130, 130);
text("DOING", 160, 160);

textSize(110);
fill(random(0, 255),random(0, 255),random(0, 255));
text("OH MY GOD", 20, 350);



}
