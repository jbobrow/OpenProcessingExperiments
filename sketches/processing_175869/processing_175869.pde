
PFont font;

String[] images = { 
  "download (1).jpg", "download (2).jpg", "download (3).jpg", "download (4).jpg", "download (5).jpg", "download (6).jpg", "download (7).jpg", "download (8).jpg", "download (9).jpg", "download (10).jpg", "download (11).jpg", "download (12).jpg", "download (13).jpg", "download (14).jpg", "images (1).jpg", "images (2).jpg", "images (3).jpg", "images (4).jpg", "images (5).jpg", "images (6).jpg", "images (7).jpg", "images (8).jpg", "images (9).jpg", "images (10).jpg", "images (11).jpg", "images (12).jpg"
};
String[] titles = {
  "Terminator: Genisys", "The Expendables 3", "Sabotage", "Escape Plan", "Generation Iron", "The Last Stand", "The Expendables 2", "Gerrymandering", "The Expendables", "Darfur Now", "The Kid & I", "Around the World in 80 Days", "Rise of the Machines", "Collateral Damage", "The 6th Day", "End of Days", "Batman & Robin", "Jingle All the Way", "Eraser", "Judgement Day", "True Lies", "Last Action Hero", "Rise of the Machines", "Kindergarten Cop", " Total Recall", "The Running Man", "Predator", "Raw Deal", "Commando", "Red Sonja", "The Terminator", "Conan the Destroyer", " Conan the Barbarian", " Scavenger Hunt", "Villain", "Stay Hungry", "Long Goodbye"};   
  
float r;
float t;
PImage img;

void setup() {
  size(450,400);
  font = createFont("Myriad Pro", 10);
  textFont(font, 28);
  //img = loadImage(images[1]);
}

void draw() {

}

void mousePressed(){
    background(0);
    r = random(0, 25);
    int random = int(r);

    img = loadImage(images[random]);
    image(img, width/2-150, height/2-100);
    
    t = random(0, titles.length);
    int titleRandom = int(t);
    text(titles[titleRandom], 100, 55);
  }

