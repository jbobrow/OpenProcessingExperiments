
void setup() {
size(700,500);
} 
 

void draw() {
background(255);
 stroke(0);
 strokeWeight(12);
 noFill();
for (int i= 50; i < 900; i += 50){
 ellipse(350, 250, i, i);
 }

}
