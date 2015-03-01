
///////////////////////////// Project_ ATTRACTOR \\\\\\\\\\\\\\\\\\\\\\
///////////////////////// YOUSUFOLIO/PROCESSING/2014\\\\\\\\\\\\\\\\
////////////////////////////////// ENJOY\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

float x=20;


void setup(){
size(800,600);
smooth();


}

void draw(){
background(0);

stroke(255,255,255,32);
noFill();
 
  for (int i =0; i<50;i+= 3) {
    for(int j =0;j<50;j+= 3 ) {
     float d = dist(mouseX,mouseY,x*i,x*j)/3;
     pushMatrix();
      rectMode(CENTER ); 
// stroke(125,124,25);
 fill(i,125,55,15);
  rect(x*i,x*j,mouseX/6,mouseX/6);
translate(x*i,x*j);
rotate(PI/180*mouseX);
strokeWeight(.5);
 fill(mouseY/2,125,mouseY,15);
//stroke(5,255,255);
rect(0,0,mouseX/6,mouseX/6);

//stroke(0,255,125);
//fill(12,125,mouseY,45);
ellipse(0,0,d,d);

strokeWeight(.2);

popMatrix();
  }
  }
  
  pushMatrix();                     ///////////////logo
  fill(255,255,255,95);
  noStroke();
  rect(width-80,height-55,10,10);
  rect(width-60,height-55,10,10);
  rect(width-70,height-45,10,10);
  rect(width-60,height-35,10,10);
  popMatrix();                      ///////////////logo

    ///////////////////////////// Project_ CLOCK \\\\\\\\\\\\\\\\\\\\\\
///////////////////////// YOUSUFOLIO/PROCESSING/2014\\\\\\\\\\\\\\\\
////////////////////////////////// ENJOY\\\\\\\\\\\\\\\\\\\\\\\\\\\\\



}

