
float rf1 = 255;
float rf2 = 255;
float rf3 = 255;

void setup(){ 
  size(250, 250);
  smooth();
  frameRate(30);
}

void draw(){
 noStroke();
 fill(rf1, rf2, rf3, 5);
 rect(0,0, height,width);



translate(mouseX, mouseY);
noFill();
stroke(1);
float x = dist(mouseX, mouseY, pmouseX, pmouseY);

float r1 = random(-10, 20);
float r2 = random(-10, 20);
float r3 = random(-5, 5);
strokeWeight(1/x);

ellipse(r1,r2, (10+r3)*(x-1) , (10+r3)*(x-1));
 
}


 void keyPressed(){
   if(key == ' '){
rf1=random(255);
rf2=random(255);
rf3=random(255);
}
 }              
