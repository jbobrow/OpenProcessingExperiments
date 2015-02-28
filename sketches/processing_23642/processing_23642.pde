
import processing.pdf.*;

///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 50;
int patternSeperationY = 50;


void setup(){
  size(500,500);
  //beginRecord(PDF,"final.pdf");
  smooth();
  
  //the white box simply shows you the space your pattern gets drawn in
  fill(255);
  noStroke();
  rect(0,0,patternSeperationX,patternSeperationY);
  stroke(0);
  background(255);
  
  for(int i = -1; i < width/patternSeperationX+2; i++){
      for(int j = -1; j < height/patternSeperationY+2; j++){
        pushMatrix();
        translate(i*patternSeperationX, j*patternSeperationY);
        //rotate(0.785398163);
        scale(0.5);
        
        //drawCircles();
        yourFunction();
        //scale(0.5);
        popMatrix();
      }
  }
 // endRecord();
  
}

void drawCircles (){
    int xpos = 0;
  int ypos = 0;
  int sizex = 20;
  int sizey = 20;
  int randColour = 4; 
  int grid = 10;
 
  //-------------------------------------YOUR PATTERN GOES IN HERE-------------------------------
  //try making pleasant designs :-)


  for (int i = 0; i < 10; i++){
    for(int j = 0; j < 10; j++){
     // rect (xpos,ypos, 12,12);
       if (round(random(randColour)) == 1) { 
         fill(255, 139, 253, random(0, 255));
         stroke(0, 0);
         ellipse(xpos, ypos, sizex,sizey);
         ypos += 10;
       }else if (round(random(randColour)) == 2){
         fill(191, 0, 6, random(0, 255));
         stroke(0, 0);
         ellipse(xpos, ypos, sizex,sizey);
         ypos += 10;
       }else {
         fill(145, 216,252, random(0, 255));
         stroke(0, 0);
         ellipse(xpos, ypos,sizex,sizey);
         ypos += 10;
       }
    }
   xpos += 10;
   ypos = 0;
  }
  loadPixels();
  
  for(int i = 0; i < pixels.length; i++){
   pixels[i] = red(pixels[i]) <= 130 ? pixels[i] : color(255);  
  }
  
  updatePixels(); 
}

void draw()
{
  //This is here so the program keeps running and the screengrab will work
}


void yourFunction(){
  
  //-------------------------------------YOUR PATTERN GOES IN HERE-------------------------------
  //try making pleasant designs :-)
  int trans = 255;
  
   drawLineH (10,10,90, trans );
  drawLineH (10,90,90,trans );
  
  drawLineV (10,10,90, trans );
  drawLineV (90,10,90, trans );
  
  drawLineH (60,40,140,trans );
  drawLineH (60,60,140,trans );
  
  drawLineV (60,60,140,trans );
  drawLineV (140,60,140,trans );
  
  drawLineH (25,25,75,trans );
  drawLineH (25,75,75,trans );
  
  drawLineV (25,25,75, trans );
  drawLineV (75,25,75, trans );
  
}

void drawLineH(int sx, int sy, int ex, int trans){
  int choice = 1;
  int newChoice = 0;
  int lx = 0;
  int distX = 5;
  int distY = 1;
  int weight = 1;


  stroke(0,trans);
  while((sx+lx)<ex){
     if (choice == 0){ 
       newChoice = round(random(1));
     }else if(choice == 1){
       newChoice = round(random(2));
     }else{
       newChoice = round(random(1,2));
     }
     
     if (weight < 4 && weight > 1){
       weight += round(random(-1,1));
     }else if(weight == 1){
       weight += round(random(0,1));
     }else if (weight == 4){
       weight += round(random(-1,0));
     }
    // print(weight);
  
     strokeWeight(weight);
     line (sx+lx, sy+(choice*distY), sx+lx+distX, sy + (newChoice*distY));
  
    
    
    choice = newChoice;
    lx += distX;
    
   }
  
}

void drawLineV(int sx, int sy, int ey, int trans){
  int choice = 1;
  int newChoice = 0;
  int ly = 0;
  int distX = 1;
  int distY = 5;
  int weight = 1;


  stroke(0,trans);
  while((sy+ly)<ey){
     if (choice == 0){ 
       newChoice = round(random(1));
     }else if(choice == 1){
       newChoice = round(random(2));
     }else{
       newChoice = round(random(1,2));
     }
     
     if (weight < 4 && weight > 1){
       weight += round(random(-1,1));
     }else if(weight == 1){
       weight += round(random(0,1));
     }else if (weight == 4){
       weight += round(random(-1,0));
     }
    // print(weight);
  
     strokeWeight(weight);
     
     line (sx+(choice*distX),sy+ly, sx + (newChoice*distX),sy+ly+distY);
    
    
    choice = newChoice;
    ly += distY;
    
   }
  
}

void keyPressed()
//Takes PNG screenshots when you push S
//Careful - doesn't prompt when overwriting files!
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

