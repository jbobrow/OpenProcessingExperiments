
int counter = 0

void setup() {
    size(300,300)
    }
 
void draw() {
    background(100,100,150);
    counter++;
    rect(mouseX+30*sin(counter), mouseY+30*sin(counter), 10, 10);
}               
