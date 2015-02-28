
//random squares, random blue

void setup() {
 size(800, 400); 
 background(0,0,0,0);
 smooth();
 frameRate(24);
 strokeWeight(1);
 fill(0,0,0,0);
} 

void draw(){
 stroke(0, 0, random(255));
 rect(random(width),random(height),
      random(width/2),random(height/2));

}

void mousePressed() {
 clear();
}
