
/* Name: Shayuan Wei, IDEA9204 Assignment 1A; 
Topic: London Olympic Victory Ceremony;
Animation:Move mouse to activate performance;
Submission date: 08/08/2012*/

float colour=255.0;
float textcolour=255.0;
String title="London 2012";
PFont victory;

//-------------------

 
void setup(){
  victory=loadFont("TimesNewRomanPS-BoldMT-48.vlw");
  textFont(victory);
  background(255);
  size(1000,700);
  stroke(255);
  strokeWeight(5);
  smooth();
  triangleAll();
}

 void triangleAll(){  
  fill(196,80,255,160);
  triangle(width*1/2+85,0,1000,0,1000,height*1/3+200); 
//draw triangle on top-right corner
  triangle(1000,height*1/2,1000,700,width*1/2,700); 
//draw triangle on bottom-right corner
  
  beginShape();
  vertex(width*1/2+420,0);
  vertex(1000,0);
  vertex(1000,700);
  vertex(width*3/4,700);
  endShape(CLOSE);
//draw quadrangle on right

  triangle(0,height*3/4-50,0,700,width/2+120,700);
//draw triangle on bottom-left

  beginShape();
  vertex(0,0);
  vertex(width*2/7,0);
  vertex(width/10,700);
  vertex(0,700);
  endShape(CLOSE);
//draw quadrangle on left

  triangle(0,height/7,0,0,width*2/3,0);
//draw triangle on top-left

}

void draw(){
}

//-------------------


void mouseMoved(){
  strokeWeight(10);
  noFill();
  smooth();
    
  ellipse(width/2-170,height*1/3,150,150);  
  stroke(255,colour,colour);
//----------Red circle


  ellipse(width/2+170,height*1/3,150,150);
  stroke(255,255,colour);
//-----------Yellow circle


  ellipse(width/2-85,height*1/3+100,150,150);
  stroke(colour,255,colour);
//------------Green circle


  ellipse(width/2+85,height*1/3+100,150,150);
  stroke(colour);
//----------Black circle


  ellipse(width/2,height*1/3,150,150);
  stroke(colour,colour,255);
//----------Blue circle

  textSize(55);
  text(title,width*1/2-130,height*2/3+30);
  fill(textcolour,colour,255,160);
    
  if (colour<=255.0){
    if (colour>=72){
    colour-=0.5;
    }
  }
  
  if (textcolour<=255.0){
    if(textcolour>=196.0){
      textcolour-=0.1;
    }
  }
}

