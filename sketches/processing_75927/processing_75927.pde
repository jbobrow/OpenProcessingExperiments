
int [] xpos = new int[50];
int [] ypos = new int [50];
void setup () {
  size (500,500);
  smooth ();
  
  for ( int i = 0; i< xpos.length; i++) {
    xpos[i] = 3;
    ypos[i] =1;
  }
}

void draw() {
  background (200, 50, 185);
  
  for (int i = 0; i< xpos.length-1; i++) {
    xpos[i] = xpos[i+1];
    ypos[i] = ypos[i+1];
  }
  
  xpos [xpos.length-1] = mouseX;
  ypos [ypos.length-1] = mouseY;
  for (int i = 0; i < xpos.length; i++) {
    noStroke ();
    fill (205-i*25);
      //bones;
      beginShape(); 
  vertex(xpos [i]-65,ypos [i]+55);
  vertex(xpos [i]+85,ypos [i]-5);
  vertex(xpos [i]+75,ypos [i]-20);
  vertex(xpos [i]-75,ypos [i]+40);
  endShape(CLOSE);
  //next bone
   beginShape(); 
  vertex(xpos[i]-70,ypos[i]-15);
  vertex(xpos [i]+80,ypos [i]+45);
  vertex(xpos [i]+60,ypos [i]+55);
  vertex(xpos [i]-85,ypos [i]-5);
  endShape(CLOSE);
  //bones02
  ellipse(xpos [i]-74,ypos [i]-18,15,15);
 ellipse(xpos [i]+74,ypos [i]-18,15,15);
 ellipse(xpos [i]-82,ypos [i]-5,15,15);
    ellipse(xpos [i]+82,ypos [i]-5,15,15);
     ellipse(xpos[i]+65,ypos [i]+54,15,15);
  ellipse(xpos [i]-65,ypos [i]+54,15,15);
  ellipse(xpos [i]+74,ypos [i]+40,15,15);
    ellipse(xpos [i]-74,ypos [i]+40,15,15);
  //skull
  ellipse (xpos [i], ypos [i], i,i);
       ellipse(xpos [i],ypos [i],80,80);
 rect (xpos [i]-36,ypos [i]+30,75,25);
  fill(0);
 stroke(0);
 ellipse(xpos [i]+20,ypos [i],15,35);
  ellipse(xpos [i]-20,ypos [i],15,35);
  ellipse(xpos[i],ypos [i]+25,9,10);
   //teeth;
  rect(xpos [i]-30,ypos[i]+40,60,5);
  rect(xpos [i]-20,ypos [i]+35,-3,15);
  rect(xpos [i]-10,ypos [i]+35,-3,15);
  rect(xpos [i]+5,ypos [i]+35,-3,15);
  rect(xpos [i]+20,ypos [i]+35,-3,15);
   

  }
}

