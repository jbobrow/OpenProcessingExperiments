
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

void setup() {
  setupAudio();
  size(400, 400);
}

void draw() {
  background(255);

  getVolume(); // this call fetches the mic volume for the current frame.
  float Y = map(volume, 0, 100, 2, 120);  // now we can use it for something!


  //circle shapes and neck (base shapes of face)
  smooth();
  strokeWeight(1);
  stroke(188, 130, 103);
  fill(188, 130, 103);
  rect(160, 250, 75, 200);//neck
  fill(147, 98, 76);
  noStroke();
  beginShape();
  curveVertex(150, 250);
  curveVertex(160, 265);
  curveVertex(165, 280);
  curveVertex(170, 295);
  curveVertex(175, 310);
  curveVertex(180, 335);
  curveVertex(175, 350);
  curveVertex(170, 365);
  curveVertex(165, 380);
  curveVertex(160, 395);
  curveVertex(150, 400);
  endShape();      //neck shading
  stroke(203, 140, 111);
  fill(203, 140, 111);
  ellipse(200, 150, 190, 200);//face
  ellipse(200, 185, 160, 200);//face

  //jaw
  stroke(203, 140, 111);
  fill(203, 140, 111);
  ellipse(200, 185+(Y/10), 160, 200);//face

  /*eyes
   fill(255);
   ellipse(155, 145, 30, 20);
   ellipse(235, 145, 30, 20);
   
   fill(90, 142, 60);
   ellipse(158, 145, 15, 15);
   ellipse(238, 145, 15, 15);
   
   fill(30);
   ellipse(159, 146, 10, 10);
   ellipse(239, 146, 10, 10);
   */

  //mouth for the original drawing. copy and pasted
  //on the next set of code and used Golan's code to re-do this down below.. 
  //noStroke();
  //fill(50);
  //ellipse(200, 245, 75, 30);


  //mustache
  noStroke();
  fill(255);
  arc(200, 230, 50, 25, PI, TWO_PI);

  //nose
  stroke(147, 98, 76);
  strokeWeight(3);
  //strokeJoin(ROUND);
  fill(147, 98, 76);
  triangle(200, 120, 215, 210, 200, 225);


  //t-shirt
  noStroke();
  fill(52, 69, 245);
  quad(50, 350, 160, 300, 235, 300, 350, 350);
  rect(50, 350, 300, 50);

  //flower-hat
  fill(255);
  stroke(50);
  strokeWeight(5);
  arc(200, 111-(Y/25), 178, 150, PI, TWO_PI);
  stroke(50);
  strokeWeight(6);
  line(50, 111-(Y/25), 350, 111-(Y/25));
  stroke(56, 16, 62);
  fill(112, 55, 118);
  arc(125, 100-(Y/25), 100, 100, PI, PI+(PI/4));
  arc(125, 100-(Y/25), 100, 80, (PI*(3/4)), PI);
  arc(125, 100-(Y/25), 100, 100, PI, TWO_PI);
  fill(255, 247, 0);
  ellipse(125, 100, 20, 20);



  //getVolume(); // this call fetches the mic volume for the current frame.
  //float Y = map(volume, 0, 100, 2, 120);  // now we can use it for something!

  //mouth
  noStroke();
  fill(50);
  ellipse(200, 245, 75, Y-20); 

  // The rest of the code just draws the Eye:

  //LEFT EYE
  //white
  float ex = 155;
  float ey = 145;
  fill(255);
  ellipse(ex, ey, 30, 20);

  //iris
  fill(90, 142, 60);
  float dxiris = constrain((mouseX-ex)/28, -14, 14);
  float dyiris = constrain((mouseY-ey)/28, -14, 14);
  ellipse(ex+dxiris, ey+dyiris, 15, 15);

  //retina
  fill(0);
  float dx = constrain((mouseX-ex)/28, -14, 14);
  float dy = constrain((mouseY-ey)/28, -14, 14);
  ellipse(ex+dx, ey+dy, 10, 10);

  //RIGHT EYE
  //white
  float exx = 235;
  float eyy = 145;
  fill(255);
  ellipse(exx, eyy, 30, 20);

  //iris
  fill(90, 142, 60);
  float dxiristwo = constrain((mouseX-exx)/28, -14, 14);
  float dyiristwo = constrain((mouseY-eyy)/28, -14, 14);
  ellipse(exx+dxiristwo, eyy+dyiristwo, 15, 15);


  //retina
  fill(0);
  float dxx = constrain((mouseX-exx)/28, -14, 14);
  float dyy = constrain((mouseY-eyy)/28, -14, 14);
  ellipse(exx+dxx, eyy+dyy, 10, 10);

  
}


