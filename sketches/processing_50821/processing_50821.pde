
//Homework #5, Jim Robert's CFA-757
//Computing the Arts with Processing @ CMU
//Zoe Lu copyright Spring 2012, Pittsburgh PA 15213

//things you can do
//mouse-click to "bold" the stroke
//press space to change colors
//press s to save image (not available on OpenProcessing

float r=34,g=160,b=83;
float stk=5;
void setup(){
  frameRate(30);
  size(400,400);
  noFill();
  smooth();
}

void draw(){
  strokeWeight(stk);
  stroke(r,g,b);
  background(g,b,r);
  initials(mouseX,mouseY,(mouseX+1)%(height/2),(mouseY+1)%(width/2));
}

void initials(float x, float y, float diam, float diam2){
    stroke(b,r,g);
    //draw a circle
    ellipse(x,y,diam*2,diam2*2);
    //draw a Z
    stroke(r,g,b);
    beginShape();
      curveVertex(x,y);
      curveVertex(x-0.87*diam, y-0.5*diam2);
      curveVertex(x, y-0.875*diam2);
      curveVertex(x-0.7*diam, y+0.7*diam2);  
      curveVertex(x, y+0.125*diam2);
      curveVertex(x,y);
    endShape();
    //draw a L
    beginShape();
      curveVertex(x,y);
      curveVertex(x, y-0.5*diam2);
      curveVertex(x, y+0.875*diam2);
      curveVertex(x+0.86*diam, y+0.5*diam2);  
      curveVertex(x,y);
    endShape();
  //}
}

//press key to change stroke color
void keyPressed(){
  if(keyCode==' '){
    r=random(255);
    g=random(255);
    b=random(255);
  }
  /*
  if(keyCode=='S'){
    save("img"+(stk-4)+".jpg");
  }
  */
}

void mousePressed(){
  stk++;
  if(stk>25){
    stk=5;
  }
}                               
