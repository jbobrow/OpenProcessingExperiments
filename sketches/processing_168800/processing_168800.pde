
void setup(){
         size(800, 600);
         smooth();
         background(255, 255, 255);
         noStroke();
}
void draw(){
         fill(255, 255, 0);
         ellipse(250, 250, 400, 400);
         fill(0, 0, 0);
         ellipse(200, 150, 50, 50);
         fill(0, 0, 0);
         ellipse(300, 150, 50, 50);
         bezier(250, 295, 200, 370, 300, 370, 350, 295);
}
