
void setup() {
  size(400, 400);
  background(180);
  smooth();
}

void draw() {
  
  noFill();
  strokeWeight(2);
  rect(100, 250, 200, 30);
  strokeWeight(4);
  rect(2, 2, 396, 396);
  
  
  color from = color(#CE2029);
  color to = color(255);
  color interA = lerpColor(from, to, .12);
  color interB = lerpColor(from, to, .24);
  color interC = lerpColor(from, to, .36);
  color interD = lerpColor(from, to, .48);
  
  
  color srt = color(255);
  color ed = color(#00A550);
  color interE = lerpColor(srt, ed, .60);
  color interF = lerpColor(srt, ed, .72);
  color interG = lerpColor(srt, ed, .84);
  color interH = lerpColor(srt, ed, .96);
  
  noStroke();
  if(mouseX > 100) {
    fill(from);
  }
  if(mouseX > 120) {
    fill(interA);
  }
  if(mouseX > 140) {
    fill(interB);
  }
  if(mouseX > 160) {
    fill(interC);
  }
  if(mouseX > 180) {
    fill(interD);
  }
  if(mouseX > 200) {
    fill(interE);
  }
  if(mouseX > 220) {
    fill(interF);
  }
  if(mouseX > 240) {
    fill(interG);
  }
  if(mouseX > 260) {
    fill(interH);
  }
  if(mouseX > 280) {
    fill(ed);
  }
   rect(100, 250, 200, 30);
   
   
  stroke(0);
  strokeWeight(2);
  line(120, 280, 120, 270);
  line(140, 280, 140, 270);
  line(160, 280, 160, 270);
  line(180, 280, 180, 270);
  line(200, 280, 200, 270);
  line(220, 280, 220, 270);
  line(240, 280, 240, 270);
  line(260, 280, 260, 270);
  line(280, 280, 280, 270);
  
}







