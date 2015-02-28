
PImage bkPic = createImage(0, 500, RGB);


void setup(){
  size(500, 500);
  bkPic=loadImage("cosmos.jpg");
  imageMode(CENTER);
  smooth();
  
}

void draw(){
  println(mouseX);
  println(mouseY);
//background
  image(bkPic, width/2, height/2, 500, 500);

planet(425, 108);
planet(131, 191);
planet(293, 370);
planet(301, 225);
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
fill(r, g, b, 160);
ellipse(x, y-10, 60, 60);

}

