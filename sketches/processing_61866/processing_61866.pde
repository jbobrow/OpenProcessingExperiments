
int[] xpos = new int[50]; 
int[] ypos = new int[50];


void setup(){
  size(350, 530);
  smooth();
  for (int i = 0; i < xpos.length; i ++ ) {
    xpos[i] = 0; 
    ypos[i] = 0;
  }
}

void draw(){
  background(255);  
  noStroke();
  if (mouseX < 350 && mouseX > 200 && mouseY < 400 && mouseY > 250){
      
      //top background
      fill(223, 229, 243);
      stroke(4, 7, 50);
      strokeWeight(25);
      ellipse(165, 150, 275, 250);
      //top foreground
      fill(223, 229, 243);
      stroke(4, 7, 50);
      strokeWeight(5);
      ellipse(145, 150, 115, 120);
      //top green
      fill(62, 104, 54);
      noStroke();
      ellipse(145, 160, 35, 15);      
      //bottom left
      fill(223, 229, 243);
      stroke(4, 7, 50);
      strokeWeight(8);
      ellipse(75, 385, 120, 135);
      //bottom right background
      fill(223, 229, 243);
      stroke(4, 7, 50);
      strokeWeight(1);
      ellipse(265, 430, 125, 125);
      //bottom right foreground
      fill(4, 7, 50);
      ellipse(260, 435, 55, 55);     
      //bottom middle
      fill(223, 229, 243);
      stroke(4, 7, 50);
      strokeWeight(1);
      ellipse(150, 475, 65, 70);
      //bottom blue spots
      fill(4,7,50);
      ellipse(130, 485, 17, 17);
      ellipse(145, 485, 17, 17);
      ellipse(161, 480, 17, 17);
      ellipse(165, 463, 17, 17);
}      

  if (mouseX < 350 && mouseY < 250){
      //top background
      fill(223, 229, 243);
      stroke(4, 7, 50);
      strokeWeight(25);
      ellipse(165, 150, 275, 250);
  }
      if (mouseX < 200 && mouseX > 100 && mouseY < 250){
      //top foreground
      fill(223, 229, 243);
      stroke(4, 7, 50);
      strokeWeight(5);
      ellipse(145, 150, 115, 120);
      }
      
      if (mouseX < 300 && mouseX > 150 && mouseY < 250){
      //top green
      fill(62, 104, 54);
      noStroke();
      ellipse(145, 160, 35, 15);
  }   
      
if (mouseX < 150 && mouseY > 220){      
      //bottom left
      fill(223, 229, 243);
      stroke(4, 7, 50);
      strokeWeight(8);
      ellipse(75, 385, 120, 135);
}      

if (mouseX > 250 && mouseY > 350){
      //bottom right background
      fill(223, 229, 243);
      stroke(4, 7, 50);
      strokeWeight(1);
      ellipse(265, 430, 125, 125);
}

if (mouseX > 300 && mouseY > 400){
      //bottom right foreground
      fill(4, 7, 50);
      ellipse(260, 435, 55, 55);
}

if (mouseX > 50 && mouseX < 250 && mouseY > 350){      
      //bottom middle
      fill(223, 229, 243);
      stroke(4, 7, 50);
      strokeWeight(1);
      ellipse(150, 475, 65, 70);
}

if (mouseX > 150 && mouseX < 250 && mouseY > 490){
      //bottom blue spots
      fill(4,7,50);
      ellipse(130, 485, 17, 17);
      ellipse(145, 485, 17, 17);
      ellipse(161, 480, 17, 17);
      ellipse(165, 463, 17, 17);
}      

  for (int i = 0; i < xpos.length-1; i ++ ) {
    xpos[i] = xpos[i+1];
    ypos[i] = ypos[i+1];
  }
  

  xpos[xpos.length-1] = mouseX; 
  ypos[ypos.length-1] = mouseY;
  
  // Draw everything
  for (int i = 0; i < xpos.length; i ++ ) {
    noStroke();
    fill(4,7,150-i*2);
    ellipse(xpos[i],ypos[i],20-i,20-i);
  }

}

