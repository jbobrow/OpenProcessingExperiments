
// Copyright Shannon Impellicceiri 2014
// Computer Arts with Processing T/H 11:30-1:30
// HW #4
// 1/27/14

// DESCRIPTION
//*********************************
// mousePressed() - 
//    changes the skater's outfit color 
// keyPressed() - 
//    left and right arrows toggle between different hats
//    any other key pressed makes snowflakes fall
// mouseWheel() - 
//    scrolling up or down makes the skater larger or smaller

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
int hatSelection; // choice of skater's hat
float outfitR;
float outfitG;
float outfitB;

// snowflakes
boolean snowflakeStart; // triggers snowflakes when true
float snowflakeAnchor; // top position of snowflake cluster
float snowflakeTempY; // temporary snowflake Y position
float[] snowflakeY = new float[7]; 
float[] snowflakeX = new float[7];
float[] snowflakeSize = new float[7];

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
  hatSelection = 0;
  outfitR = 255;
  outfitG = 100;
  outfitB = 200;
  snowflakeStart = false;

  // figure out the size of one "module" for drawing
  if(height<width){
    unit = height/15;
  }else{
    unit = width/15;
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
    fill(outfitR,outfitG,outfitB); //outfit color
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
    fill(outfitR,outfitG,outfitB); //outfit color
    ellipse(x+(.5*unit),(y-(1.5*unit)),unit/4,unit/4);
  }
  
  // Hat
  switch(hatSelection){
    case 0: 
      // draw a santa style hat
      triangle(x-(.4*unit),y-(2*unit),x+(.4*unit),y-(2*unit),x,y-(2.75*unit));
      fill(255); //white trim
      rect(x-(.5*unit),y-(2.15*unit),unit,.3*unit);
      ellipse(x,y-(2.75*unit),unit/3,unit/3);
      break;
    case 1:
      // draw a cowboy hat
      fill (175,150,150); // brown cowboy hat color
      beginShape();
        curveVertex(x+unit,y-(2.5*unit));
        curveVertex(x,y-(2.25*unit));
        curveVertex(x-unit,y-(2.5*unit));
        curveVertex(x-(1.5*unit),y-(2.25*unit));
        curveVertex(x,y-(1.75*unit));
        curveVertex(x+(1.5*unit),y-(2.25*unit));
        curveVertex(x+unit,y-(2.5*unit));
        curveVertex(x,y-(2.25*unit));
        curveVertex(x+unit,y-(2.5*unit));
      endShape();
      beginShape();
        curveVertex(x+(.25*unit),y-(3.25*unit));
        curveVertex(x,y-(3*unit));
        curveVertex(x-(.25*unit),y-(3.25*unit));
        curveVertex(x-(.5*unit),y-(2.25*unit));
        curveVertex(x,y-(2.125*unit));
        curveVertex(x+(.5*unit),y-(2.25*unit));
        curveVertex(x+(.25*unit),y-(3.25*unit));
        curveVertex(x,y-(3*unit));
        curveVertex(x-(.25*unit),y-(3.25*unit));
      endShape();
      break;
    case 2:
      // draw a top hat
      fill(10); // nearly black hat color
      ellipse(x,y-(2*unit),unit*1.5,unit/3);
      rect(x-(.5*unit),y-(3*unit),unit,unit);
      fill(outfitR,outfitG,outfitB); //outfit color
      rect(x-(.5*unit),y-(2.25*unit),unit,unit/4);
      break;
    case 3:
      // viking hat
      fill(230,210,175); // gold color
      beginShape();
        curveVertex(x+(2*unit),y-(1.625*unit));
        curveVertex(x,y-(2.625*unit));
        curveVertex(x-(.5*unit),y-(1.875*unit));
        curveVertex(x,y-(1.75*unit));
        curveVertex(x+(.5*unit),y-(1.875*unit));
        curveVertex(x,y-(2.625*unit));
        curveVertex(x-(2*unit),y-(2.125*unit));
      endShape();
      fill(255); // white horns
      beginShape();
        curveVertex(x-unit,y-(4*unit));
        curveVertex(x-unit,y-(3*unit));
        curveVertex(x-(.75*unit),y-(2.375*unit));
        curveVertex(x-(.5*unit),y-(2.275*unit));
        curveVertex(x-(.4*unit),y-(2.125*unit));
        curveVertex(x-(.5*unit),y-(1.875*unit));
        curveVertex(x-unit,y-(2.25*unit));
        curveVertex(x-unit,y-(3*unit));
        curveVertex(x-unit,y-(4*unit));
      endShape();
      beginShape();
        curveVertex(x+unit,y-(4*unit));
        curveVertex(x+unit,y-(3*unit));
        curveVertex(x+(.75*unit),y-(2.375*unit));
        curveVertex(x+(.5*unit),y-(2.275*unit));
        curveVertex(x+(.4*unit),y-(2.125*unit));
        curveVertex(x+(.5*unit),y-(1.875*unit));
        curveVertex(x+unit,y-(2.25*unit));
        curveVertex(x+unit,y-(3*unit));
        curveVertex(x+unit,y-(4*unit));
      endShape();
    case 4:
      // no hat
      break;
  }
  
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
  fill(outfitR,outfitG,outfitB); //outfit color
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
    fill(outfitR,outfitG,outfitB); //outfit color  
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
    fill(outfitR,outfitG,outfitB); //outfit color  
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
  
  // DRAW SNOWFLAKES (IF APPLICABLE)
  //*************************
  if(snowflakeStart == true){ //drop snowflakes
    // draw a snowflake
    stroke(255);
    strokeWeight(3);
    // draw snowflakes in their current position
    for(int i=0;i<7;i++){
      line(snowflakeX[i],snowflakeAnchor+snowflakeY[i],snowflakeX[i]+snowflakeSize[i],snowflakeAnchor+snowflakeY[i]);
      line(snowflakeX[i],snowflakeAnchor+snowflakeY[i],snowflakeX[i]+(snowflakeSize[i]/2),snowflakeAnchor+snowflakeY[i]+(snowflakeSize[i]*.866));
      line(snowflakeX[i],snowflakeAnchor+snowflakeY[i],snowflakeX[i]-(snowflakeSize[i]/2),snowflakeAnchor+snowflakeY[i]+(snowflakeSize[i]*.866));
      line(snowflakeX[i],snowflakeAnchor+snowflakeY[i],snowflakeX[i]-snowflakeSize[i],snowflakeAnchor+snowflakeY[i]);
      line(snowflakeX[i],snowflakeAnchor+snowflakeY[i],snowflakeX[i]-(snowflakeSize[i]/2),snowflakeAnchor+snowflakeY[i]-(snowflakeSize[i]*.866));
      line(snowflakeX[i],snowflakeAnchor+snowflakeY[i],snowflakeX[i]+(snowflakeSize[i]/2),snowflakeAnchor+snowflakeY[i]-(snowflakeSize[i]*.866));
    }
    
    // adjust snowflake vertical position (since they're falling)
    snowflakeAnchor += 3;
    
    // reset stroke
    stroke(0);
    strokeWeight(1);
    
    // check to see if snowflakes are finished falling
    if(snowflakeAnchor >= height){
      snowflakeStart = false;
    }
  }
}

