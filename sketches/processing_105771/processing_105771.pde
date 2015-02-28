
int counter = 0;
int total = 0;
int currentX = 50;
int currentY = 50;



void setup() {
  size(500, 500);
  loop();  
 background(0, 0, 0);
frameRate(10); }
  
  
  
void draw() {

  noStroke();
    ellipse(currentX + counter*50, currentY, 10, 10);
    counter +=1; 
    total +=1;
    
   
  if (counter == 9) {
    currentY +=50;
    counter = 0;}
    
 if (total == 81) {
    currentY = 50;
    total = 0;
  }

}
   
void mouseClicked() {
    background(0, 0, 0);}
