
void setup() {
background(0);
size(400,400);
frameRate(3);

}

void draw() {
fill(random(255), random(255), random(255));
 rect(random(400), 10, 2, random(100)); 
 rect(random(400), 100, 10,  random(100)); 
 rect(random(400), 190, 20,  random(100));
 rect(random(400), 280, 30, random(100));
}
