
int couleur;
int couleur1;

void setup () {

background(0);
 size(500,500);
 couleur = 0;
  couleur1 = 255;
}

void draw () {
  
couleur = couleur + 1;
couleur1 = couleur1 -1;
fill(couleur);
text("a", random(500),1);
textSize(random(50));

fill(couleur);
text("u",random(500),125);
textSize(random(75));

fill(couleur1);
text("R",random(500),200);
textSize(random(100));


text("d", random(500),400);
textSize(random(200));
fill(couleur);

text("E",random(500),350);
textSize(random(60));
fill(couleur);

text("f",random(500),100);
textSize(random(100));
fill(couleur);

text("Y", random(500),450);
textSize(random(50));
fill(couleur);

text("g", random(500),480);
textSize(random(50));
fill(couleur1);

text("H", random(500),500);
textSize(random(150));
fill(couleur);

text("a", random(500),75);
textSize(random(70));
fill(couleur1);

text("S", random(500),100);
textSize(random(50));
fill(couleur1);

text("O", random(500),175);
textSize(random(100));
fill(couleur);

}

void mouseClicked() {
 
background(0);
}
          
