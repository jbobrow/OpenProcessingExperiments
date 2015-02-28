
//P1G1


void setup(){
  size(840, 120);

}

void draw(){
  background(0);
  smooth();
  for(int i =0; i <800; i= i+100){
    //shape
    pushMatrix();
    translate(i+10, 10);
    stroke(0);
    strokeWeight(3);
    fill(101, 200, 216);
    triangle(0, 0, 0, 75, 25, 50);
    fill(182, 112, 198);
    triangle(0, 75, 25, 50, 50, 100);
    fill(214, 142, 69);
    triangle(25, 50, 50, 100, 50, 25);
    fill(130, 211, 64);
    triangle(50, 25, 25, 50, 0, 0);
    popMatrix();
    
    //glide
    pushMatrix();
    translate(i+60, 110);
    stroke(0);
    strokeWeight(3);
    fill(101, 200, 216);
    triangle(0, 0, 0, -75, 25, -50);
    fill(182, 112, 198);
    triangle(0, -75, 25, -50, 50, -100);
    fill(214, 142, 69);
    triangle(25, -50, 50, -100, 50, -25);
    fill(130, 211, 64);
    triangle(50, -25, 25, -50, 0, 0);
    popMatrix();
   

  }
  
}

