

void setup(){
  size(250,250);
background(0);
smooth();
}

void draw(){

 strokeWeight(random(3));
 noFill();
stroke(#96ff01,40);
frameRate(2);
bezier(mouseX,mouseY,random(255),random(255),random(255),random(255),0,0);

strokeWeight(random(3));
 noFill();
stroke(#fe0296,40);
frameRate(5);
bezier(mouseX,mouseY,random(255),random(255),random(255),random(255),250,250);

strokeWeight(random(3));
 noFill();
stroke(255,40);
frameRate(5);
bezier(mouseX,mouseY,random(255),random(255),random(255),random(255),125,125);

}
