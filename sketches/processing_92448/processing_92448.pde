
void setup() {
size(320, 480);
smooth();
float trees = 7;
float treesWeight = calculateTrees(trees);
println(treesWeight);
}
float calculateTrees(float t) {
float newNumber = t * 13.8;
return newNumber;
}

void draw() {
background(204);
tree(115,0);
tree(38, 0);
tree(8,0);
tree(-20, 0);
tree (280, 0);
tree(190,0);
tree (240, 0);

}
void tree(int x, int y) {
pushMatrix();
translate(x, y);

fill (10, 130,1);
triangle(5, 440, 40, 390, 75, 440); 
fill(10,160,1);
triangle(15, 410, 40, 370, 65, 410); 
fill(10,190,1);
triangle(25, 380, 40, 350, 55, 380); 
fill(101, 58,69);
rect(30,440, 20,20  );
popMatrix();
}


