
float strokeWidth = 10;
int currentBrush = 1;
int brushTransparency = 255;

void setup() {  // this is run once.   
    size(300, 300); 

} 

void draw() {  // this is run repeatedly. 
        if (keyPressed) {
            if (key == ']') {
                strokeWidth = strokeWidth + 1;
            }
            if (key == '[') {
                strokeWidth = strokeWidth - 1;
            }
            if (key == '1') {
                currentBrush = 1;
            }
            if (key == 'b') {
                currentBrush = 2;
            }
            if (key == '+') {
                brushTransparency += 2;
            }
            if (key == '-') {
                brushTransparency -= 2;
            }
        } 
    
    if (mousePressed == true) {
        
        
        if (mouseButton == LEFT) {
            if (currentBrush == 1) {
            strokeWeight(dist(mouseX, mouseY, pmouseX, pmouseY));
            strokeCap(ROUND);
            stroke(0, 0, 0, brushTransparency);
            fill(0);
            line(pmouseX, pmouseY, mouseX, mouseY);
            }
            if (currentBrush == 2) {
            strokeWeight(strokeWidth);
            stroke(255, 0, 0);
            fill(0);
            line(pmouseX, pmouseY, mouseX, mouseY);
            }
        }
    }
}
