
void setup(){
  size (300, 400);
  smooth(); 
  colorMode(HSB);
  background(110, 150, 255);
}

void draw(){
  frameRate(100);
  background(130, 100, 235);

noStroke();
fill(0, 0, 255, 100);
ellipse(40, 40, 100, 40);
ellipse(80, 50, 120, 50);
ellipse(100, 30, 100, 30);
ellipse(200, 50, 100, 40);
ellipse(250, 40, 100, 40);

noStroke();
fill(60, 180, 255);
rect(0, 330, 400, 70);

if (mousePressed==false){
 Stem (200, 350, 200, 200);  
  Petal(180, 222);//left bottom
  Petal(170, 200);//left
  Petal(178, 178);//top left
  Petal(200, 170);//top
  Petal(220, 178);//top right
  Petal(230, 200);//right
  Petal(220, 222);//right bottom
  Petal(200, 230);//bottom
  Flower(200, 200);
  
  Stem (100, 350, 100, 250);  
  Petal(80, 272);//left bottom
  Petal(70, 250);//left
  Petal(78, 228);//top left
  Petal(100, 220);//top
  Petal(120, 228);//top right
  Petal(130, 250);//right
  Petal(120, 272);//right bottom
  Petal(100, 280);//bottom
  Flower(100, 250);
}
  
if ((mousePressed==true)&&(mouseButton==LEFT)){
 Stem (200, 350, 200+mouseX/9, 200);  
  Petal(180+mouseX/9, 222);//left bottom
  Petal(170+mouseX/9, 200);//left
  Petal(178+mouseX/9, 178);//top left
  Petal(200+mouseX/9, 170);//top
  Petal(220+mouseX/9, 178);//top right
  Petal(230+mouseX/9, 200);//right
  Petal(220+mouseX/9, 222);//right bottom
  Petal(200+mouseX/9, 230);//bottom
  Flower(200+mouseX/9, 200);
  
      Stem (100, 350, 100, 250);  
  Petal(80, 272);//left bottom
  Petal(70, 250);//left
  Petal(78, 228);//top left
  Petal(100, 220);//top
  Petal(120, 228);//top right
  Petal(130, 250);//right
  Petal(120, 272);//right bottom
  Petal(100, 280);//bottom
  Flower(100, 250);
  
  Wind(mouseX, mouseY-10, pmouseX-20, pmouseY-10);
  Wind(mouseX, mouseY, pmouseX-10, pmouseY);
  Wind(mouseX, mouseY+10, pmouseX, pmouseY+10);
  }
  
  if((mousePressed==true)&&(mouseButton==RIGHT)){
     Stem (200, 350, 200, 200);  
  Petal(180, 222);//left bottom
  Petal(170, 200);//left
  Petal(178, 178);//top left
  Petal(200, 170);//top
  Petal(220, 178);//top right
  Petal(230, 200);//right
  Petal(220, 222);//right bottom
  Petal(200, 230);//bottom
  Flower(200, 200);
  
  Stem(100, 350, 100, 250-mouseY/4); 
  Petal(80, 272-mouseY/4);//left bottom
  Petal(70, 250-mouseY/4);//left
  Petal(78, 228-mouseY/4);//top left
  Petal(100, 220-mouseY/4);//top
  Petal(120, 228-mouseY/4);//top right
  Petal(130, 250-mouseY/4);//right
  Petal(120, 272-mouseY/4);//right bottom
  Petal(100, 280-mouseY/4);//bottom
  Flower(100, 250-mouseY/4);
}

}

void Wind(int x, int y,int z, int w){
  colorMode(HSB);
  strokeWeight(3);
  stroke(255, 0, 255, random (50, 255));
  line (x-random(mouseX), y, z, w);
}

void Flower(int x, int y){
  strokeWeight(3);
  stroke(240);
  fill(50, 100, 200);
  ellipse(x, y, 50, 50);
  noStroke();
  fill(30, 200, 255, 130);
  ellipse(x, y, 40, 40);
  fill(30, 200, 255);
  ellipse(x, y, 25, 25);
}

void Petal(int x, int y){
  fill(0, 0, 255);
  strokeWeight(2);
  stroke(200);
  ellipse(x, y, 30, 30);
}

void Stem (int x, int y, int z, int w){
  strokeWeight(4);
  stroke(60, 200, 150);
  line(x, y, z, w);
}

