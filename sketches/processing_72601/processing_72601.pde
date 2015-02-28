

void setup() {
  size(600, 440);
  background(255);

}

void draw() {
  fill(255);
  smooth();
  for (int i =10;i<width; i+=10) {
  
  };
  noStroke();
  for (int i =0;i<width; i+=40) {
    fill(230, random(150,200), 0, 100); 
    rect(i, 0, 40, 40);
   fill(245, random(180, 200), 0, 100); 
    rect(i, 40, 40, 40);
     fill(250, random(200, 250), 0, 100); 
    rect(i, 80, 40, 40);
//    fill(20, random(100, 150), 255, 100); 
//    rect(i, 120, 40, 40);
    fill(200,0,random(1,200), 100); 
    rect(i, 160, 40, 40);
    fill(200,0,random(100, 200),100);
    rect(i, 200, 40, 40);
    fill(190,0, random(170, 255), 100); 
    rect(i, 240, 40, 40);
//    fill(0, random(100, 200), 150, 100); 
//    rect(i, 280, 40, 40);
     fill(20, random(100, 150), 255, 100); 
    rect(i, 320, 40, 40);
    fill(20, random(100, 200), 255, 100); 
    rect(i, 360, 40, 40);
      fill(20, random(150, 200), 255, 100); 
    rect(i, 400, 40, 40);
  };

}


