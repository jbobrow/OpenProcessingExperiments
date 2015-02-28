
import processing.pdf.*;


int patternSeperationX = 50;
int patternSeperationY = 50;


void setup() {
  size(300,600);
  //beginRecord(PDF,"Wallpaper4.pdf");
  smooth();

 
  fill(255);
  noStroke();
  rect(0,0,patternSeperationX,patternSeperationY);
  stroke(0);
  background(255);

  for(int i = -1; i < width/patternSeperationX+2; i++) {
    for(int j = -1; j < height/patternSeperationY+2; j++) {
      pushMatrix();
      
      translate(i*patternSeperationX, j*patternSeperationY);
      drawCircles();
      
      //drawSquares();
      rotate(0.785398163);
      scale(0.5);
      fill(255);
      stroke(255);
      strokeWeight (random(2));
      ellipse(70,70,5,5);
      strokeWeight (random(2));
      ellipse(70,0,5,5);
      strokeWeight (random(2));
      ellipse(60,10,5,5);
      strokeWeight (random(2));
      ellipse(60,-10,5,5);
      strokeWeight (random(2));
       ellipse(80,-10,5,5);
       strokeWeight (random(2));
       ellipse(80,10,5,5);
       strokeWeight (random(2));
      
     
      yourFunction();
      scale(0.5);
      popMatrix();
    } 
    
    /*This is th loop to make a faded effect on the print
    for (int j = 0; j< 10; j++){
      fade(round(random(1000)), 0);
      s
    }
    for (int k = 0; k< 10; k++){
      fade(round(random(1000)), 2000);
      
    }
     for (int l = 0; l< 10; l++){
      fade(0, round(random(2000)));
      
    }
    for (int m = 0; m< 10; m++){
      fade(300,round(random(600)));
      
    }*/
  }
   endRecord();
}

/////// This funtion draws the gridded circles in the background
void drawCircles () {
  int xpos = 0;
  int ypos = 0;
  int sizex = 10;
  int sizey = 10;
  int randColour = 10; 
  float grid = 5;

/// these loops make the colours random but more of the last colour
  for (int i = 0; i < 10; i++) {
    for(int j = 0; j < 10; j++) {
      // rect (xpos,ypos, 12,12);
      if (round(random(randColour)) == 1) { 
        fill(0, random(100, 200));
        stroke(0, 0);
        ellipse(xpos, ypos, sizex,sizey);
        ypos += grid;
      }
      else if (round(random(randColour)) == 2) {
        fill(80,92,92, random(100, 200));
        stroke(0, 0);
        ellipse(xpos, ypos, sizex,sizey);
        ypos += grid;
      }
      else if (round(random(randColour)) == 3) {
        
        fill(30,178,224, random(100, 200));
        stroke(0, 0);
        ellipse(xpos, ypos, sizex,sizey);
        ypos += grid;
      }
      else {
        fill(34,214,149, random(100, 200));
        stroke(0, 0);
        ellipse(xpos, ypos,sizex,sizey);
        ypos += grid;
      }
    }
    xpos += grid;
    ypos = 0;
  }

}

void fade(int plcx,int plcy){
  
 
  for (int i =0; i<300; i++){
    
    plcx += random( -5,5);
    plcy += random( -5,5);
    stroke(255,100);
    fill(255,100);
    ellipse (plcx, plcy, 2, 2);
    
  }
}
// this function would draw squares in the background but the file gets to complicated for PDF
void drawSquares() {
  int xpos = 0;
  int ypos = 0;
  int sizex = 10;
  int sizey = 10;
  int randColour = 4; 
  int grid = 5;





  for (int i = 0; i < 10; i++) {
    for(int j = 0; j < 10; j++) {

      if (round(random(randColour)) == 1) { 
        fill(188,70,106, random(0, 100));
        stroke(0, 0);
        rect(xpos, ypos, sizex,sizey);
        ypos += grid;
      }
      else if (round(random(randColour)) == 2) {
        fill(188,44,86, random(0, 100));
        stroke(0, 0);
        rect(xpos, ypos, sizex,sizey);
        ypos += grid;
      }
      else {
        fill(188,22,66, random(0, 100));
        stroke(0, 0);
        rect(xpos, ypos,sizex,sizey);
        ypos += grid;
      }
    }
    xpos += grid;
    ypos = 0;
  }
 
}

void draw()
{

}


void yourFunction() {

  int trans = 255;
  
  drawLineH (10,0,60, trans );
  drawLineV (0,10,60,trans);
  
  drawLineH (10,70,60, trans );
  drawLineV (70,10,60,trans);
}

////// these two functions make the computer draw lines as a human would!!!
void drawLineH(int sx, int sy, int ex, int trans) {
  int choice = 1;
  int newChoice = 0;
  int lx = 0;
  int distX = 5;
  int distY = 1;
  int weight = 1;


  stroke(255,trans);
  while((sx+lx)<ex) {
    if (choice == 0) { 
      newChoice = round(random(1));
    }
    else if(choice == 1) {
      newChoice = round(random(2));
    }
    else {
      newChoice = round(random(1,2));
    }

    if (weight < 4 && weight > 1) {
      weight += round(random(-1,1));
    }
    else if(weight == 1) {
      weight += round(random(0,1));
    }
    else if (weight == 4) {
      weight += round(random(-1,0));
    }


    strokeWeight(weight);
    line (sx+lx, sy+(choice*distY), sx+lx+distX, sy + (newChoice*distY));



    choice = newChoice;
    lx += distX;
  }
}

void drawLineV(int sx, int sy, int ey, int trans) {
  int choice = 1;
  int newChoice = 0;
  int ly = 0;
  int distX = 1;
  int distY = 5;
  int weight = 1;


  stroke(255,trans);
  while((sy+ly)<ey) {
    if (choice == 0) { 
      newChoice = round(random(1));
    }
    else if(choice == 1) {
      newChoice = round(random(2));
    }
    else {
      newChoice = round(random(1,2));
    }

    if (weight < 4 && weight > 1) {
      weight += round(random(-1,1));
    }
    else if(weight == 1) {
      weight += round(random(0,1));
    }
    else if (weight == 4) {
      weight += round(random(-1,0));
    }


    strokeWeight(weight);

    line (sx+(choice*distX),sy+ly, sx + (newChoice*distX),sy+ly+distY);


    choice = newChoice;
    ly += distY;
  }
}

void keyPressed()
{
  if(key == 's' || key == 'S')
  {
    String filePath = selectInput("Saving PNG - Select or Type File Name");  // Opens file chooser
    if(filePath != null)
    {
      save(filePath + ".png");
    }
  }
}


