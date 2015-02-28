
//Carla Campos-Rodriguez
// February 17,2013
//Divided Screen

void setup () {
  size(600, 600);
  background(255);
  smooth();
}
//square1
void draw() {
  noStroke();
  fill(28, 188, 180);
  rect(0, 0, 300, 300);
  fill(243, 129, 118, 135);//teal
  if ((mouseX>0)&&(mouseX<300))
  if ((mouseY>0)&&(mouseY<300))
    ellipse(150, 150, mouseX, mouseY);
  fill(243, 129, 118);//coral
  //if((mouseX>0)&&(mouseX<300))
  //if ((mouseY>0)&&(mouseY<300))
    ellipse(100, 100, mouseX, mouseY);
  //}
  //second square
  //fixxxxxxxxxxx

  {
    noStroke();
    fill(91, 66, 70);
    rect(300, 0, 300, 300);
    if ((mouseX<300)&&(mouseX<600)&&(mouseY>0)&&(mouseY<300)) {
      rect(300, 0, 300, 300);
    }
  }
  //fill(91, 66, 70);
  fill(243, 244, 114);
  triangle(mouseX, mouseY, 350, 180, width/2, height/2);
  fill(243, 244, 114, 120);
  noStroke();
  triangle(mouseX, mouseY, 600, 180, width/2, height/2); 
 // triangle(mouseX, mouseY, 350, 350, width/2, height/2);
  //}
  // third square

  {
   //noStroke();
    fill( 243, 244, 114);
    rect(0, 300, 300, 300);

    if ((mouseX>300)&&(mouseX<600)&&(mouseY>0)&&(mouseY<300)) {
      if (mousePressed==true) {

        fill(28, 188, 180);                    
        rect(0, 300, 300, 300);
        stroke(4);
        noFill();
        stroke(91, 66, 70);
       
        ellipse(150, 450, mouseX, mouseY);

        fill(243, 129, 118,125);
        //fill(91, 66, 70, 120);
      }

      stroke(4);
      noStroke();
      stroke(243, 129, 118);
      //rect(150, 450, 180, 180);
      ellipse(150, 450, 140, 140);
    }
  }


{
  //fourth
  noStroke();
  fill(243, 129, 118);
  rect(300, 300, 600, 600);
  if ((mouseX>300)&&(mouseX<600))
    if ((mouseY>300)&&(mouseY<600)) {
      if (mousePressed==true) {
        fill(91, 66, 70);
        rect(300, 300, 600, 600);
      }
     
      }
    }
}
