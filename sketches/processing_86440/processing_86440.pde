
float s = 20;

void setup() {
 background(0);
 size(600, 600); 
frameRate(10);
}

void draw() {

 strokeWeight(random(2));
 fill(200, 50); 

//rect inside 
fill(random(0, 255), 50);
 rect(random(50, 550), random(50, 550), 10, 10); 

//rect outside
 rect(random(0, 600), random(0, 50), s, s); 
rect(random(0, 50), random(0, 600), s, s); 
rect(random(520, 600), random(0, 600), s, s); 
rect(random(0, 600), random(530, 600), s, s); 

s++;
}



