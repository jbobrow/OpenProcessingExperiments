
boolean isDrawing = false;

void setup() {
    size (1000,1000);
    background(156);
    smooth();
}

void draw(){
 if (isDrawing){ 
   
  stroke(175,23,23,70);
  line(pmouseX, pmouseY, mouseX, mouseY);
  stroke(4,4,91,80);  
  line(mouseX, mouseY, mouseX + random(0,90), mouseY + random(30,70));
 }
};

void mousePressed() {
  isDrawing = !isDrawing;
};

