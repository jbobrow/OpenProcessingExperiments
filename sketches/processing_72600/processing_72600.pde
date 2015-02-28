

void setup() {
  size(400, 400);

}

void draw() {
  fill(255);
  smooth();
  for (int i =10;i<width; i+=10) {
    line(0, 0, i, 200);
    line(width, height, i, 200);
    //  stroke(100,100,100);
    line(width, 0, i, 200);
    line(0, height, i, 200);
    line(100, height, i, 200);
    line(300, height, i, 200);
    stroke(25, 124, 79);
    line(-mouseX+width, 0, i, 200);
    line(300, -mouseY+width, i, 200);
  };
  noStroke();
  for (int i =0;i<width; i+=40) {
    fill(0, random(100, 200), 0, 100); 
    rect(i, 0, 40, 40);
    fill(0, random(100, 200), 95, 100); 
    rect(i, 40, 40, 40);
    fill(0, random(100, 200), 150, 100); 
    rect(i, 80, 40, 40);
    fill(20, random(100, 150), 255, 100); 
    rect(i, 120, 40, 40);
    fill(100, random(100, 200), 255, 100); 
    rect(i, 160, 40, 40);
    fill(100, random(100, 200), 255,100);
    rect(i, 200, 40, 40);
    fill(20, random(100, 150), 255, 100); 
    rect(i, 240, 40, 40);
    fill(0, random(100, 200), 150, 100); 
    rect(i, 280, 40, 40);
    fill(0, random(100, 200), 95, 100); 
    rect(i, 320, 40, 40);
    fill(0, random(100, 200), 0, 100); 
    rect(i, 360, 40, 40);
  };


  ////for(int counter = 0; counter<10; counter +=1){
  //for (int counter = 20; counter<width; counter +=50) {
  //  //Draw Stuff
  //  println(counter); 
  //  fill(155, 20, 178);
  //  //  rect(random(width),random(height), 20,20);
  //  rect(counter, 200, 20, 20);
  //};
}


