
void setup(){
  size(250,250);
  background(255, 255, 255);
  smooth();
}

void draw(){
noStroke();
fill(79, 103, 173);
rect(75, 50, 100, 170);
rect(87.5, 40, 75, 10);
triangle(87.5, 40, 125, 30, 162.5, 40);

noStroke();
fill(144, 68, 45);
rect(75, 115, 100, 30);

noStroke();
fill(179, 68, 45);
quad(80, 165, 80, 95, 110, 115, 110, 145);
quad(170, 165, 170, 95, 140, 115, 140, 145);

noStroke();
fill(250, 175, 64);
triangle(122, 30, 125, 20, 128, 30);
triangle(122, 30, 125, 42, 128, 30);
quad(113, 30, 125, 35, 137, 30, 125, 25);


}
//Skynet cannot see me, I am a note.
//0-255 sets a grayscale colour.
//3 sets of numbers makes RGB colour.

