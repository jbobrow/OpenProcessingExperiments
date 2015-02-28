
/*

 Glimpse
 
 Glimpse is a creative way to display a score of notes played inside a dynamic music pentagram.
 Using random positions (for width and height) and mapping your keyboard, it’s possible to write notes
 and hear the sound of them on a stage. Notes are linked with lines and have different colors and sizes
 depending on the pressing time of the key.
 
 Ruggero Baracco - Nicola Gubernale - Alessandro Mattiuzzo
 18.10.2012

 Version 1.0
 
 Library
 - Soundlib soundcipher

*/


// defines ArrayLists for each objects and actions
ArrayList<Integer> pencilX = new ArrayList<Integer>();
ArrayList<Integer> pencilY = new ArrayList<Integer>();
ArrayList<Integer> pencilActive = new ArrayList<Integer>();
ArrayList<Integer> colorshapeR = new ArrayList<Integer>();
ArrayList<Integer> colorshapeG = new ArrayList<Integer>();
ArrayList<Integer> colorshapeB = new ArrayList<Integer>();
ArrayList<Integer> increase = new ArrayList<Integer>();

ArrayList<Float> moving = new ArrayList<Float>();
ArrayList<Float> moving2 = new ArrayList<Float>();
ArrayList<Float> xOffs = new ArrayList<Float>();
ArrayList<Float> yOffs = new ArrayList<Float>();
ArrayList<Float> increments = new ArrayList<Float>();
ArrayList<Float> rotating = new ArrayList<Float>();

int timer = 0;
float angle = 0;





void draw() {


  // defines the loop to draw the notes
  for (int i = 0; i < pencilX.size(); i++) {

    pushMatrix();
    
    translate(0, 0);

    noStroke();
    fill(0, 30);
    rect(0, 0, width, height);

    // sets the flating of ellipses and lines 
    moving.set(i, noise(xOffs.get(i)) * width/10);
    moving2.set(i, noise(yOffs.get(i)) * height/10);

    // draws lines between the ellipses
    if (i>0) {
      stroke(colorshapeR.get(i-1), colorshapeG.get(i-1), colorshapeB.get(i-1));
      strokeWeight(1);
      line(pencilX.get(i-1) + moving.get(i-1), pencilY.get(i-1) + moving2.get(i-1), pencilX.get(i) + moving.get(i), pencilY.get(i)+ moving2.get(i));
    }
    
    // draws the internal fixed ellipses
    noStroke();
    fill(colorshapeR.get(i), colorshapeG.get(i), colorshapeB.get(i));
    ellipse(pencilX.get(i) + moving.get(i), pencilY.get(i) + moving2.get(i), 20, 20);
    
    // draws the increasing ellipses
    noStroke();
    fill(colorshapeR.get(i), colorshapeG.get(i), colorshapeB.get(i), 100);
    ellipse(pencilX.get(i) + moving.get(i), pencilY.get(i)+ moving2.get(i), 20 + increase.get(i), 20 + increase.get(i));
    
    // draws the external increasing ellipses
    noFill();
    stroke(colorshapeR.get(i), colorshapeG.get(i), colorshapeB.get(i));
    strokeWeight(1);
    ellipse(pencilX.get(i) + moving.get(i), pencilY.get(i) + moving2.get(i), 30 + increase.get(i), 30 + increase.get(i));

    /*
    fill(255);
     text(i, pencilX.get(i) + moving.get(i), pencilY.get(i), 30 + increase.get(i));
     */
    
    // sets the variables for the floating
    xOffs.set(i, xOffs.get(i)+increments.get(i));
    yOffs.set(i, yOffs.get(i)+increments.get(i));

    // translate the coordinates system on each ellipse
    translate(pencilX.get(i)+ moving.get(i), pencilY.get(i)+ moving2.get(i));

    // defines the rotation
    rotate(rotating.get(i));

    // draws the small rotating ellipses
    fill(colorshapeR.get(i), colorshapeG.get(i), colorshapeB.get(i));
    noStroke();
    ellipse(0, (30 + increase.get(i))/2, 10, 10);
    
    // increases the angle value to do the rotation
    rotating.set(i, rotating.get(i)+ radians(random(1)) );

    popMatrix();
  }  

  if (keyPressed) {
    // defines the increment when a key is pressed
    if (key=='a' || key=='w' || key=='s' || key=='e' || key=='d' || key=='f' || key=='t' || key=='g' || key=='y' || key=='h' || key=='u' || key=='j'|| key=='A' || key=='W' || key=='S' || key=='E' || key=='D' || key=='F' || key=='T' || key=='G' || key=='Y' || key=='H' || key=='U' || key=='J') {
      increase.set(increase.size()-1, timer);
    }
  }

  // increases timer value 
  timer++;
}

