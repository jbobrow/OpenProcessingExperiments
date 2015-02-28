
void setup() {
 size(200, 200);
 }

void draw() {
 background(200, 200, 0);
 float x = 100;
 float y = 100;
 float dia = 30;
 float mouthWidth = 50;
 float mouthHeight = 30;

stroke(0);
fill(100);
ellipse(x, y, dia, dia*4); // nose

fill(255);
ellipse(x-25, y-20, dia, dia); // left eye
ellipse(x+25, y-20, dia, dia); // right eye
fill(0, 255, 0);
ellipse(x-20, y-15, dia/6, dia/6); // left pupil
ellipse(x+20, y-15, dia/6, dia/6); // right pupil

strokeWeight(3); // mouth
noFill();
stroke(255, 0, 0);
arc(x, y*2-43, mouthWidth, mouthHeight, 0, PI);
stroke(0);
arc(x, y*2-45, mouthWidth, mouthHeight, 0, PI);
arc(x, y*2-40, mouthWidth, mouthHeight, 0, PI);

strokeWeight(6);
stroke(#4D3E05);
fill(#728e7b);
arc(x-25, y-20, dia+10, dia+15, PI, PI + HALF_PI); // left eyebrow
arc(x+25, y-20, dia+10, dia+15, PI + HALF_PI, TWO_PI); // right eyebrow
 
stroke(50, 0, 0); // transponder
strokeWeight(2);
fill(#054D11);
triangle(x-10, y-80, x+10, y-80,x, y-70);
}
