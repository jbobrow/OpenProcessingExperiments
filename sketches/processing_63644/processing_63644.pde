
int total = 0;
 
float[] xpos = new float[0];
float[] ypos = new float[0];;
 
void setup(){
  background (255);
  size(500,500);
  smooth();
  noStroke();
  
   
}
void keyPressed(){
  
    background(255);
    xpos = new float[0];
    ypos = new float[0];;
    total=0;
}
 
void draw(){

    int i = 0;
    while (i < total) {
    fill(0,mouseY,mouseX,100);
    ellipse(xpos[i], ypos[i], mouseX ,mouseY );
    ellipse(mouseX, mouseY, random(50,50), random(40,40));
    i = i + 1;
     
}
}
 
 
 
void mousePressed(){
  total = total + 1;
  xpos = expand(xpos, total);
  ypos = expand(ypos, total);
   
  xpos[total - 1] = random(width);
  ypos[total - 1] = random(height);
}


