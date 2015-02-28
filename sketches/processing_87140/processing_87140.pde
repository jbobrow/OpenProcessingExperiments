
void setup(){
  size(854,480);
  background(50);
}

void draw(){
  pushMatrix();
    translate(width/2,height/2);
//Man's Face    
   fill(255,230,180);
    beginShape();
      //eyesocket indent
      curveVertex(-110,-100);
      curveVertex(-110,-100);
      curveVertex(-108,-85);
      curveVertex(-100,-60);
      curveVertex(-115,-20);
      curveVertex(-115,80);
    //chin point (below)
      curveVertex(0,150);
      curveVertex(115,80);
      curveVertex(115,-20);
    //eyesocket indent
      curveVertex(100,-60);
      curveVertex(108,-85);
      curveVertex(110,-100);
      curveVertex(110,-100);
      endShape();
    //eyes
    fill(255);
    ellipse(-55,-65,45,30);
    ellipse(55,-65,45,30);
    //crown
    fill(255,230,180);
    arc(0,-100,220,220,radians(180),radians(360));
    //nose
    arc(0,0,35,35,radians(0),radians(180));
    fill(139,70,6);
    //left eyebrow
    arc(-30,-100,20,20,radians(270),radians(360));
    arc(-30,-100,20,20,radians(0),radians(90));
    beginShape();
      curveVertex(-30,-90);
      curveVertex(-30,-90);
      curveVertex(-75,-95);
      curveVertex(-120,-85);
      curveVertex(-120,-85);
      curveVertex(-123,-87);
      curveVertex(-75,-112);
      curveVertex(-30,-110);
      curveVertex(-30,-110);
    endShape();
   //right eyebrow
    arc(30,-100,20,20,radians(90),radians(270));
    beginShape();
      curveVertex(30,-90);
      curveVertex(30,-90);
      curveVertex(75,-95);
      curveVertex(120,-85);
      curveVertex(120,-85);
      curveVertex(123,-87);
      curveVertex(75,-112);
      curveVertex(30,-110);
      curveVertex(30,-110);
    endShape();
    //mustache
    beginShape();
      arc(0,76,288,150,radians(180),radians(360));
      curveVertex(144,75);
      curveVertex(144,75);
      curveVertex(145,115);   //tip
      curveVertex(133,120);  //first lump
      curveVertex(110,95);
      curveVertex(110,95);
    endShape();
    beginShape();    //second lump
     curveVertex(110,95);
     curveVertex(110,95);
     curveVertex(100,105);
     curveVertex(90,105);
     curveVertex(80,95);
     curveVertex(80,95);
    endShape();
    beginShape();   //third lump
      curveVertex(80,95);
      curveVertex(80,95);
      curveVertex(70,105);
      curveVertex(60,105);
      curveVertex(45,95);
      curveVertex(45,95);
    endShape();
    beginShape(); //last bump
      curveVertex(45,105);
      curveVertex(45,95);
      curveVertex(35,105);
      curveVertex(25,100);
      curveVertex(15,90);
      curveVertex(0,65);
      curveVertex(0,27);
      curveVertex(0,27);
    endShape();
    noStroke();
    quad(144,75,30,75,45,95,110,95);
   stroke(1);
 //Left half
    beginShape();
      curveVertex(-144,75);
      curveVertex(-144,75);
      curveVertex(-145,115);   //tip 2
      curveVertex(-133,120);  //first lump 2
      curveVertex(-110,95);
      curveVertex(-110,95);
    endShape();
    beginShape();    //second lump 2
     curveVertex(-110,95);
     curveVertex(-110,95);
     curveVertex(-100,105);
     curveVertex(-90,105);
     curveVertex(-80,95);
     curveVertex(-80,95);
    endShape();
    beginShape();   //third lump 2
      curveVertex(-80,95);
      curveVertex(-80,95);
      curveVertex(-70,105);
      curveVertex(-60,105);
      curveVertex(-45,95);
      curveVertex(-45,95);
    endShape();
    beginShape(); //last bump 2
      curveVertex(-45,95);
      curveVertex(-45,95);
      curveVertex(-35,105);
      curveVertex(-25,100);
      curveVertex(-15,90);
      curveVertex(0,65);
      curveVertex(0,27);
      curveVertex(0,27);
    endShape();
    noStroke();
    quad(-144,75,-30,75,-45,95,-110,95);
   stroke(1);
  //nose
    fill(255,230,180);
    arc(0,0,50,40,radians(0),radians(180));
    
  popMatrix();
}