void keyReleased() {
  
   timer=0;
}

void keyPressed() {

   timer = 0;

  // sets the values of the ArrayLists for the animation when a key is pressed 
  if (key=='a' || key=='w' || key=='s' || key=='e' || key=='d' || key=='f' || key=='t' || key=='g' || key=='y' || key=='h' || key=='u' || key=='j'|| key=='A' || key=='W' || key=='S' || key=='E' || key=='D' || key=='F' || key=='T' || key=='G' || key=='Y' || key=='H' || key=='U' || key=='J') {

    pencilX.add(int(random(20, width-100)));
    pencilY.add(int(random(20, height-100)));
    increase.add(0);
    moving.add(float(0));
    moving2.add(float(0));
    xOffs.add(float(0));
    yOffs.add(float(0));
    increments.add(random(-0.006, 0.006));
    rotating.add(random(-0.7, 0.7));
   
   // when there are 20 ellipses on the sketch it removes the oldest one 
   if (pencilX.size() > 20) {
      pencilX.remove(pencilX.size() - 20);
      pencilY.remove(pencilY.size() - 20);
      increase.remove(increase.size() - 20);
      moving.remove(moving.size() - 20);
      moving2.remove(moving2.size() - 20);
      xOffs.remove(xOffs.size() - 20);
      yOffs.remove(yOffs.size()- 20);
      increments.remove(increments.size() - 20);
      colorshapeR.remove(colorshapeR.size() - 20);
      colorshapeG.remove(colorshapeG.size() - 20);
      colorshapeB.remove(colorshapeB.size() - 20);
      
      pencilX.remove(0);
      pencilY.remove(0);
      increase.remove(0);
      moving.remove(0);
      moving2.remove(0);
      xOffs.remove(0);
      yOffs.remove(0);
      increments.remove(0);
      colorshapeR.remove(0);
      colorshapeG.remove(0);
      colorshapeB.remove(0);
    }

    //println(pencilX.size()-1);
  }
  
  // defines colors and notes
  if (key=='a' || key=='A') {

    colorshapeR.add(0);
    colorshapeG.add(51);
    colorshapeB.add(255);

  }

  if (key=='w' || key=='W') {
    colorshapeR.add(153);
    colorshapeG.add(102);
    colorshapeB.add(255);

  }

  if (key=='s' || key=='S') {
    colorshapeR.add(0);
    colorshapeG.add(153);
    colorshapeB.add(0);

  }

  if (key=='e' || key=='E') {
    colorshapeR.add(255);
    colorshapeG.add(51);
    colorshapeB.add(0);

  }

  if (key=='d' || key=='D') {
    colorshapeR.add(255);
    colorshapeG.add(51);
    colorshapeB.add(255);

  }

  if (key=='f' || key=='F') {
    colorshapeR.add(255);
    colorshapeG.add(153);
    colorshapeB.add(51);

  }

  if (key=='t' || key=='T') {
    colorshapeR.add(51);
    colorshapeG.add(204);
    colorshapeB.add(255);

  }

  if (key=='g' || key=='G') {
    colorshapeR.add(255);
    colorshapeG.add(153);
    colorshapeB.add(255);

  }

  if (key=='y' || key=='Y') {
    colorshapeR.add(255);
    colorshapeG.add(255);
    colorshapeB.add(0);

  }

  if (key=='h' || key=='H') {
    colorshapeR.add(102);
    colorshapeG.add(153);
    colorshapeB.add(102);

  }

  if (key=='u' || key=='U') {
    colorshapeR.add(153);
    colorshapeG.add(255);
    colorshapeB.add(255);

  }

  if (key=='j' || key=='J') {
    colorshapeR.add(255);
    colorshapeG.add(255);
    colorshapeB.add(204);

  }
}

void setup() {
  size(960, 720, P2D);
  smooth(4);
  background(0);
}


