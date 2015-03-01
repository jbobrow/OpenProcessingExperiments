
int xPos=50;
int yPos=100;
int S=30;
int Q= 10;
int R=15;



void setup() {



  size(800, 600);
  background(0);

  rect(100, 0, 700, 600);


noStroke();
smooth();

  fill(255, 0, 0);
  ellipse(xPos, yPos, S, S); 

  fill(0, 255, 0);
  ellipse(xPos, yPos+S+Q, S, S);


  fill(0, 0, 255);
  ellipse(xPos, yPos+S+S+Q+Q, S, S);

  rectMode(CENTER);
  fill(255, 0, 0);
  rect(xPos, yPos+150, S, S);

  fill(0, 255, 0);
  rect(xPos, yPos+200, S, S);

  fill(0, 0, 255);
  rect(xPos, yPos+250, S, S);
  
    fill(255, 0, 0,100);
  ellipse(xPos, yPos+320, S, S); 
  
      fill(0, 255, 0,100);
  ellipse(xPos, yPos+360, S, S); 
  
        fill(0, 0, 255,100);
  ellipse(xPos, yPos+400, S, S); 
  
  fill(255,255,255);
  rect(xPos, yPos + 450, S,S);
  
  
  
  
}



void draw() {

  //button


  if (mousePressed) {

    if (mouseX > 120 && mouseX <780  && mouseY > 20 && mouseY< 580 ) {

      //stroke(0,0,0);
      //strokeWeight(5);
      line( pmouseX, pmouseY, mouseX, mouseY);
    }
    //if (mouseX > 100 && mouseX <130 && mouseY > 100 && mouseY< 130 ) {
    if (mouseX > xPos - R && mouseX <xPos +R && mouseY > yPos && mouseY< yPos + S ) {

      stroke(255, 0, 0);
      strokeWeight(10);
    }

    if (mouseX > xPos -R && mouseX <xPos + R && mouseY > yPos+S && mouseY< yPos + S +S+Q+Q ) {

      stroke(0, 255, 0);
      strokeWeight(10);
    }

    if (mouseX > xPos -R && mouseX <xPos + R && mouseY > yPos+S+S && mouseY< yPos + S +S +S ) {

      stroke(0, 0, 255);
      strokeWeight(10);
    }
    
        if (mouseX > xPos -R && mouseX <xPos + R && mouseY > yPos + 150 && mouseY< yPos + 180 ) {

      stroke(255, 0, 0);
      strokeWeight(10);
    }
    
            if (mouseX > xPos -R && mouseX <xPos + R && mouseY > yPos + 200 && mouseY< yPos + 230 ) {

      stroke(0, 255, 0);
      strokeWeight(10);
    }
    
                if (mouseX > xPos -R && mouseX <xPos + R && mouseY > yPos + 250 && mouseY< yPos + 280 ) {

      stroke(0, 0, 255);
      strokeWeight(10);
    }
    
     if (mouseX > xPos -R && mouseX <xPos + R && mouseY > yPos + 250 && mouseY< yPos + 280 ) {

    stroke(0, 255, 0);
      strokeWeight(10);
    }
    
       if (mouseX > xPos -R && mouseX <xPos + R && mouseY > yPos + 320 && mouseY< yPos + 350 ) {

   stroke(255, 0,0, 100);
      strokeWeight(10);
    }
    
       if (mouseX > xPos -R && mouseX <xPos + R && mouseY > yPos + 360 && mouseY< yPos + 390 ) {

   stroke(0, 255, 0,100);
      strokeWeight(10);
    }
    
       if (mouseX > xPos -R && mouseX <xPos + R && mouseY > yPos + 400 && mouseY< yPos +430 ) {

     stroke(0, 0, 255,100);
      strokeWeight(10);
    }
    
       if (mouseX > xPos -R && mouseX <xPos + R && mouseY > yPos + 450 && mouseY< yPos + 480 ) {

   stroke(255, 255, 255);
      strokeWeight(20);
    }
    
  }
}

