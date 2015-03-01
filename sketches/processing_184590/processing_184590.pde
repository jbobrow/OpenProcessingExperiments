
void setup () {
  size(600,400); background(80,15,36);
}

void draw () {
  // Zoog head
  fill(66,139,99);
  stroke(7,93,46);
  ellipse(300,100,80,100);
  // Zoog EyeL
  fill(0);
  strokeWeight(4);
  stroke(250);
  ellipse(280,100,8,10);
  // Zoog EyeR
  fill(0);
  stroke(250);
  ellipse(320,100,8,10);
  // Zoog Body
  fill(59,147,99);
  strokeWeight(2);
  stroke(7,93,46);
  rect(279,150,45,110);
  // ZOOG UNIBROW
  stroke(10,88,45);
  line(275,90,325,90);
}
// ISSUE STARTS HERE
  if(mousePressed) {
    println("hi");
  fill(255);
} else {
 fill(125);
}

// MY IF STATEMENT WONT WORK IDK WHY HALP PROFESSOR
