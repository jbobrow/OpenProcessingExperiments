
void setup() {
 size (500, 500);
 smooth();
}


void draw (){
 background (0, 0, 255);
 pushMatrix(); 
  translate(width/2, height/2);
 for(int i=0; i<10; i++){

 rotate (radians(10));
 pushMatrix();
 translate(60,60);
 fill(255,0,0);
 rect (50, 50, 10, 10);
 rect(0, 0, 10, 10);
 popMatrix();
 }
}
