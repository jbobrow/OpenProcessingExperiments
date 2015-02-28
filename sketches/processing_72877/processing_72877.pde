
//bright and crazy drawing program
//comment on the gradients. I am enjoying the suprises of tweeking code for results.
//Monday September 24, 2012
//done with instruction in class. much appreciation to following into this.
//http://processing.org/reference/ellipse_.html

float myColor;


void setup(){
    size(1280,720);
    smooth();
    colorMode(HSB,360,100,100,100);
    myColor = mouseX&mouseY;
    strokeWeight(2);
    background(0,0,10);
}

void draw(){
  
  myColor += 5;
  stroke(mouseX,60,100,30);
  if(mousePressed){
  vertex(3,3,mouseY+3,mouseX);
  line(mouseX-myColor*7,height, mouseX,mouseY);
  fill(120,20,200,50);
  ellipse(mouseX,mouseY*2,mouseX,mouseY);
  strokeWeight(myColor);
  ellipse(width-myColor+.70,5, 0,800);
  myColor += 3;
  line(myColor*3+myColor,myColor*200,mouseX,mouseY);
  }
}

/*
//no markings left behind.
//grey and white sphere and triangle drawing program
//Alexander Werdmuller von Elgg 


void setup(){
    size(600,400);
    smooth();
}

void draw(){
  background(220);
   if(mousePressed){
     noStroke();
     beginShape();
      vertex(mouseX,mouseY);
      vertex(pmouseX,pmouseY);
      vertex(10,10);
      vertex(500,300);
    endShape();
    
  line(pmouseX,pmouseY,mouseX,mouseY);
  
  ellipse(mouseX*2-mouseY,mouseY*2-mouseX,40,40/2);
  }
}

*/

/*
//third draft drawing program
//comment on the gradients. I am enjoying the suprises of tweeking code for results.
//Monday September 24, 2012
//done with instruction in class. much appreciation to following into this.
//bezier drawing tool.

float myColor;
int myVar;
int dir;


void setup(){
    size(1280,720);
    smooth();
    myColor += 10;
    myVar = 0;
    dir = 0;
    
}

void draw(){
  colorMode(HSB,mouseX*mouseY,100,mouseY+pmouseY,100);
  strokeWeight(myVar);
  background(10,10,10);
if(mousePressed){
  line(mouseX&mouseY;,mouseX&mouseY;,mouseX&mouseY;,mouseX&mouseY;);
  bezier(mouseX,mouseY,mouseX,pmouseY*2,mouseX/2,pmouseY/4,mouseX*pmouseX,mouseY*pmouseY);
  stroke(myColor,40,myColor,30);
  line(myColor*17,height, mouseX,mouseY);
  bezier(myColor*-.07,height/2, mouseX,mouseY,mouseX,mouseY+40,mouseX,mouseY);
  fill(myColor*mouseX-pmouseX,20,200,50);
    strokeWeight(15);
    bezier(myColor*.17,height/2, mouseX+50,mouseY,mouseX,mouseY+40,mouseX,mouseY);
    bezier(myColor*mouseY,width/2, mouseX+90,mouseY,mouseX*mouseX+mouseY/.5,mouseY+40,mouseX,mouseY);
    ellipse(1,5, 12,9);
    myColor += 30;
  line(myColor*-.4,mouseY,pmouseX,pmouseY);
  }
}

*/
