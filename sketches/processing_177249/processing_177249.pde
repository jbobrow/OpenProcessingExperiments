
void setup () {
  size (640, 480);
  background(100);
  rectMode(CENTER);
  
}

void draw () { 
//  translate(width/2, height/2);
  strokeWeight(1);
  stroke(#5A5A5A);
  rect(30,30,20,20); // rectangle

  if ((30-10)<mouseX && mouseX<(30+10) && (30-10)<mouseY && mouseY<(30+10) ) {
    fill(#B2B2B2);
    textSize(13);
    text("New", (30+20),35);
  }
  
  else {
    background(100);
    fill(#F7F7F7);
    strokeWeight(1);
    stroke(#5A5A5A);
    rect(30,30,20,20); // rectangle
    
    
//    clear();
  }
}
