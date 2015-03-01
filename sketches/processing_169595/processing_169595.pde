

void setup() {  
background(204,255,  0);
size(400,400);
frameRate(20);
}

void draw() { 
fill(random(253), random(255), random(180)); 
 rect(random(100), 10, 2, random(100)); 
 rect(random(300), 100, 10,  random(100)); 
 rect(random(200), 190, 20,  random(100));
 rect(random(400), 280, 30, random(100));
}
