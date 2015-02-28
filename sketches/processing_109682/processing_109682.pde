
void setup() {
size(400, 400);
smooth();
}

int num = 50; // number of circle
float mx[] = new float[num];
float my[] = new float[num];

void draw() {
  
  if (mousePressed) {
    background(random(0, 255), random(0, 225), random(0, 225));
  }
// if mouse is at right
// draw night flower
if (mouseX<200) {
// circle
noStroke();
fill(0);
ellipse(200, 200, 400, 400);
// versa
strokeWeight(5);
stroke(0);
fill(255);
triangle(150, 300, 190, 300, 190, 350);
strokeWeight(5);
stroke(0);
fill(255);
rect(190, 300, 40, 50);
strokeWeight(5);
stroke(0);
fill(255);
triangle(230, 300, 270, 300, 230, 350);
strokeWeight(5);
stroke(0);
fill(255);
rect(145, 270, 130, 30);
// flower tree
noStroke();
rect(195, 200, 20, 80);
// leave
strokeWeight(5);
stroke(255);
fill(255);
ellipse(200, 200, 20, 40);
strokeWeight(5);
stroke(255);
fill(255);
ellipse(220, 210, 40, 20);

    int which = frameCount % num;
  mx[which] = mouseX;
  my[which] = mouseY;
  
  for (int i = 0; i < num; i++) {
    // which+1 is the smallest (the oldest in the array)
    fill(255, 50);
    noStroke();
    int index = (which+1 + i) % num;
    ellipse(mx[index], my[index], i, i);
    
    
  }
 
}
  
 
else {
  
  // circle
noStroke();
fill(255);
ellipse(200, 200, 400, 400);
 
// versa
strokeWeight(5);
stroke(255);
fill(0);
triangle(150, 300, 190, 300, 190, 350);
strokeWeight(5);
stroke(255);
fill(0);
rect(190, 300, 40, 50);
strokeWeight(5);
stroke(255);
fill(0);
triangle(230, 300, 270, 300, 230, 350);
strokeWeight(5);
stroke(255);
fill(0);
rect(145, 270, 130, 30);
// flower tree
noStroke();
rect(195, 130, 20, 150);
// flower
noStroke();
fill(0);
ellipse(200, 150, 180, 180);
//flower leave
strokeWeight(5);
stroke(255);
line(160, 50, 240, 240);
line(180, 50, 220, 240);
line(200, 50, 200, 238);
line(220, 50, 180, 240);
line(240, 50, 160, 240);
line(140, 50, 260, 240);
line(120, 60, 300, 250);
line(80, 60, 340, 250);
line(260, 60, 130, 250);
line(290, 60, 90, 250);
line(100, 100, 290, 190);
line(100, 120, 290, 170);
line(100, 140, 290, 150);
line(100, 160, 290, 130);
line(100, 180, 290, 110);
line(100, 210, 290, 90);
//flower heart
noStroke();
fill(0);
ellipse(200, 150, 120, 120);
//flower heart to heart
noStroke();
fill(255);
ellipse(200, 150, 100, 100);
strokeWeight(5);
stroke(0);
//---
line(160, 110, 160, 190);
line(180, 100, 180, 200);
line(200, 95, 200, 205);
line(220, 100, 220, 200);
line(240, 110, 240, 190);
//ll
line(160, 120, 240, 120);
line(150, 140, 250, 140);
line(150, 160, 250, 160);
line(160, 180, 240, 180);
// square
noStroke();
fill(0);
rect(160, 120, 20, 20);
rect(200, 140, 20, 20);
rect(220, 120, 20, 20);
rect(160, 160, 20, 20);
rect(200, 180, 20, 20);
  
  int which = frameCount % num;
  mx[which] = mouseX;
  my[which] = mouseY;
  
  for (int i = 0; i < num; i++) {
    // which+1 is the smallest (the oldest in the array)
    int index = (which+1 + i) % num;
    fill(0, 50);
    noStroke();
    ellipse(mx[index], my[index], i, i);
  }
  
}
}


