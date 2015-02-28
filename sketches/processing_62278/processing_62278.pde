

//slide mouse over the squares
//stop at one square and it changes the background
//thanks for starting me out:Zcaubitz


void setup() {
  size(200, 200);
  background(random(255), random(255), random(255));
}
 
void draw() {
  background(random(255), random(255), random(255));
   
  noStroke();
   
  if (mouseX < width/2 && mouseY < height/2) {
    fill(200, 50, 300);
    rect(0, 0, width/2, height/2);
}   else if (mouseX > width/2 && mouseY < height/2) {
    rect(200, 0, width/2, height/2);
    { background(random(255), 200, 400);
    }
}   else if (mouseX < height/2 && mouseY > height/2) {
    rect(0, 100, width/2, height/2);
    { background(300, 200, 400);
    }
}   else {
    rect(100, 100, width/2, height/2);
    { background(255, 300, 400);
    }
}
 
  stroke(0, 140, 200);
  strokeWeight(5);
  line(0, 100, 200, 100);
  line(100, 0, 100, 200);
 
}




