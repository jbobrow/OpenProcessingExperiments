
 float r=42;
 float g=713;
 float b=159;

 
void setup(){
  size(500, 500);
  background(255);
}

void draw(){
  background (r,g,b);
  if(mouseX > width/2){
   r=r+2;
   g=g+1;
} else {
  r=r-2;

}

if (r>255){
  r=255;
} else if (r<0){
r=0;
}
  

  noStroke ();
  fill (255);
  
  //tail
  stroke(188, 29, 60);
  strokeWeight (3);
  triangle (mouseX+214, mouseY-18, mouseX+195, mouseY-38, mouseX+175, mouseY-18);

// torso and legs 
  noStroke();
  quad (mouseX+175, mouseY+67, mouseX+55, mouseY+67, mouseX+15, mouseY-18, mouseX+215, mouseY-18);
  quad (mouseX+89, mouseY+92, mouseX+68, mouseY+92, mouseX+55, mouseY+67, mouseX+95, mouseY+67);
  quad (mouseX+175, mouseY+67, mouseX+132, mouseY+67, mouseX+143, mouseY+92, mouseX+164, mouseY+92);
  stroke(188, 29, 60);
  strokeWeight (3);
  line (mouseX+15, mouseY-18, mouseX+215, mouseY-18);
  line (mouseX+15, mouseY-18, mouseX+68, mouseY+92);
  line (mouseX+68, mouseY+92, mouseX+89, mouseY+92);
  line (mouseX+89, mouseY+92, mouseX+95, mouseY+67);
  line (mouseX+95, mouseY+67, mouseX+132, mouseY+67);
  line (mouseX+132, mouseY+67, mouseX+143, mouseY+92);
  line (mouseX+143, mouseY+92, mouseX+164, mouseY+92);
  line (mouseX+164, mouseY+92, mouseX+214, mouseY-18);
  

  noStroke ();
  
  //head
  quad(pmouseX-20, pmouseY-108, pmouseX+25, pmouseY-108, pmouseX+80, pmouseY-18, pmouseX, pmouseY+62);
  quad(pmouseX, pmouseY-108, pmouseX-25, pmouseY-108, pmouseX-80, pmouseY-18, pmouseX, pmouseY+62);
  stroke(188, 29, 60);
  strokeWeight (3);
  line (mouseX-25, mouseY-108, mouseX+25, mouseY-108);
  line (mouseX+25, mouseY-108, mouseX+80, mouseY-18);
  line (mouseX+80, mouseY-18, mouseX, mouseY+62);
  line (mouseX, mouseY+62, mouseX-80, mouseY-18);
  line (mouseX-80, mouseY-18, mouseX-25, mouseY-108);
  
  //ears
  triangle (pmouseX+100, pmouseY-73, pmouseX+80, pmouseY+2, pmouseX+25, mouseY-108);
  triangle (pmouseX-100, pmouseY-73, pmouseX-80, pmouseY+2, pmouseX-25, mouseY-108);
  
  //nose and eyes
  noStroke ();
  fill(000000);
  ellipse (pmouseX+25, pmouseY-48, 10, 13);
  ellipse (pmouseX-25, pmouseY-48, 10, 13);
  ellipse (pmouseX, pmouseY, 15, 15);
 
}















