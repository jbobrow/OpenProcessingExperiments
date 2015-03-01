
int xPos = 31;
int yPos = 50;
int S = 30;


void setup() {
  noStroke();
  size(800, 600);
  background(#b5b5b5);
  fill(255);
  rect(90, yPos, 680, 450);



  fill(#662d91);
  rect(xPos, yPos, S, S);

  fill(#92278f);
  rect(xPos, yPos+S, S, S);

  fill(#9e1f63);
  rect(xPos, yPos+S+S, S, S);

  fill(#ed1c24);
  rect(xPos, yPos+S+S+S, S, S);

  fill(#f15a29);
  rect(xPos, yPos+S+S+S+S, S, S);

  fill(#f77d1e);
  rect(xPos, yPos+S+S+S+S+S, S, S);

  fill(#fbb040);
  rect(xPos, yPos+S+S+S+S+S+S, S, S);

  fill(#f9ed32);
  rect(xPos, yPos+S+S+S+S+S+S+S, S, S);

  fill(#8dc63f);
  rect(xPos, yPos+S+S+S+S+S+S+S+S, S, S);

  fill(#009444);
  rect(xPos, yPos+S+S+S+S+S+S+S+S+S, S, S);

  fill(#00a79d);
  rect(xPos, yPos+S+S+S+S+S+S+S+S+S+S, S, S);

  fill(#0094cb);
  rect(xPos, yPos+S+S+S+S+S+S+S+S+S+S+S, S, S);

  fill(#1c75bc);
  rect(xPos, yPos+S+S+S+S+S+S+S+S+S+S+S+S, S, S);

  fill(#2b3990);
  rect(xPos, yPos+S+S+S+S+S+S+S+S+S+S+S+S+S, S, S);

  fill(#262262);
  rect(xPos, yPos+S+S+S+S+S+S+S+S+S+S+S+S+S+S, S, S);





  stroke(1);
  fill(255);
  ellipse(45, 540, 30, 30);
  //rect(xPos, yPos+S+S+S+S+S+S+S+S+S+S+S+S+S+S+S+S, S, S);
}





void draw() {
  if (mousePressed) {
    if (mouseX > 100 && mouseX < 800 && mouseY > 0 && mouseY < 600) {
      line (pmouseX, pmouseY, mouseX, mouseY);
      float Random = dist(pmouseX, pmouseY, mouseX, mouseY);
      strokeWeight(10);
    }
    if (mouseX > xPos && mouseX < xPos+S && mouseY > yPos && mouseY < yPos+S) {
      stroke(#662d91);
      strokeWeight(1);
    }
    if (mouseX > xPos && mouseX < xPos+S && mouseY > yPos+S && mouseY < yPos+S+S) {
      stroke(#92278f);
      strokeWeight(1);
    }
    if (mouseX > xPos && mouseX < xPos+S && mouseY > yPos+S+S && mouseY < yPos+S+S+S) {
      stroke(#9e1f63);
      strokeWeight(1);
    }
    if (mouseX > xPos && mouseX < xPos+S && mouseY > yPos+S+S+S && mouseY < yPos+S+S+S+S) {
      stroke(#ed1c24);
      strokeWeight(1);
    }
    if (mouseX > xPos && mouseX < xPos+S && mouseY > yPos+S+S+S+S && mouseY < yPos+S+S+S+S+S) {
      stroke(#f15a29);
      strokeWeight(1);
    }
    if (mouseX > xPos && mouseX < xPos+S && mouseY > yPos+S+S+S+S+S && mouseY < yPos+S+S+S+S+S+S) {
      stroke(#f77d1e);
      strokeWeight(1);
    }
    if (mouseX > xPos && mouseX < xPos+S && mouseY > yPos+S+S+S+S+S+S && mouseY < yPos+S+S+S+S+S+S+S) {
      stroke(#fbb040);
      strokeWeight(1);
    }
    if (mouseX > xPos && mouseX < xPos+S && mouseY > yPos+S+S+S+S+S+S+S && mouseY < yPos+S+S+S+S+S+S+S+S) {
      stroke(#f9ed32);
      strokeWeight(1);
    }
    if (mouseX > xPos && mouseX < xPos+S && mouseY > yPos+S+S+S+S+S+S+S+S && mouseY < yPos+S+S+S+S+S+S+S+S+S) {
      stroke(#8dc63f);
      strokeWeight(1);
    }
    if (mouseX > xPos && mouseX < xPos+S && mouseY > yPos+S+S+S+S+S+S+S+S+S && mouseY < yPos+S+S+S+S+S+S+S+S+S+S) {
      stroke(#009444);
      strokeWeight(1);
    }
    if (mouseX > xPos && mouseX < xPos+S && mouseY > yPos+S+S+S+S+S+S+S+S+S+S && mouseY < yPos+S+S+S+S+S+S+S+S+S+S+S) {
      stroke(#00a79d);
      strokeWeight(1);
    }
    if (mouseX > xPos && mouseX < xPos+S && mouseY > yPos+S+S+S+S+S+S+S+S+S+S+S && mouseY < yPos+S+S+S+S+S+S+S+S+S+S+S+S) {
      stroke(#0094cb);
      strokeWeight(1);
    }
    if (mouseX > xPos && mouseX < xPos+S && mouseY > yPos+S+S+S+S+S+S+S+S+S+S+S+S && mouseY < yPos+S+S+S+S+S+S+S+S+S+S+S+S+S) {
      stroke(#1c75bc);
      strokeWeight(1);
    }
    if (mouseX > xPos && mouseX < xPos+S && mouseY > yPos+S+S+S+S+S+S+S+S+S+S+S+S+S && mouseY < yPos+S+S+S+S+S+S+S+S+S+S+S+S+S+S) {
      stroke(#2b3990);
      strokeWeight(1);
    }
    if (mouseX > xPos && mouseX < xPos+S && mouseY > yPos+S+S+S+S+S+S+S+S+S+S+S+S+S+S && mouseY < yPos+S+S+S+S+S+S+S+S+S+S+S+S+S+S+S) {
      stroke(#262262);
      strokeWeight(1);
    }



    if (mouseX < xPos+S && mouseX >xPos && mouseY <yPos+S+S+S+S+S+S+S+S+S+S+S+S+S+S+S+S+S+S && mouseY >yPos+S+S+S+S+S+S+S+S+S+S+S+S+S+S+S) {
      stroke(255);
  
    }
  }
}

