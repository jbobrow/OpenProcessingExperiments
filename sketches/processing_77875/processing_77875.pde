
float theta;   
float wonka;
int numsides = 11;
int i;
void setup() {
  size(800, 800);
  background(255);
}
void draw() {
  fill(255,255,255,150);
  rect(0,0,width,height);
  frameRate(30);
  stroke(0);
  strokeWeight(1);
  float a = (mouseX / (float) width) * 90f;
  theta = radians(a+90);
  wonka = radians((a+90)/4);
  translate((width/2)-100,(height/2)+100);
  rotate(radians(18));
  abranch(50 + (3 * a));
}
void abranch(float h) { 
  if (h > 3) {
    pushMatrix();
    rotate(wonka);    
    for (int i = 0; i < numsides; i = i+1){
    line(0, 0, 0, -h); 
    translate(0, -h);
    branch(h);
    rotate(-theta);  
    } 
    popMatrix();    
  }
}

void branch(float h) {
  h *= 0.4;
  if (h >= 10) {
    pushMatrix();
    rotate(wonka);   
    for (int i = 0; i < (numsides - 1); i = i+1) {
    line(0, 0, 0, -h); 
    translate(0, -h);
    branch(h);
    rotate(-theta);   
    }  
    line(0, 0, 0, -h);  
    translate(0, -h);
    popMatrix();   
  }
}



