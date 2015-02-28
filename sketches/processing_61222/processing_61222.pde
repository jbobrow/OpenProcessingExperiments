
void setup () {
  size (400,400);
  background(255);
  smooth();
}

void draw () {
  if(mousePressed) {
  background(255);  
  
  // 1.Note
  noFill();
  ellipse(100,225,30,23);
  
  // 2.Note
  fill(0);  
  ellipse(160,275,30,23);
  line(138,275,183,275);
  
  // 3.Note
  ellipse(200,175,30,23);
  
  // 4.Note
  ellipse(252,163,30,23);
  strokeWeight(3);
  line(267,163,267,113);
  
  // 5.Note
  ellipse(300,150,30,23);
  strokeWeight(3);
  line(315,150,315,100);
  strokeWeight(1);
  
  //verbindender Strich
  strokeWeight(3);
  line(267,113,315,100);
  line(267,120,315,107);
  strokeWeight(1);
  
  }else{
    background(255);
    
  }
  line(0,125,400,125);
  line(0,150,400,150);
  line(0,175,400,175);
  line(0,200,400,200);
  line(0,225,400,225);
}
