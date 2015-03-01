
void setup() {  //setup function called initially, only once
  size(250, 300);
  background(0);  //set background white
}
void draw() { 
smooth();
fill(pmouseX,100,mouseX,mouseY);
stroke(pmouseY);
triangle(140,60,140,130,60,220);
triangle(140,60,140,130,200,220);
triangle(40,100,240,100,140,130);
triangle(140,130,40,100,200,220);
triangle(140,130,60,220,240,100);

}


