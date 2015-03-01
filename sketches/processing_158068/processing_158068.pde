
// Processing sketch by Erim Kocatepe // 
// www.erimkocatepe.com //
float rad = 200 ;
float shape = TWO_PI;  
int count = 40000;

void setup() {
  background(255);
  size(600, 600);
}

void draw() {
  background(255);
  //paper(15);
  
  pushMatrix();
  translate(width/2, height/2);
    noStroke();
    fill(30);
    ellipse(0,0,400,400);
    stroke(30);
    noFill();
    
    translate(-rad/4,-rad/4);
    beginShape(POINTS);
    for (int n = 0; n < count; n++) {
         float spin = (frameCount)*0.002 / noise(n*1.3);
         float x = sin(map(n,0,count-1,0,shape)+spin)*rad;
         float y = cos(map(n,0,count-1,0,shape)+spin)*rad;
         float nx= noise(n*1.3)*100 + x;
         float ny= noise(n*1.1)*100 + y;
         
         strokeWeight(noise(n*1.3)*6);
         vertex(nx,ny);   
      }
    endShape();  
    popMatrix();
  
  //paper(15);
  //saveFrame("dark-######.png");
}

//PAPER
void paper(int in_val) {
  noStroke();
  for (int i = 0; i<width-1; i+=2) {
    for (int j = 0; j<height-1; j+=2) {
      fill(random(235-40, 235+30), in_val);
      rect(i, j, 2, 2);
    }
  }
  for (int i = 0; i<30; i++) {
    fill(random(60, 170), random(in_val*2.5, in_val*3));
    rect(random(0, width-2), random(0, height-2), random(1, 3), random(1, 3));
  }
}


