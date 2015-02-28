
//Array practice with println. Rachel Hill Feb. 26

float[] alphabet = new float[26];

void setup() {
  size(400, 400);
  smooth();
  for (int letter = 0; letter < alphabet.length; letter++) {
    alphabet[letter] = random(-26, 26);
  }
}

void draw() {
  background(0);
  for ( int letter = 0; letter < alphabet.length; letter++) {
    fill(random(255), random(100));
    rect(100,100,200,200);
    println("a" + "b" + "c");
  }
}
