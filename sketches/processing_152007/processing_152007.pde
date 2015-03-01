
//This is a setup function:
void setup() {
 
size(400, 400);
 
smooth(8);
}
 
//This is a draw function:
void draw() {
 
ellipse(200, 200, 200, 200);
 
ellipse(200 + 200/4, 200 + 200/4, 200/4, 200/4);
 
ellipse(200 + 200/4, 200 - 200/4, 200/4, 200/4);
 
ellipse(200 - 200/4, 200 - 200/4, 200/4, 200/4);
 
ellipse(200 - 200/4, 200 + 200/4, 200/4, 200/4);
}
