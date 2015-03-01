
void setup() {
size(300, 300);
}
void draw() {
background(#6F48F5);
Tree(width/2, height, 270, 7);

}
void Tree(float x1, float y1, float angle, float depth) {
if (depth ==0) return;
float x2 
= x1 + cos(radians(angle)) * depth * 10;
float y2 
= y1 + sin(radians(angle)) * depth * 10;
stroke(#F7F241);
line(x1, y1, x2, y2);
Tree(x2, y2, angle-15, depth-1); 
Tree(x2, y2, angle+15, depth-1);


}
   
