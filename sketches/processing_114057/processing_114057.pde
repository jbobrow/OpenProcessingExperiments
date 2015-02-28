
//Chen Yi Wu
// mouse monster

void setup() {
  size(300, 300);
  background (255);
}

void draw() {
  //picture
  if (mousePressed) { 
    fill(255, 255, 0, 30);
    stroke(255, 255, 0);
    line(mouseX-50, mouseY, mouseX, mouseY);
    line(mouseX, mouseY, mouseX-(60*cos(45)*cos(45)), mouseY-(60*sin(45)*sin(45)));

    arc(mouseX, mouseY, 100, 100, - PI * 11/ 18, PI ); // lower quarter circle 

    fill(random(100), random(100), 0);
    noStroke();
    ellipse(mouseX+20, mouseY-25, random(15), random(15));
    fill(255, 0, 0, 30);
    noStroke();
    ellipse(mouseX-25, mouseY-14, 30, 30);
  }
  else {

    //picture
    fill(255, 255, 0, 30);
    stroke(255, 255, 0);
    line(mouseX-50, mouseY, mouseX, mouseY);
    line(mouseX, mouseY, mouseX-(50*cos(60)*cos(60)), mouseY-(50*sin(60)*sin(30)));

    arc(mouseX, mouseY, 100, 100, - PI * 16/ 18, PI ); // lower quarter circle 

    fill(random(100), random(100), 0);
    noStroke();
    ellipse(mouseX-10, mouseY-25, random(15), random(15));
  }
  // glitter
  fill(random(100), 30);
  rect(0, 0, 300, 300);
}



