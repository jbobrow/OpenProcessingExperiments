
void setup(){
  size(512, 512);
  
}
void draw(){
  int xpos= mouseX;
  int ypos= mouseY;
  background(3, 35, 50);
beginShape(LINES);
triangle(mouseX/2, mouseY,  mouseX*1.50, mouseY, 0,0);
if (xpos<ypos*1.2-xpos/2||ypos*1.5>=xpos){
  ellipse(mouseX, mouseY, mouseX*1.50, mouseY);//ellipse gets sized to fit for the rest of the positions
}
else{
ellipse(mouseX, mouseY, mouseX*1.5-mouseY/2, mouseY*1.5-mouseX/2);//ellipse gets sized to fit for standard properties
}

fill(mouseY, random(0, 255), random(0, 255));//lightray gets filled
smooth();
noStroke();


endShape(CLOSE);

}


