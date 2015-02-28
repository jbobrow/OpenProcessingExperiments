
int d = 30;

void setup() {
  size(400, 400);
}

void draw() {
  noFill();
  ellipse(width/2, height/2, d, d);
  
  if(mousePressed) {
    d=d+2;
    if(d==70) {
      stroke(255);
    } 
    else {
      stroke(0);
    }
    if(d==300) {
      d=d-2;
        fill(255);
        textSize(20);
        text("THE BEATLES", width/2-textWidth("THE BEATLES")/2, 110);
        textSize(14);
        fill(255, 255, 0);
        text("Yellow Submarine", width/2-textWidth("Yellow Submarine")/2, 310);
      }
  }   
}
