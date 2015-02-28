

void setup(){
  size(400,400);
  background(74,38,67);
  
}

void draw(){
  
  if(mousePressed == true) {
 fill(146,163,58,mouseX-mouseY);
 background(171,193,43);
} else {
fill(218,195,199,50);
background(74,38,67);
}
  
  ellipse(width/2,height/2,mouseY,mouseY);
  ellipse(width/2,height/2,mouseX,mouseX);
  ellipse(width/2,height/2,mouseY-100,mouseY-mouseX);
  ellipse(width/2,height/2,mouseY-100,mouseY-mouseX);
  
  ellipse(width/4,height/4,mouseY-100,mouseY-100);
  ellipse(width/2,height/2,mouseX+100,mouseX+100);
  ellipse(3*width/4,3*height/4,mouseY-100,mouseY-100);
  ellipse(width/2,height/2,mouseY-100,mouseY-100);
  ellipse(width/4,3*height/4,mouseY-100,mouseY-100);
  ellipse(3*width/4,height/4,mouseX-50,mouseX-50);
  ellipse(3*width/4,height/4,mouseY-100,mouseY-100);
  ellipse(width/4,height/4,mouseX-50,mouseX-50);
  ellipse(3*width/4,3*height/4,mouseX-50,mouseX-50);
  ellipse(width/4,3*height/4,mouseX-50,mouseX-50);
  
  ellipse(width/4,height/4,mouseX-100,mouseX-100);
  ellipse(width/2,height/2,mouseY+100,mouseY+100);
  ellipse(3*width/4,3*height/4,mouseX-100,mouseX-100);
  ellipse(width/2,height/2,mouseX-100,mouseX-100);
  ellipse(width/4,3*height/4,mouseX-100,mouseX-100);
  ellipse(3*width/4,height/4,mouseY,mouseY);
  ellipse(3*width/4,height/4,mouseX-100,mouseX-100);
  ellipse(width/4,height/4,mouseY,mouseY);
  ellipse(3*width/4,3*height/4,mouseY,mouseY);
  ellipse(width/4,3*height/4,mouseY,mouseY);
  
  ellipse(width/4,height/4,mouseY-100,mouseY-mouseX);
  ellipse(3*width/4,3*height/4,mouseY-100,mouseY-mouseX);
  ellipse(width/4,3*height/4,mouseY-100,mouseY-mouseX);
  ellipse(3*width/4,height/4,mouseY-100,mouseY-mouseX);
  
  ellipse(width/4,height/4,mouseY-100,mouseX-mouseY);
  ellipse(3*width/4,3*height/4,mouseY-100,mouseX-mouseY);
  ellipse(width/4,3*height/4,mouseY-100,mouseX-mouseY);
  ellipse(3*width/4,height/4,mouseY-100,mouseX-mouseY);
  


if(mousePressed == true) {
 //strokeWeight(1);
 stroke(211,223,79);
} else {
 //strokeWeight(1);
 stroke(218,195,199);
}


}



