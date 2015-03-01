
PImage sad, Kamina;
float vari = 0;

void setup() {
  size(510, 280);
  sad = loadImage("sad.jpg");
  Kamina = loadImage("Kamina.png");
}

void draw() {
  sad.resize(510, 280);
  image(sad, 0, 0);
    vari= vari+1;
  if (vari >= 25) {
    textSize(18);
    fill(#907BF0);
    text("Sometimes in my tears I drown...", 50, 50);
  }
  if (vari >= 75) {
    text("but I never left it get me down...", 100, 100);
  }
  if (vari >= 150) {  
    image(Kamina, 0, 0);
    textSize(18);
    fill(#4CEFFC);
  }
  if (vari >= 200) {
    text("Do the impossible", 20, 50);
  }
  if (vari >= 225) {
    text("See the invisible", 350, 250);
  }
  if (vari >= 250) {
    text("Break the unbreakable", 225, 160);
  }
  if (vari >= 275) {
    text("Touch the untouchable", 35, 180);
  }
  if (vari >= 300) {
    text("Don't believe in yourself", 150, 75);
  }
  if (vari >= 325) {
    text("Believe in me", 155, 90);
  }
  if (vari >= 350) {
    text("Believe in the me, who believes in you", 155, 105);
  }
  if (vari >= 375) {
    text("We carry the souls of everyone", 160, 230);
  }
  if (vari >= 400) {
    text("On our backs", 165, 245);
  }
  if (vari >= 425) {
    text("And in our hearts", 170, 260);
  }
}

