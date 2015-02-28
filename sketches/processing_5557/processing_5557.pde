
float outRad = 7;
float innerRad = (((outRad/(2*PI))-(.1666666)) * (2*PI));
float outerSpacing = (.75);
float outerDivisions = outRad/outerSpacing;
float innerSegments = innerRad/outerDivisions;
PFont font;

void setup(){
  size (330,330);
  smooth();
  font = loadFont("HelveticaNeue-Light-36.vlw"); 
}

void draw(){
background(0);

//outer circle
stroke(255,10,255);
fill(0);
ellipse(70,70,outRad*20,outRad*20);

//inner circle
stroke(255,255,10);
ellipse(70,70,innerRad*20,innerRad*20);

//up radius Button
rectMode(CENTER);
fill(10,100,255);
rect(230,40,50,50);
//down
rect(230,95,50,50);

//outer text
fill(255,10,255);
textFont(font,36); 
text("outer:  " + outRad + " ft", 15, 200);

//inner text
fill(255,255,10);
textFont(font,36); 
text("inner:  " + (innerSegments * 12) + " in", 15, 230);

}

void mousePressed(){
  if(mouseX > 205 && mouseX < 255 && mouseY > 15 && mouseY < 65){
     outRad = outRad + .1;
  }else if(mouseX > 205 && mouseX < 255 && mouseY > 70 && mouseY < 120){
    outRad = outRad - .1;
  }
   innerRad = (((outRad/(2*PI))-(.1666666)) * (2*PI));
   outerSpacing = (.75);
   outerDivisions = outRad/outerSpacing;
   innerSegments = innerRad/outerDivisions;
}





