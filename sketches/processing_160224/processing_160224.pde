
// somthing 

color[] chemistry = {#0C2550, #A3D0C1, #FDF6DD, #FEE406, #F4651C};
color[] palette = chemistry;

void setup(){
  size(600, 600);
  smooth();
  strokeWeight(100);
  fill(13, 244, 250);
  frameRate(100);
  
 
}


void draw(){
    background(palette[0]);
    stroke(palette[int(random(0, 5))]);
    fill(palette[4]);
    ellipse(mouseX, mouseY, 40, 20);
    ellipse(mouseX-100 , mouseY , 20, 40);
    ellipse(mouseX , mouseY-100 , 20, 40);
    ellipse(mouseX-100 , mouseY-100 , 40, 20);
}



