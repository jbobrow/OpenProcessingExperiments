
void setup() {
 size (500, 500);
 smooth();
}


void draw (){
 background (0, 0, 255);
 fill(0,0,0);
 rect (50, 50, 10, 10);
 pushMatrix();
 translate(60, 60);
 rotate(radians (10));
 fill(255,0,0);
 rect(0, 0, 10, 10);
 popMatrix();

}
