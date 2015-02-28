
void setup(){

size(800,800);
background(random(0));

}



void draw() {
for (int i=10; i<height ; i+=50){
  
strokeWeight(random (3));
stroke(25,240,50);
fill(random(100),random(100),random(100),0);
ellipse(random(i),random(i),random(i),random(i));
stroke(0);
fill(random(100),random(100),random(100),0);
ellipse(random(i),random(i),random(i),random(i));
stroke(255);
fill(random(25),random(240),random(55),20);
ellipse(random(i),random(i),random(i),random(i));
}
}

