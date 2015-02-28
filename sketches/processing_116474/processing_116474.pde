
//The array of stars 
Star[] stars; 

//Global offset 
PVector offset; 
PFont font;
int page = 1;
String p1 ="pointing to the night sky, we say universe.";
String p2 ="In fact there're all kinds of dirt, blank space and stars.";
String p3 ="But we say it all together, 'universe'";
String p4 ="you are part of the space";
String p5 ="you are included in the unimaginable large and wide universe";
String p6 ="It doesn't mean that you are a small presence in the universe";
String p7 ="you are the space";
String p8 ="this is the space";

void setup() {
  size(600, 600);
  font = loadFont("AmaticSC-Bold-48.vlw");
    //Initialize the stars 

 stars = new Star[width]; 
  for(int i = 0; i < stars.length; i ++) stars[i] = new Star(); 
  //Initialize the offset 
 offset = new PVector(width / 2, height / 2); 

 smooth(); 
}

void draw() {   
  textAlign(CENTER);
  if (page == 1) {
    background(0);
    textFont(font, 30);
    text(p1, width/2, height/2);
      for(int i = 0; i < stars.length; i ++) stars[i].display(); 
  PVector angle = new PVector(mouseX - width / 2, mouseY - height / 2); 
  angle.normalize(); 
  angle.mult(dist(width / 2, height / 2, mouseX, mouseY) / 50); 
  offset.add(angle); 
  } 
  else if (page == 2) {
    background(0);
    textFont(font, 30);
    text(p2, width/2, height/2);
      for(int i = 0; i < stars.length; i ++) stars[i].display(); 
  PVector angle = new PVector(mouseX - width / 2, mouseY - height / 2); 
  angle.normalize(); 
  angle.mult(dist(width / 2, height / 2, mouseX, mouseY) / 50); 
  offset.add(angle); 
  } 
  else if (page == 3) {
    background(0);
    textFont(font, 30);
    text(p3, width/2, height/2);
      for(int i = 0; i < stars.length; i ++) stars[i].display(); 
  PVector angle = new PVector(mouseX - width / 2, mouseY - height / 2); 
  angle.normalize(); 
  angle.mult(dist(width / 2, height / 2, mouseX, mouseY) / 50); 
  offset.add(angle); 
  }
   else if (page == 4) {
    background(0);
    textFont(font, 30);
    text(p4, width/2, height/2);
      for(int i = 0; i < stars.length; i ++) stars[i].display(); 
  PVector angle = new PVector(mouseX - width / 2, mouseY - height / 2); 
  angle.normalize(); 
  angle.mult(dist(width / 2, height / 2, mouseX, mouseY) / 50); 
  offset.add(angle); 
  }
   else if (page == 5) {
    background(0);
    textFont(font, 30);
    text(p5, width/2, height/2);
      for(int i = 0; i < stars.length; i ++) stars[i].display(); 
  PVector angle = new PVector(mouseX - width / 2, mouseY - height / 2); 
  angle.normalize(); 
  angle.mult(dist(width / 2, height / 2, mouseX, mouseY) / 50); 
  offset.add(angle); 
  }
   else if (page == 6) {
    background(0);
    textFont(font, 30);
    text(p6, width/2, height/2);
      for(int i = 0; i < stars.length; i ++) stars[i].display(); 
  PVector angle = new PVector(mouseX - width / 2, mouseY - height / 2); 
  angle.normalize(); 
  angle.mult(dist(width / 2, height / 2, mouseX, mouseY) / 50); 
  offset.add(angle); 
  }
   else if (page == 7) {
    background(0);
    textFont(font, 30);
    text(p7, width/2, height/2);
      for(int i = 0; i < stars.length; i ++) stars[i].display(); 
  PVector angle = new PVector(mouseX - width / 2, mouseY - height / 2); 
  angle.normalize(); 
  angle.mult(dist(width / 2, height / 2, mouseX, mouseY) / 50); 
  offset.add(angle); 
  }
   else if (page == 8) {
    background(0);
    textFont(font, 30);
    text(p8, width/2, height/2);
      for(int i = 0; i < stars.length; i ++) stars[i].display(); 
  PVector angle = new PVector(mouseX - width / 2, mouseY - height / 2); 
  angle.normalize(); 
  angle.mult(dist(width / 2, height / 2, mouseX, mouseY) / 50); 
  offset.add(angle); 
  }
}
void mousePressed() {
  if (page == 1) {
    page = 2;
  }else if (page == 2) {
    page = int(random(3,5));
  }else if (page == 3) {
    page = int(random(4,5));
  }else if (page == 4) {
    page = int(random(2,6));
  }else if (page == 5) {
    page = int(random(6,7));
  }else if (page == 6) {
    page = int(random(4,7));
  }else if (page == 7) {
    page = int(random(4,8));
  }else if (page == 8) {
    page = int(random(2,5));
  }
  println(page);
}



