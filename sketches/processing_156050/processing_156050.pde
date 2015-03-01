
int x;
int y = 500;

int r = 0;
//int g = 255;

int z1 = 30;
int z2 = 30;
int z3 = 30;
PImage wiese, staengel;

void setup() {
  size(500, 500);
  
  //frameRate(20);
  
  x = width/2;
  wiese = loadImage("Wiese.jpg");
  staengel = loadImage("staengel.png");
 

  image(wiese, 0, 0);
  //println(img.width + " " + img.height);
}

void draw() {
  noStroke();

  boolean isGrowing = y > height/2;
  boolean isBlooming = z3 < height/2;

  //Stängel
  //fill(78, 167, 84);
  //ellipse(width/2, y, 20, 15);

  if (isGrowing) {
    y -= 1;
    stroke(78, 167, 84);
  } 
  else {
    stroke(216, 2, 2);

    if (isBlooming) {
      z1 += 1;
      z2 += 2;
      z3 += 3;
    }
  } 


  //Blüte

  //strokeWeight(2);


  fill(255, 45, 54);

  // old staengel
  //ellipse(x, y, z3, z3);



  // ellipse(x, y, z2, z2);
  //ellipse(x, y, z1, z1);

  image(staengel, x, y);
  //image(blumenkopf, width/2, height/2);


  if (isGrowing == false) {
    //stroke(255);
    noStroke();


    // Blüte 1
    for (int i = 0; i < 360; i = i + 45) {
      //Blütenblatt
      pushMatrix();
      // verschieben
      translate(x+10, y);

      rotate(radians(i));



      if (i == 0 || i == 90 || i == 180 || i == 270) {
        scale(3.2);
        fill(180, 18, 18);
      }
      else {
        scale(3);
        fill(227, 5, 5);
      }
      beginShape();
      curveVertex(0, 0);
      curveVertex(0, 0);
      curveVertex(10, - 20);
      curveVertex(0, - 25);
      curveVertex(-10, - 20);
      curveVertex(0, 0);
      curveVertex(0, 0);
      endShape();

      popMatrix();
    }

    // Blüte 2 
    for (int i = 45; i < 360; i = i + 90) {
      //Blütenblatt
      pushMatrix();

      // verschieben... x und y koordinaten des Blütenmittelpunktes
      translate(x+10, y);

      // rotation im Kreis
      rotate(radians(i));




      fill(224, 63, 63);

      beginShape();
      curveVertex(0, 0);
      curveVertex(0, 0);
      curveVertex(10, - 20);
      curveVertex(0, - 25);
      curveVertex(-10, - 20);
      curveVertex(0, 0);
      curveVertex(0, 0);
      endShape();

      popMatrix();
    } 

    // Blumen-Mitte()

   
    
   
    //stop();
  }
    // Blumen-Mitte()
    if(isGrowing == false) {
      colorMode(HSB); // Hue = Farbton, Saturation = Sättigung, Brightness = Helligkeit
      fill(r,255,255);
      ellipse(x+10, y, 20, 20);
      colorMode(RGB);
     
      /*fill(230, r, g);
      ellipse(x+10, y, 20, 20);*/
      r -= 1;
      //g += 1;
      
      if ( r < 1){
        r = 255; 
        //g = 0;
       } 
    }
}