// mousePressed - changes outfit color
//*********************************
void mousePressed(){
  outfitR=random(255);
  outfitG=random(255);
  outfitB=random(255);
}

// KeyPressed - left and right arrows change hat selection
//*********************************
void keyPressed(){
  // determine which action to take
  if(key == CODED && keyCode == LEFT){
    hatSelection--; // change hat
  }else if(key == CODED && keyCode == RIGHT){
    hatSelection++; // change hat
  }else{
    // trigger snowflakes to fall
    snowflakeStart = true;
    snowflakeAnchor = 0;
    snowflakeTempY = 0;
    // assign snowflake positions and sizes
    for(int i=0;i<7;i++){
      snowflakeX[i] = random(0,width);
      snowflakeSize[i] = unit/2 * random(1,3);
      snowflakeY[i] = snowflakeTempY + (1.5*snowflakeSize[i]);
      snowflakeTempY = snowflakeTempY + (3*snowflakeSize[i]);
    }
    snowflakeAnchor = - snowflakeTempY;
  }
  
  // rollover hat selection number when outside of bounds
  if(hatSelection == -1){
    hatSelection = 4;
  }else if(hatSelection == 5){
    hatSelection = 0;
  }
}

// mouseWheel - makes girl larger or smaller
//*********************************
void mouseWheel(MouseEvent event){
  float e = event.getAmount();
  unit += e;
  if(width>height){ // canvas width is bigger than the height
    if(unit>height/6){ // limit max size
      unit = height/6;
    }else if(unit<height/50){ // limit min size
      unit = height/50;
    }
  }else{ // canvas height is bigger than the width
    if(unit>width/6){
      unit = width/6;
    }else if(unit<width/50){
      unit = width/50;
    }
  }
}




