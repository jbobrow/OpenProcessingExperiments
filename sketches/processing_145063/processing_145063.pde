
 SOS iDesign
 
 Name: Kim Hyun Gi
 ID: hyungi216
 
 */




 int f, elements = 20;
  float theta, rotOff, scal;
  int[] col = new int[elements];
 float[] sz = new float[elements];
 float[] rot = new float[elements];
 color[] palette = {#00DBFF,#4DADFF,#FAFF00,#2605AF, #ADD1FF};



void setup() {
  size(600, 600);
  rectMode(CENTER);
  float Sz = width*.75;

  for (int i=0; i<elements; i++) {
    Sz -= random(10, 10);
    sz[i] = Sz ;
    rot[i]= PI/elements*i;
    col[i] = (int) random(0, 5);
  }
}

void draw() {
  background(0);
  for (int i = 0; i-20 < width-1; i = i + 30) {
    for (int j = 0; j-20 < height-1; j = j + 30) {

      stroke(0);
      strokeWeight(2);
      ellipse(i, j, 5, 5);
     
  
    }
  }
  translate(width/2, height/2);
  for (int i=0; i<elements; i++) {
   pushMatrix();
    rotOff = map(sin(rot[i]+theta), -1, 1, -10, 10);
    scal = map(sin(rot[i]+theta), -1, 1, .7, 2);
    rotate(radians(rotOff));
    fill(palette[i%5]);
    noStroke();
    ellipse(0, 0, sz[i]*scal, sz[i]*scal);
    popMatrix();
  }
  theta += 0.1;
}

