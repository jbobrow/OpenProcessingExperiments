
void setup() {
  size(640, 640);
  background(127);
  smooth();
}

void draw(){

  strokeWeight(abs(mouseY-pmouseY));
  int a = abs(mouseX-pmouseX);
  stroke(random(25)*a,50,random(255));
  fill(random(25)*a,50,random(255));
  
  if(mouseX<320){if(mouseY<320){line(mouseX+random(30), mouseY+random(30), -2*pmouseX+(920)+random(30), -2*pmouseY+(920)+random(30));}
else{ellipse(mouseX+random(30), mouseY+random(30), -2*pmouseX+(920)+random(30), -2*pmouseY+(920)+random(30));}}
  
  if(mouseX>320){if(mouseY>320){rect(mouseX+random(30), mouseY+random(30), -2*pmouseX+(920)+random(30), -2*pmouseY+(920)+random(30));}
else{triangle(mouseX+random(30), mouseY+random(30), -2*pmouseX+(920)+random(30), -2*pmouseY+(920)+random(30),mouseX+random(30), mouseY+random(30));}}
  
   
}
