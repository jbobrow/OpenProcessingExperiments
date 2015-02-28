
// Copyright Shannon Impellicceiri 2014
// Computer Arts with Processing T/H 11:30-1:30
// HW #3
// 1/21/14

// DECLARE GLOBAL VARIABLES
//*********************************

// position
float x,y;
float xdist;
float ydist;
float easingCoef;
float scaleCoef;

// ice skater
float unit; // unit of size to be used for drawing
boolean facingRight; // left/right orientation of the skater
float traceTransparency; // transparency of points on skater's path

// create arrays to store the skater's recent path in x and y coordinates
float[] traceX = new float[100];
float[] traceY = new float[100];

// SETUP FUNCTION
//*********************************
void setup()
{
  // background
  size(600,400);
  
  // initial parameters
  easingCoef = .05;
  facingRight = true;
  x=mouseX;
  y=mouseY;

  // figure out the size of one "module" for drawing
  if(height<width){
    unit = height/15;
  }else{
    unit = width/15;
  }
  
  //initialize the arrays
  for(int i=0;i<99;i++){
    traceX[i]=width/2;
    traceY[i]=height/2;
  }
}

// DRAW FUNCTION
//*********************************
void draw()
{
  // background
  noStroke();
  fill(180,220,255);
  rect(0,0,width,height);
  
  // DRAW THE FIGURE SKATER
  //*************************
  
  // easing position
  xdist = mouseX-x;
  ydist = mouseY-y;
  x=x+xdist*easingCoef;
  y=y+ydist*easingCoef;
  
  // Figure out whether she's facing left or right
  if(pmouseX>mouseX){
    facingRight = false;
  }else if(pmouseX<mouseX){
    facingRight = true;
  }
  
  // Head
  stroke(0);
  strokeWeight(1);
  fill(255,220,220); //skin color
  ellipse(x,(y-(1.5*unit)),unit,unit);
  
  // Hair
  fill(150,100,100); //hair color
  if(facingRight==true){
    arc(x,(y-(1.5*unit)),unit,unit,.7*PI,1.7*PI);
    arc(x-(.8*unit),(y-(1.5*unit)),unit/2,unit/2,PI,2*PI);
    beginShape();
      vertex(x-(1.05*unit),(y-(1.5*unit)));
      vertex(x-(1.3*unit),(y-unit));
      vertex(x-(.8*unit),(y-unit));
      vertex(x-(.55*unit),(y-(1.5*unit)));
    endShape();
    fill(255,100,200); //dress color
    ellipse(x-(.5*unit),(y-(1.5*unit)),unit/4,unit/4);
  }else{
    arc(x,(y-(1.5*unit)),unit,unit,1.3*PI,2.3*PI);
    arc(x+(.8*unit),(y-(1.5*unit)),unit/2,unit/2,PI,2*PI);
    beginShape();
      vertex(x+(1.05*unit),(y-(1.5*unit)));
      vertex(x+(1.3*unit),(y-unit));
      vertex(x+(.8*unit),(y-unit));
      vertex(x+(.55*unit),(y-(1.5*unit)));
    endShape();
    fill(255,100,200); //dress color
    ellipse(x+(.5*unit),(y-(1.5*unit)),unit/4,unit/4);
  }
  
  // Hat
  triangle(x-(.4*unit),y-(2*unit),x+(.4*unit),y-(2*unit),x,y-(2.75*unit));
  fill(255); //white trim
  rect(x-(.5*unit),y-(2.15*unit),unit,.3*unit);
  ellipse(x,y-(2.75*unit),unit/3,unit/3);
  
  // Legs
  fill(255,220,220); //skin color
  if(facingRight==true){
    beginShape(); // leg 1
      vertex(x-(.125*unit),y+(.5*unit));
      vertex(x+(.125*unit),y+(1.34*unit));
      vertex(x-(.125*unit),y+(2*unit));
      vertex(x+(.325*unit),y+(2*unit));
      vertex(x+(.625*unit),y+(1.34*unit));
      vertex(x+(.375*unit),y+(.5*unit));
    endShape();
    beginShape(); // leg 2
      vertex(x+(.125*unit),y+(.5*unit));
      vertex(x-(.375*unit),y+(1.5*unit));
      vertex(x-(1.125*unit),y+(1.5*unit));
      vertex(x-(1.125*unit),y+(1.16*unit));
      vertex(x-(.775*unit),y+(1.16*unit));
      vertex(x-(.375*unit),y+(.5*unit));
    endShape();
  }else{
    beginShape(); // leg 1
      vertex(x+(.125*unit),y+(.5*unit));
      vertex(x-(.125*unit),y+(1.34*unit));
      vertex(x+(.125*unit),y+(2*unit));
      vertex(x-(.325*unit),y+(2*unit));
      vertex(x-(.625*unit),y+(1.34*unit));
      vertex(x-(.375*unit),y+(.5*unit));
    endShape();
    beginShape(); // leg 2
      vertex(x-(.125*unit),y+(.5*unit));
      vertex(x+(.375*unit),y+(1.5*unit));
      vertex(x+(1.125*unit),y+(1.5*unit));
      vertex(x+(1.125*unit),y+(1.16*unit));
      vertex(x+(.775*unit),y+(1.16*unit));
      vertex(x+(.375*unit),y+(.5*unit));
    endShape();
  }
  
  // Bottom skate   
  if(facingRight==true){ 
    fill(150); // gray blade
    beginShape(); // bottom skate blade
      vertex(x+(.8*unit),y+(2.75*unit));
      vertex(x+(.8*unit),y+(2.9*unit));
      vertex(x+(.5*unit),y+(2.9*unit));
      vertex(x+(.5*unit),y+(2.66*unit));
      vertex(x+(.4*unit),y+(2.66*unit));
      vertex(x+(.4*unit),y+(2.9*unit));
      vertex(x-(.2*unit),y+(2.9*unit));
      vertex(x-(.2*unit),y+(2.66*unit));
      vertex(x-(.3*unit),y+(2.66*unit));
      vertex(x-(.3*unit),y+(2.9*unit));
      vertex(x-(.6*unit),y+(2.9*unit));
      vertex(x-(.6*unit),y+(3*unit));
      vertex(x+(.8*unit),y+(3*unit)); 
    endShape();
    arc(x+(.8*unit),y+(2.875*unit),.25*unit,.25*unit,-.5*PI,.5*PI);
    fill(255); // white
    beginShape(); // bottom skate
      vertex(x+(.5*unit),y+(2.16*unit));
      vertex(x+(.35*unit),y+(2.16*unit));
      vertex(x+(.5*unit),y+(1.75*unit));
      vertex(x-(.1*unit),y+(1.75*unit));
      vertex(x-(.4*unit),y+(2.66*unit));
      vertex(x+(.5*unit),y+(2.66*unit));
    endShape();
    arc(x+(.5*unit),y+(2.41*unit),.5*unit,.5*unit,-.5*PI,.5*PI);
  }else{
    fill(150); // gray blade
    beginShape(); // bottom skate blade
      vertex(x-(.8*unit),y+(2.75*unit));
      vertex(x-(.8*unit),y+(2.9*unit));
      vertex(x-(.5*unit),y+(2.9*unit));
      vertex(x-(.5*unit),y+(2.66*unit));
      vertex(x-(.4*unit),y+(2.66*unit));
      vertex(x-(.4*unit),y+(2.9*unit));
      vertex(x+(.2*unit),y+(2.9*unit));
      vertex(x+(.2*unit),y+(2.66*unit));
      vertex(x+(.3*unit),y+(2.66*unit));
      vertex(x+(.3*unit),y+(2.9*unit));
      vertex(x+(.6*unit),y+(2.9*unit));
      vertex(x+(.6*unit),y+(3*unit));
      vertex(x-(.8*unit),y+(3*unit)); 
    endShape();
    arc(x-(.8*unit),y+(2.875*unit),.25*unit,.25*unit,.5*PI,1.5*PI);
    fill(255); // white
    beginShape(); // bottom skate
      vertex(x-(.5*unit),y+(2.16*unit));
      vertex(x-(.35*unit),y+(2.16*unit));
      vertex(x-(.5*unit),y+(1.75*unit));
      vertex(x+(.1*unit),y+(1.75*unit));
      vertex(x+(.4*unit),y+(2.66*unit));
      vertex(x-(.5*unit),y+(2.66*unit));
    endShape();
    arc(x-(.5*unit),y+(2.41*unit),.5*unit,.5*unit,.5*PI,1.5*PI);
  }
  
  // Top skate
  if(facingRight==true){
    fill(150); // gray blade
    beginShape(); // top skate blade 
      vertex(x-(2.225*unit),y+(2.3*unit));
      vertex(x-(2.375*unit),y+(2.3*unit));
      vertex(x-(2.375*unit),y+(2*unit));
      vertex(x-(2.125*unit),y+(2*unit));
      vertex(x-(2.125*unit),y+(1.9*unit));
      vertex(x-(2.375*unit),y+(1.9*unit));
      vertex(x-(2.374*unit),y+(1.3*unit));
      vertex(x-(2.125*unit),y+(1.3*unit));
      vertex(x-(2.125*unit),y+(1.2*unit));
      vertex(x-(2.375*unit),y+(1.2*unit));
      vertex(x-(2.375*unit),y+(.9*unit));
      vertex(x-(2.525*unit),y+(.9*unit));
      vertex(x-(2.525*unit),y+(2.3*unit)); 
    endShape();
    arc(x-(2.375*unit),y+(2.3*unit),.3*unit,.3*unit,0,PI);
    fill(255); // white
    beginShape(); // top skate
      vertex(x-(1.625*unit),y+(1.875*unit));//top toe
      vertex(x-(1.625*unit),y+(1.6*unit));//ankle
      vertex(x-(1.125*unit),y+(1.6*unit));// front calf
      vertex(x-(1.125*unit),y+(1.1*unit));//back calf
      vertex(x-(2.125*unit),y+(1.1*unit));//heel
      vertex(x-(2.125*unit),y+(1.875*unit));//bottom toe
    endShape();
    arc(x-(1.875*unit),y+(1.875*unit),.5*unit,.5*unit,0*PI,PI);
  }else{
    fill(150); // gray blade
    beginShape(); // top skate blade 
      vertex(x+(2.225*unit),y+(2.3*unit));
      vertex(x+(2.375*unit),y+(2.3*unit));
      vertex(x+(2.375*unit),y+(2*unit));
      vertex(x+(2.125*unit),y+(2*unit));
      vertex(x+(2.125*unit),y+(1.9*unit));
      vertex(x+(2.375*unit),y+(1.9*unit));
      vertex(x+(2.374*unit),y+(1.3*unit));
      vertex(x+(2.125*unit),y+(1.3*unit));
      vertex(x+(2.125*unit),y+(1.2*unit));
      vertex(x+(2.375*unit),y+(1.2*unit));
      vertex(x+(2.375*unit),y+(.9*unit));
      vertex(x+(2.525*unit),y+(.9*unit));
      vertex(x+(2.525*unit),y+(2.3*unit)); 
    endShape();
    arc(x+(2.375*unit),y+(2.3*unit),.3*unit,.3*unit,0,PI);
    fill(255); // white
    beginShape(); // top skate
      vertex(x+(1.625*unit),y+(1.875*unit));//top toe
      vertex(x+(1.625*unit),y+(1.6*unit));//ankle
      vertex(x+(1.125*unit),y+(1.6*unit));// front calf
      vertex(x+(1.125*unit),y+(1.1*unit));//back calf
      vertex(x+(2.125*unit),y+(1.1*unit));//heel
      vertex(x+(2.125*unit),y+(1.875*unit));//bottom toe
    endShape();
    arc(x+(1.875*unit),y+(1.875*unit),.5*unit,.5*unit,0*PI,PI);
  }
  
  // Dress
  fill(255,100,200); //dress color
  arc(x,(y-(.5*unit)),unit,unit,PI,2*PI);
  noStroke();
  rect(x-(.5*unit),y-(.5*unit),unit,.5*unit);
  quad(x-(.5*unit),y,x-(1.5*unit),y+(.5*unit),x+(1.5*unit),y+(.5*unit),x+(.5*unit),y);
  stroke(0);
  beginShape();
    curveVertex(x-(2*unit),y-(2.5*unit));
    curveVertex(x-(1.5*unit),y+(.5*unit));
    curveVertex(x+(1.5*unit),y+(.5*unit));
    curveVertex(x+(2*unit),y-(2.5*unit));
  endShape();
  noFill();
  beginShape();
    vertex(x-(.5*unit),y-(.5*unit));
    vertex(x-(.5*unit),y); 
    vertex(x-(1.5*unit),y+(.5*unit));
  endShape();  
  beginShape(); 
    vertex(x+(1.5*unit),y+(.5*unit));
    vertex(x+(.5*unit),y);
    vertex(x+(.5*unit),y-(.5*unit));
  endShape();  
  
  // Arm
  if(facingRight==true){
    fill(255,220,220); //skin color
    ellipse(x+(.125*unit),y+(.5*unit),unit/3,unit/3);
    fill(255,100,200); //dress color  
    beginShape();
      vertex(x-(.25*unit),(y-(.5*unit)));
      vertex(x-(.25*unit),y);
      vertex(x,y+(.5*unit));
      vertex(x+(.25*unit),y+(.5*unit));
      vertex(x+(.25*unit),y);
      vertex(x+(.25*unit),(y-(.5*unit)));
    endShape();
  }
  else{
    fill(255,220,220); //skin color
    ellipse(x-(.125*unit),y+(.5*unit),unit/3,unit/3);
    fill(255,100,200); //dress color  
    beginShape();
      vertex(x+(.25*unit),(y-(.5*unit)));
      vertex(x+(.25*unit),y);
      vertex(x,y+(.5*unit));
      vertex(x-(.25*unit),y+(.5*unit));
      vertex(x-(.25*unit),y);
      vertex(x-(.25*unit),(y-(.5*unit)));
    endShape();
  }
  
  // DRAW THE SKATER'S PATH
  //*************************
  // shift the stored coordinates back a spot in the array
  for(int i=99;i>0;i--){
    traceX[i]=traceX[i-1];
    traceY[i]=traceY[i-1];
  }
  // assign the current coordinates to the 0 position in the arrays
  traceX[0]=x;
  traceY[0]=y+(3*unit);
  // draw the path
  for(int j=0;j<=98;j++){
    traceTransparency=255-(255/99*j); // the end of the path will be more transparent
    stroke(100,150,255,traceTransparency);
    line(traceX[j],traceY[j],traceX[j+1],traceY[j+1]);
  }
  
}



