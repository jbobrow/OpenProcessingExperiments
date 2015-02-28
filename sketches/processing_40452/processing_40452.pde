
void setup(){
 size(600, 600);
 colorMode(RGB);
 background(0); 
 smooth();
 noLoop();
 //Loading a font
 PFont f;
 f = loadFont("ArialMT-48.vlw");
 textFont(f,20);

}
//Setting up an class for the tree
void tree(){
  //Adding a random int variable to the coordinates of the tree,
  //makes the tree render at a random place.
  int x = int (random(width-100));
  int y = 360;//int (random(height));
  stroke(0);
  strokeWeight(5);
  strokeJoin(ROUND);
  fill(129,79,13);
  rect(x+130,y+200,40,40);
  fill(random(256),255,random(256));
  rect(x+100,y+160,100,40);
  rect(x+120,y+120,60,40);
  rect(x+130,y+80,40,40);
  rect(x+140,y+60,20,20);
}
//Setting up a class for the face
void happyFace(){
 
  //Centered ellipseMode makes it easier too put it in the center of the sketch
 ellipseMode(CENTER);
 fill(random(255),random(255),random(255),random(150,220));
 stroke(0);
 ellipse(300,300, 400,400);
 fill(0);
 noStroke();
 arc(300,300, 300, 300, 0, radians(180));
 ellipse(210,200, 100,100);
 ellipse(390,200, 100,100);
  
}
//Setting up a class for the vertexes
void randomVertex() {
  beginShape();
  stroke(random(255),random(255),random(255),random(200));
  strokeWeight(random(12));
  fill(random(255),random(255),random(255),random(200));
  vertex(random (600), random(600));
  vertex(random (600), random(600));
  vertex(random (600), random(600));
  vertex(random (600), random(600));
  vertex(random (600), random(600));
  endShape();
}
//Setting up a class for the letters
//The class has an input of two variables.
void randomLetters(int x, int y) {
//The whole alphabet in an array.
String[] letters = {"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"};
fill(255,255,255,random(100,255));
int i = int(random(25));
text(letters[i], x, y);
   
}
//Drawing the scene. noLoop() has been called in the setup,
//so the scene only draws itself once.
void draw(){
  
   //Vertex loop
  for(int i=0; i<50; i++){
    randomVertex();
  }
  //Nested for loop for the letters
  for(int x=20; x<width; x+=20){
    for (int y=20; y<height; y+=30){
      randomLetters(x, y);
    }
  }
  happyFace();
  tree();
}

