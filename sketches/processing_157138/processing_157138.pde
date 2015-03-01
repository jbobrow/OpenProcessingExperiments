
float angle;
int count;
float reduction;
float thick, thickL, thickR;
int sliderValue = 100;
int iteration;
//int red;

import controlP5.*;
ControlP5 cp5;
Slider2D square;

void setup() {
  reduction=0.1;
  size(800, 800);
  //  thick=1;
  iteration=0;
  pushMatrix();
  translate(0, 0);

  cp5 = new ControlP5(this);
  square = cp5.addSlider2D("Control")    //2D slider
  .setPosition(30, 40)
  .setSize(100, 100)
  .setArrayValue(new float[] {50, 50} );

    //.disableCrosshair() ;

    cp5.addSlider("thick")
    .setPosition(30, 200)
    .setRange(1, 5) ;
    
    cp5.addSlider("thickL")
    .setPosition(30, 230)
    .setRange(0, 5) ;
    
    cp5.addSlider("thickR")
    .setPosition(30, 260)
    .setRange(0, 5) ;
    
   
  popMatrix();
//   cp5.addSlider("red")
//    .setPosition(30, 290)
//    .setRange(1, 255) ;
//red=255;
}

void draw() {
  background(50);
  frameRate(30);
  stroke(255);

  //  count = (int) map(mouseX,0,800,0,200);
  //  reduction = map(mouseY,0,800,0.01,0.66);

  if ((mousePressed) && ( mouseX>=30) && (mouseX<=130) && (mouseY >= 30) && (mouseY<=130)) //2D Slider
  { 
    count = (int) map(mouseX, 30, 130, 50, 200);
    reduction = map(mouseX, 30, 130, 0.01, 0.66);
    angle = map(mouseY, 30, 130, 0, (90*PI/180));
    //   println(mouseX);
  }

  // reduction =sliderValue;
//  println(thick);





  //  angle = (30*PI/180);


  translate(width/2, height/2);  //Reposition coordinate axis
  line(0, 0, -80, 0);    // Draw Trunk
  translate(-80, 0);    // Move to end pt.
  rotate(-90*PI/180);
  branch(count);

  translate(0, 160);
  line(0, -80, 0, 0);
  rotate(180*PI/180);
  branch(count);

  translate(-400, 480);    //------------ position slider
  rotate(-90*PI/180);
}

void branch(float h) {

  h*= reduction;
//  thick*=reduction;
//  stroke(red,0,255);
//  thick*=reduction;
  //  print(thick);
//  thickL=1;
//  thickR=1;
  //angle=random(0,PI/3);
  //  angle=mouseY;
  //angle=angle*reduction;



  if (h > 3) {   //EXit condition
    pushMatrix();    //Save State
//    red*=reduction;
    rotate(angle);       // Left side recursion
    
//    if (iteration<50){
//    stroke(0,0,255);}
//    else{stroke(0,255,0);}
    strokeWeight(thick+thickL);
//    iteration++;
//     print(red);
    line(0, 0, 0, -h);  // Branch
    translate(0, -h); // End of the branch
      
      branch(h);       // More branches
    popMatrix();     //Original State

    //---------------// Right side recursion
    pushMatrix();
    rotate(-angle);
    strokeWeight(thick+thickR);
    line(0, 0, 0, -h);
    translate(0, -h);

    branch(h);
    popMatrix();
  }
    
}



