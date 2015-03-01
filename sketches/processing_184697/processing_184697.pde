
float px =1;
void setup() {
  size(600,600);
  
}
void draw () {
  background(196,56,170);
  if (mousePressed){
  px= px+5;
  }
  else { 
    px=px-5;
stroke(mouseX, 130, mouseY);
line(0,0,mouseX,mouseY);
  }
    fill(28,274,98);
  
  ellipse(40,px,40,px-2);
  ellipse(80,px+10,80,px+2);

}

 
