
boolean done;
void setup() {
size(480,480);
background(127,127,255);
done = false;
fill(137,137,200);
rect(0, 280, 480, 110);
fill(77,77,200);
rect(320, 0, 110, 310);
fill(20,20,20);
rect(0, 260, 480, 40);
fill(255,255,255);
ellipse(320, 280, 300, 120);


}
void draw() {

stroke(200, 80);
strokeWeight(.75);
if (done == false){
fill(0,137,177);
ellipse(320, 280, 110, 110);
for (int i = 0; i < 1000; i++) {

float x1 = random(width*5%100);
float x2 = random(width*5%100);
float y1 = random(height);
float y2 = random(height);
fill(37,37,100);
ellipse(x1, x2, y1, y2);
ellipse(y2, x1, x2, y1);
ellipse(y1, y2, x1, x2);
ellipse(x2, y1, y1, x1);
line(2*x1, x2, y2, y2);
line(y2, 2*x1, x2, x2);
line(y1, 2*y2, x2, x1);
line(2*x2, y1, y2, y1);



}
done = true;



fill(0,0,0);
ellipse(320, 280, 40, 40);

}
}


