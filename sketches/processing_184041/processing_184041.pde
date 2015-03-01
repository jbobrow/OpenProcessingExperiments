
int posXcercle;
int posYcercle;

void setup() {
  size( 800, 600);
  background(255, 255, 255);
}

void draw() {
  
  background(0);
  
  if(mousePressed) {
  background(0);
  float j= random(20,20);
  for(int i=0;i<30;i++){
  noStroke();
  fill(random(0,255),random(0,255),random(0,255));
  ellipse(random(800), random (600), j,j);
  }
  fill(255);
  textSize(20);
  text("Mais si bien sûr !", 50, 50);
  text("Vendredi, 22h...", 560, 330);
  text("...Chez Élise, Jehanic et Cécilia !", 180, 580);
  textSize(50);
  fill(255);
  text("Y", 300, 50);
  text("O", 120, 150);
  text("U", 630, 250);
  text("P", 450, 450);
  text("I", 100, 520);
  }
  
  else {
    background(0);
    fill(255);
    textSize(26);
    text("Hum, on ne fait pas la fête sur Épinal...", 20, 30);
    textSize(14);
    text("Et si tu cliques ?", mouseX, mouseY);
}

}

