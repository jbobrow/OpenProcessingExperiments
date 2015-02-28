
color[]stoplight ={#537F79,  #78A68F, #CBD49C, #FED457, #CB252A};
color[] palette= stoplight;

int lf = palette[2];
int rf = palette[2];
int tf = palette[2];
int s=120;

void setup() {
  size(500, 200);
  smooth();
  rectMode(CENTER);
  stroke(palette[1]);
  strokeWeight(5);
}

void draw() {
  background(palette[0]);
  
   fill(tf);
  ellipse(width*3/4, height/2, s, s);
  
  fill(lf);
  ellipse(width/4, height/2, s, s);
  
  fill(rf);
  ellipse(width/2, height/2, s, s);
  
  if(dist(width/3, height/2, mouseX, mouseY) < s/2) {
    lf =palette[4];
  }else {
      lf = palette[2];
    }
   
    if((mouseX> width/2-s/2) && (mouseX< width/2+s/2) &&
        (mouseY > height/2-s/2) && (mouseY<height/2+s/2) && mousePressed){
          rf = palette[3];
        } else {
      rf = palette[2];
        }
}
