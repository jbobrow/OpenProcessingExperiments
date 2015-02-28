
/* Sara Humel 
   Homework #5
   copyright 2012
 



  may have to click sketch window first
  press 'z' to increase the oppacity of the background
  press 'x' to decrease the oppacity of the background
  press the space bar to add initials
  press mouse button to get rid of the initials
*/




boolean mouseC = false;
float oppacity = 0;


void setup(){
background(0,0,0);
size(400,400);

smooth();
}




void draw(){
  float x = mouseX, y = mouseY, d = 20*(mouseX-pmouseX);
  if (d < 0){
   d = d*-1; 
  }
  noStroke();
  fill(255,255,255,oppacity);
  rect(0,0,width,height);
  
  if (mouseC == false){
  drawDots(x,y,d);
  }
  else {
    drawInitials(x,y,d);
  }
  if(frameCount==400){
    saveFrame("thumbnail.jpg");
  }
}

void keyPressed(){
  if (key == ' '){
  mouseC = true;
  }
  if (key == 'z' && oppacity<250){
  oppacity = oppacity + 5;
  }
  if (key == 'x' && oppacity>0){
  oppacity = oppacity - 5;
  }
  
}

void mouseClicked(){
  mouseC = false;
}



void drawDots(float x,float y,float d)
{
    float r = random(255), g = random(255), b = random(255);
    noStroke();fill(r,g,b);
    stroke(r,g,b);

    //dots above S
    ellipse(x-.43*d,y-.2*d,.025*d,.025*d);
    ellipse(x-.465*d,y-.17*d,.015*d,.015*d);
    ellipse(x-.49*d,y-.14*d,.005*d,.005*d);



    fill(r,g,b);
    stroke(r,g,b);
    //Dots below M
    ellipse(x-.09*d,y+.29*d,.01*d,.01*d);
    ellipse(x-.05*d,y+.30*d,.01*d,.01*d);
    ellipse(x-.13*d,y+.28*d,.01*d,.01*d);


    ellipse(x+.44*d,y-.24*d,.01*d,.01*d);
    ellipse(x+.42*d,y-.21*d,.01*d,.01*d);
    ellipse(x+.40*d,y-.18*d,.01*d,.01*d);
  
}


