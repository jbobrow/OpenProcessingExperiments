
PImage trees;

void setUp();
trees = loadImage("topanga.jpg");
size(trees.width, trees.height);
noStroke();
}

void draw(){
image(trees, 0, 0);
color c = get(mouseX, mouseY); // Get color at (20, 30)
fill(c);
rect(20, 30, 40, 40);
}
