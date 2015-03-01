
int xPos = 30; 
int yPos = 100;
int size = 30;
int sizeD = 50;

void setup() {

  size(800, 800);

  //board
  noStroke();
  background(255);
  rect(150, 150, 800, 800);



  //button 
  //rect(xPos,yPos,size,size);

  //gray bg
  noStroke();
  fill(230);
  rect(xPos-10, yPos-10, size+20, yPos+size+300+100+10);


  //red
  noStroke();
  fill(255, 0, 0);
  rect(xPos, yPos, size, size);


  //green
  noStroke();
  fill(0, 255, 0);
  rect(xPos, yPos+size, size, size);


  //blue
  noStroke();
  fill(0, 0, 255);
  rect(xPos, yPos+size+size, size, size);

  //purple
  noStroke();
  fill(150, 0, 255);
  rect(xPos, yPos+size+size+size+size, size, size);

  //yellow
  noStroke();
  fill(255, 255, 0);
  rect(xPos, yPos+size+size+300, size, size);


  //black
  noStroke();
  fill(0);
  rect(xPos, yPos+size+size+300+size, size, size);

  //white
  noStroke();
  fill(255);
  rect(xPos, yPos+size+size+300+size+100, size, size);
}



void draw() {


  if (mousePressed) {


    //board
    if (800 > pmouseX && 800 > mouseX && pmouseX > 150 && mouseX > 150 && 
      800 > pmouseX && 800 > mouseX && pmouseX > 30 && mouseX > 30) {

      line(pmouseX, pmouseY, mouseX, mouseY);
    }

    //red
    if ( mouseX > xPos && mouseX < xPos+size && mouseY > yPos && mouseY < yPos+size) { 
      stroke(255, 0, 0);
      strokeWeight(20);
    }

    //green
    if ( mouseX > xPos && mouseX < xPos+size && mouseY > yPos+size && mouseY < yPos+size+size) { 
      stroke(0, 255, 0);
      strokeWeight(2);
    }

    //blue
    if ( mouseX > xPos && mouseX < xPos+size && mouseY > yPos+size+size && mouseY < yPos+size+size+size) { 
      stroke(0, 0, 255);
      strokeWeight(50);
    }

    //purple
    if ( mouseX > xPos && mouseX < xPos+size && mouseY > yPos+size+size+size+size && mouseY < yPos+size+size+size+size+size) { 
      stroke(150, 0, 255);
      strokeWeight(30);
    }

    //yellow
    if ( mouseX > xPos && mouseX < xPos+size && mouseY > yPos+size+size+300 && mouseY < yPos+size+size+size+300) { 
      stroke(255, 255, 0);
      strokeWeight(10);
    }

    //black
    if ( mouseX > xPos && mouseX < xPos+size && mouseY > yPos+size+size+300+size && mouseY < yPos+size+size+size+300+size) { 
      stroke(0);
      strokeWeight(30);
    }

    //white
    if ( mouseX > xPos && mouseX < xPos+size && mouseY > yPos+size+size+300+size+100 && mouseY < yPos+size+size+size+300+size+100) { 
      stroke(255);
      strokeWeight(100);
    }





    {
    }
  }
}

