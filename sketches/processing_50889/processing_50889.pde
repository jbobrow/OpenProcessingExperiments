
float rand;
float centerx;
float centery;

void setup() {
  
 size(900,900);
 background(0);
 smooth();
 frameRate(500);
 
}

void draw () {
  rand = random(800);
  
 float r = random(0,100);
 float g = random(150,255);
 float b = random(255);
 float o = random(100);
  
  if (rand <= 400 && mousePressed == true) {
    //fill(0,0,255);
   //ellipse(mouseX,mouseY, rand/5, rand); 
  stroke(r,g,b,o);
  strokeWeight(1);
line(mouseX,mouseY,centerx,centery);  

}

else if (keyPressed) {
  if (key == ' ') {
    background(0);
  }
}

else if (keyPressed) {
  if (key == 'd') {
    stroke(random(255), random(0,100),random(150,255), random(100));
    strokeWeight(2);
    line(mouseX,mouseY,centerx,centery);
  }
}
  //else if (rand > 400){
    //fill(0,255,0);
    //rect(pmouseX,pmouseY,100,100);
  }

void mousePressed() {
  centerx = mouseX;
  centery = mouseY;
}



