
PFont f;

void setup() {
 size(1000,600);
 f = createFont("Arial",16,true);
}

void draw() {
  background(255);
  fill(255);
  triangle(30, 539, 330, 20, 630, 539);
  fill(255,0,0);
  triangle(265, 133, 330, 20, 395, 133);
  fill(51,204,0);
  beginShape();
  vertex(265, 133);
  vertex(395, 133);
  vertex(455,236);
  vertex(206,236);
  endShape();
  fill(0,0,255);
  beginShape();
  vertex(206,236);
  vertex(455,236);
  vertex(514,339);
  vertex(147,339);
  endShape();
  fill(255,153,0);
  beginShape();
  vertex(514,339);
  vertex(147,339);
  vertex(88,442);
  vertex(573,442);
  endShape();
  fill(204,51,255);
  beginShape();
  vertex(88,442);
  vertex(573,442);
  vertex(630,539);
  vertex(30,539);
  endShape();
  fill(0);
  textFont(f, 16);
  textAlign(RIGHT);
  text("Scroll over for serving size and examples!", 300,20);
  textFont(f, 32);
  textAlign(CENTER);
  text("Fats", 330, 120);
  text("Protein", 330, 200);
  text("Diary", 330, 300);
  text("Fruit & Vegetables", 330, 400);
  text("Bread & Grains", 330, 500);
  textAlign(LEFT);
  textFont(f, 44);
  
  
  
  
  
  color c = get(mouseX, mouseY);
  if (c == color(255,0,0)) {
    fill(255,0,0, 100);
    beginShape();
    vertex(330, 20);
    vertex(395, 133);
    vertex(900, 133);
    vertex(900,20);
    endShape();
    fill(0);
    text("Sparingly", 400, 100);
    textFont(f,16);
    text("Cake, chocolate, donuts", 600, 100);
  }
  if (c == color(51,204,0)) {
    fill(51,204,0, 100);
    beginShape();
    vertex(900, 133);
    vertex(395, 133);
    vertex(455,236);
    vertex(900,236);
    endShape();
    fill(0);
    text("2", 440, 200);
    textFont(f,16);
    text("Meat, Fish, Eggs, Beans", 480, 200);
  }
  if (c == color(0,0,255)) {
    fill(0,0,255, 100);
    beginShape();
    vertex(455,236);
    vertex(514,339);
    vertex(900,339);
    vertex(900,236);
    endShape();
    fill(0);
    text("3", 495, 300);
    textFont(f,16);
    text("Milk, Cheese, Yogurt", 535, 300);
  }
  if (c == color(255,153,0)) {
    fill(255,153,0, 100);
    beginShape();
    vertex(514,339);
    vertex(573,442);
    vertex(900,442);
    vertex(900,339);
    endShape();
    fill(0);
    text("4+", 550, 400);
    textFont(f,16);
    text("Brocolli, Apple, Tomato", 600, 400);
  }
  if (c == color(204,51,255)) {
    fill(204,51,255, 100);
    beginShape();
    vertex(573,442);
    vertex(630,539);
    vertex(900,539);
    vertex(900,442);
    endShape();
    fill(0);
    text("6+", 630, 500);
    textFont(f,16);
    text("Cereal, Rice, Potato", 700, 500);
  }
}

