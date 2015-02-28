
int bob=0;
float bob2=0;
int pat=0;

void setup() {
  size(600, 600);
  background(255);
}

void draw() {

  pat = pat-2;
  
  //int = bob est un nombre entier
  fill(bob,bob2,pat);
  noStroke();
  //stroke(bob,bob2,pat);
  rect(bob, bob, 30, bob);
  bob = bob+1;

  //float = bob n'est pas un nombre entier
  /*fill(bob,bob2,pat);
  stroke(bob,bob2,pat);
  rect(bob2, bob2, 20, 20);
  bob2 = bob2+1.5;*/
}

