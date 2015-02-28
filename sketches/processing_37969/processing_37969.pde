
void setup(){
  size(450, 450);
  imageMode(CENTER);
  smooth();
}

void draw(){
  if(mousePressed == true){
     planet(mouseX, mouseY);
  }
    if(mouseX>width/2){
     planet(mouseX+50, mouseY);
  }
}

void planet (int x, int y){
  float r=random(1, 255);
  float g=random(1, 255);
  float b=random(1, 255);
//rings
noFill();
strokeWeight(2);
stroke(206, 162, 15);
ellipse(x, y, 150, 60); 
ellipse(x, y, 200, 80);
stroke(255);
ellipse(x, y, 250, 100);

//center
noStroke();
fill(r, g, b);
ellipse(x, y-10, 60, 60);

}
