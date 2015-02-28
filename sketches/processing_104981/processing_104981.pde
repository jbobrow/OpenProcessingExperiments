
//day 3 homework by Evan Batson
//S controls the size of the square, and the size, fill, and stroke of the inner rect are proportional to this variable.

int S = 500; // <-- change this

color inner = color(S/4, S/2, S);

void setup () {
  
size(S,S);
background(200);

}

void draw () {
  
strokeWeight(S/20);
rectMode(CENTER);
fill(inner);
rect(S/2, S/2, S/3, S/3);

}
