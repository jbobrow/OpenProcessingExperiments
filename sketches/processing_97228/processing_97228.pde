
//PFont alien = loadFont("alien.vlw");

color[] change = {#FF0000, #FF0364, #FF03DE, #DD03FF, #7703FF, #3003FF, #038FFF, #03E8FF, #03FFAD, #03FF5D, #A1FF03, #FFF703};
color [] palette = change;


void setup() {
  size(500, 750);
  background(#FFFFFF);
  
fill(#000000);
textSize(20);
text("Income of Behavioral Science Careers", width/7, 50);

textSize(10);
text("$140,000", 400, 100);

textSize(10);
text("$130,000", 400, 150);

textSize(10);
text("$120,000", 400, 200);

textSize(10);
text("$110,000", 400, 250);

textSize(10);
text("$100,000", 400, 300);

textSize(10);
text("$90,000", 400, 350);

textSize(10);
text("$80,000", 400, 400);

textSize(10);
text("$70,000", 400, 450);

textSize(10);
text("$60,000", 400, 500);

textSize(10);
text("$50,000", 400, 550);

textSize(10);
text("$40,000", 400, 600);

textSize(10);
text("$30,000", 400, 650);

textSize(10);
text("$20,000", 400, 700);
}


void draw() {
//textFont(alien, 30);
fill(#000000);
textSize(15);
text("SOCIAL WORKER", width/7, 75);


//CONNECTING LINES
pushMatrix();
translate(0, 100);
strokeWeight(3);

stroke(palette[0]);
line(width/5+5, 30, 390, 349);

stroke(palette[1]);
line(width/5+25, 80, 390, 413);

stroke(palette[2]);
line(width/5-20, 130, 390, 443);

stroke(palette[3]);
line(width/5-5, 180, 390, 448);

stroke(palette[4]);
line(width/5+15, 230, 390, 464);

stroke(palette[5]);
line(width/5+3, 280, 390, 484);

stroke(palette[6]);
line(width/5+45, 330, 390, 486);

stroke(palette[7]);
line(width/5+58, 380, 390, 497);

stroke(palette[8]);
line(width/5-3, 430, 390, 505);

stroke(palette[9]);
line(width/5-10, 480, 390, 520);

stroke(palette[10]);
line(width/5+28, 530, 390, 522);

stroke(palette[11]);
line(width/5+28, 580, 390, 569);
popMatrix();

//CATEGORIES OR STATE LABELS ON LEFT
textSize(13
);
fill(palette[0]);
text("top 10%", width/10, 130);

fill(palette[1]);
text("Minnesosta", width/10, 180);

fill(palette[2]);
text("D.C.", width/10, 230);

fill(palette[3]);
text("Hawaii", width/10, 280);

fill(palette[4]);
text("California", width/10, 330);

fill(palette[5]);
text("Virginia", width/10, 380);

fill(palette[6]);
text("North Carolina", width/10, 430);

fill(palette[7]);
text("National Average", width/10, 480);

fill(palette[8]);
text("Alaska", width/10, 530);

fill(palette[9]);
text("Texas", width/10, 580);

fill(palette[10]);
text("New Mexico", width/10, 630);

fill(palette[11]);
text("bottom 10%", width/10, 680);
}
