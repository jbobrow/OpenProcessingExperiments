
void setup() {
  size(800,800);
  smooth();
}

void draw(){
  float r=mouseX/3.14;
  float g=random(255);
  float b=random(255);
  float p=random(255);
  line(pmouseX,pmouseY,mouseX,mouseY);
  if(mousePressed==true){
    stroke(r,g,b);
    strokeWeight(mouseX*mouseY/1000);
  }
  else{
    stroke(p,p,p);
  }
}





