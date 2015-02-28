
void setup(){
  size(600, 500);
  smooth();
float randomFloat = random(10);
 println("randomFloat = " + randomFloat);
 float randomInt = int (random(11));
 println("randomInt = " + randomInt);
}

int yrx= 250;
int yry= 250;
int rex= 250;
int rey= 250;

void draw(){
background(#3F4036);

fill(#D94625);
ellipse(rex, rey, 50, 50);
rex--;
rex=constrain(rex, 30, 500);

fill(#F2E530);
noStroke();
rect(yrx, yry, 100, 100);
yrx++;
yrx=constrain(yrx, 10, 500);

}
