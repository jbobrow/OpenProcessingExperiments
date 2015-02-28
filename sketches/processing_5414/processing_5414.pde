
int page = 1; // Stores the current page
PFont Comic;
int startTime = 0;
PImage Beer;
PImage BlueDrank;
PImage Choose;
PImage Intro;

void setup() {
 size(640, 480);
 Comic = loadFont("ComicSansMS-48.vlw");
 Beer = loadImage("Beer.jpg");
 BlueDrank = loadImage("Blue Drank.jpg");
 Choose = loadImage("Choose.png");
 Intro = loadImage("Intro.png");
 textFont(Comic);
 textAlign(CENTER);
 fill(255);
startTime = millis();
}

void draw() {
 background(0);
 stroke(102);
 
 //Page 1: Intro
  if (page == 1){
  image(Intro, 0, 0);
  if (millis() > startTime + 4000){
    page = 2;
  }
  }
   // Page 2: Drinks
 else if (page == 2) {
   image(Choose, 0, 0);
 }
   // Page 3: Beer Win
 else if (page == 3) {
   image(Beer, 0, 0);
   textSize(20);
   text("EWWWWW Warm Beast...but hey you didn't get raped", width/2, height/2);
 }
  // Page 4: Rape Loser
 else if (page == 4) {
   image(BlueDrank, 0, 0);
   textSize(20);
   text("Uh O... You don't remember anything from last night", width/2, height/2);
 }

}
 // Page 2: Drinks
void mousePressed() {
 if (page == 2) {
   if (mouseX < width/2) {
     page = 3;
     }
   else {
     page = 4;
   }
 }
 }
   


