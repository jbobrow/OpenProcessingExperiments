
// vertex variables
int[] a = new int[13];


void setup() {
  size(400, 400);
  smooth();
  for (int i = 0; i < a.length; i += 1){
    a[i] = int(random(120));
    }
}

void draw() {
  background(255);
  fill(0, 10);

  // 4 shapes
  beginShape();
  vertex(a[1], a[2]);
  vertex(a[3], a[4]);
  vertex(a[5], a[6]);
  vertex(a[7], a[8]);
  vertex(a[9], a[10]);
  vertex(a[11], a[12]);
  endShape(CLOSE);
  
  beginShape();
  vertex(width-a[1], a[2]);
  vertex(width-a[3], a[4]);
  vertex(width-a[5], a[6]);
  vertex(width-a[7], a[8]);
  vertex(width-a[9], a[10]);
  vertex(width-a[11], a[12]);
  endShape(CLOSE);
  
  beginShape();
  vertex(a[1], height-a[2]);
  vertex(a[3], height-a[4]);
  vertex(a[5], height-a[6]);
  vertex(a[7], height-a[8]);
  vertex(a[9], height-a[10]);
  vertex(a[11], height-a[12]);
  endShape(CLOSE);
  
  beginShape();
  vertex(width-a[1], height-a[2]);
  vertex(width-a[3], height-a[4]);
  vertex(width-a[5], height-a[6]);
  vertex(width-a[7], height-a[8]);
  vertex(width-a[9], height-a[10]);
  vertex(width-a[11], height-a[12]);
  endShape(CLOSE);
  
  // mouse shape
  beginShape();
  vertex(mouseX, mouseY);
  vertex(mouseX-a[3]+a[1], mouseY-a[4]+a[2]);
  vertex(mouseX-a[5]+a[1], mouseY-a[6]+a[2]);
  vertex(mouseX-a[7]+a[1], mouseY-a[8]+a[2]);
  vertex(mouseX-a[9]+a[1], mouseY-a[10]+a[2]);
  vertex(mouseX-a[11]+a[1], mouseY-a[12]+a[2]);
  endShape(CLOSE);
}


