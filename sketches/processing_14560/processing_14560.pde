
void setup() {
  size(200,200);
}

void draw() { 
 for(float y=0; y<=150; y=y+25) {
   for(float x=0; x<=150; x=x+25) {
   //rect(x,y,5,5);
   pushMatrix();
   translate(x,y);
   rotate(radians(frameCount)*7);
   scale(0.2);
   ellipse(8,8,8,8);
   HJ_draw();
   popMatrix();
   }
  }
}

void HJ_draw() {
  translate(100,100);

 //
fill(255);
stroke(150);
strokeWeight(2);
rect(20,30,130,130);

//
fill(255,50,10);
stroke(150);
strokeWeight(2);

beginShape();
vertex(180,30);
vertex(150,60);
vertex(35,60);
vertex(20,180);
vertex(10,185);
vertex(10,20);
vertex(20,5);
vertex(70,20);
vertex(80,10);
vertex(10,20);

endShape(CLOSE);

//
fill(60,50,50);
stroke(150);
strokeWeight(2);

ellipse(140,90,20,20);
ellipse(60,90,20,20);

//
fill(60,50,50);
stroke(150);
strokeWeight(2);

rect(100,80,10,35);

//
fill(180,50,10);
rect(60,130,80,15);


}