void drawInitials(float x, float y, float d)
{
    float r = random(255), g = random(255), b = random(255);
    //backgroundShapes
    noStroke();
    fill(118,25,113);
    ellipse(x,y,.65*d,.65*d);
    fill(34,156,244,100);
    ellipse(x,y,.65*d,.65*d);
    rect(x-.5*d,y-.125*d,d,.25*d);



  //INITIALS
    noFill();
    stroke(39,18,57);
    strokeWeight(.015*d); 
  //S
    beginShape();
    curveVertex(x-.6*d , y+.1*d);
    curveVertex(x-.5*d, y+.1*d);
    curveVertex(x-.4*d , y+.05*d);
    curveVertex(x-.35*d, y-.05*d);
    curveVertex(x-.35*d, y-.1*d);
    curveVertex(x-.25*d, y);
    curveVertex(x-.25*d, y+.05*d);
    curveVertex(x-.3*d , y+.1*d);
    curveVertex(x-.35*d, y+.1*d);
    curveVertex(x-.4*d , y+.05*d);
    curveVertex(x-.35*d, y+.1*d);
  //M
    curveVertex(x-.2*d , y+.1*d);
    curveVertex(x-.15*d, y);
    curveVertex(x-.1*d , y-.1*d);
    curveVertex(x-.05*d, y);
    curveVertex(x-.05*d, y+.1*d);
    curveVertex(x-.05*d, y);
    curveVertex(x      , y-.1*d);
    curveVertex(x+.05*d, y);
    curveVertex(x+.05*d, y+.1*d);
    curveVertex(x+.05*d, y);
    curveVertex(x+.1*d , y-.1*d);
    curveVertex(x+.15*d, y);
    curveVertex(x+.2*d , y+.1*d);
  //H
    curveVertex(x+.3*d , y-.1*d);
    curveVertex(x+.25*d, y-.25*d);
    curveVertex(x+.25*d, y-.1*d);
    curveVertex(x+.25*d, y+.1*d);
    curveVertex(x+.35*d, y-.1*d);
    curveVertex(x+.45*d, y+.1*d);
    curveVertex(x+.5*d , y+.1*d);
    curveVertex(x+.5*d , y+.1*d);
    endShape();


    fill(187,234,225);
    stroke(187,234,225);
  //shapes above S
    beginShape();
      vertex(x-.18*d,y+.02*d);
      vertex(x-.43*d,y-.25*d);
      vertex(x-.4*d,y-.3*d);
    endShape(CLOSE);
    beginShape();
      vertex(x-.3*d,y-.22*d);
      vertex(x-.17*d,y-.03*d);
      vertex(x-.16*d,y-.07*d);
      vertex(x-.25*d,y-.29*d);
    endShape(CLOSE);
    beginShape();
      vertex(x-.4*d,y-.17*d);
      vertex(x-.49*d,y-.1*d);
      vertex(x-.39*d,y-.07*d);
      vertex(x-.39*d,y-.11*d);
      vertex(x-.37*d,y-.13*d);
    endShape(CLOSE);

    fill(r,g,b);
    stroke(r,g,b);

  //dots above S
    ellipse(x-.43*d,y-.2*d,.025*d,.025*d);
    ellipse(x-.465*d,y-.17*d,.015*d,.015*d);
    ellipse(x-.49*d,y-.14*d,.005*d,.005*d);


    fill(187,234,225);
    stroke(187,234,225);

  //Shapes Below M
    beginShape();
      vertex(x+.2*d,y+.13*d);
      vertex(x+.23*d,y+.1*d);
      vertex(x+.34*d,y+.36*d);
      vertex(x+.24*d,y+.43*d);
  endShape(CLOSE);
  beginShape();
      vertex(x+.16*d,y+.17*d);
      vertex(x+.19*d,y+.35*d);
      vertex(x+.1*d,y+.43*d);
      vertex(x+.1*d,y+.22*d);
  endShape(CLOSE);
  beginShape();
      vertex(x+.06*d,y+.23*d);
      vertex(x+.06*d,y+.36*d);
      vertex(x-.01*d,y+.42*d);
      vertex(x+.02*d,y+.24*d);
  endShape(CLOSE);
  beginShape();
      vertex(x+.16*d,y+.13*d);
      vertex(x+.07*d,y+.2*d);
      vertex(x-.01*d,y+.21*d);
      vertex(x-.03*d,y+.27*d);
      vertex(x-.12*d,y+.25*d);
      vertex(x-.05*d,y+.17*d);
      vertex(x+.05*d,y+.17*d);
      vertex(x+.16*d,y+.13*d);
    endShape(CLOSE);

  //Stripes Below M
    beginShape();
      vertex(x-.01*d,y+.46*d);
      vertex(x+.07*d,y+.39*d);
      vertex(x+.07*d,y+.40*d);
      vertex(x-.02*d,y+.47*d);
     endShape(CLOSE);
    beginShape();
      vertex(x-.01*d,y+.49*d);
      vertex(x+.07*d,y+.43*d);
      vertex(x+.07*d,y+.44*d);
      vertex(x-.01*d,y+.5*d);
    endShape(CLOSE);
    beginShape();
      vertex(x+.03*d,y+.5*d);
      vertex(x+.07*d,y+.47*d);
      vertex(x+.07*d,y+.48*d);
      vertex(x+.05*d,y+.49*d);
    endShape(CLOSE);

    
    fill(r,g,b);
    stroke(r,g,b);
  //Dots below M
    ellipse(x-.09*d,y+.29*d,.01*d,.01*d);
    ellipse(x-.05*d,y+.30*d,.01*d,.01*d);
    ellipse(x-.13*d,y+.28*d,.01*d,.01*d);


    fill(187,234,225);
    stroke(187,234,225);

  //Shapes Above H
    beginShape();
      vertex(x+.33*d,y-.12*d);
      vertex(x+.42*d,y-.27*d);
      vertex(x+.38*d,y-.33*d);
    endShape(CLOSE);
    beginShape();
      vertex(x+.33*d,y-.24*d);
      vertex(x+.3*d,y-.4*d);
      vertex(x+.35*d,y-.35*d);
    endShape(CLOSE);
    beginShape();
      vertex(x+.29*d,y-.3*d);
      vertex(x+.26*d,y-.42*d);
      vertex(x+.2*d,y-.45*d);
    endShape(CLOSE);

    fill(r,g,b);
    stroke(r,g,b);
    ellipse(x+.44*d,y-.24*d,.01*d,.01*d);
    ellipse(x+.42*d,y-.21*d,.01*d,.01*d);
    ellipse(x+.40*d,y-.18*d,.01*d,.01*d); 
  }

