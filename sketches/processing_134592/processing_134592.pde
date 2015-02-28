
/* @pjs preload= "Illustration+of+a+tree+silhouette.png"; */
/* @pjs preload= "Illustrated+silhouette+of+a+beautiful+woman.png"; */
/* @pjs preload= "woman2.png"; */
PImage treeimage1;
PImage treeimage2;
PImage woman1;
PImage woman2;

void setup() {
  size(600,600);
  treeimage1 = loadImage("Illustration+of+a+tree+silhouette.png");
  treeimage2 = loadImage("Illustration+of+a+tree+silhouette.png");
  woman1 = loadImage("Illustrated+silhouette+of+a+beautiful+woman.png");
  woman2 = loadImage("woman2.png");
  
  
}

void draw() {
 
  
  float c = map(mouseX, 0, width, 200, 100 );
  background(230, c, c);
  
  float tree1 = map(mouseX, 200, width, 0, -20);
  image(treeimage1, tree1, 300, 300, 300);
  
  float tree2 = map(mouseX, 800, 1200, 0, -20);
  image(treeimage2, tree2, 300, 300, 300);
  
  float benchback = map(mouseX, 6000, 6400, 0, -20);
  //float benchleg1 = map(mouseX,5900,6100,0,-20); 
  
  
  
  
  fill(0,0,0);
  rect(benchback,560,30,5);
  rect(benchback+5,560,2,30);
  rect(benchback+23,560,2,30);
  rect(benchback-2,570,35,2);
  
  fill(0,0,0);
  rect(0, 580, 600, 100);
  
  float w1 = map(mouseX, 300, 0, 0, -200);
  image(woman1, w1, 300, 400,400);
  
  
  float w2 = map(mouseX,900, 1200, 0, -200);
  image(woman2, w2, 250, 450,450);
  
  
  noStroke();
  fill( random(100,245),random(0,235),119);
  ellipse(mouseX,mouseY, 50, 50);
  
  
 
  
}


