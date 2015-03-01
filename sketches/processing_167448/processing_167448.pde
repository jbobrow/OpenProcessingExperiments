
float rechtsdreh=0;
float linksdreh=0;

void setup() {
  size(566,566);
  stroke(0);
  fill(0);
  background(255);
  rectMode(CENTER);
}



void draw() {
background(255);
translate(283,283);


  
 pushMatrix();  
 fill(0); 
 rotate(rechtsdreh);
 rect(0,0, 400,400);      //großes Quadrat
 popMatrix();
 
  pushMatrix();
  fill(255);
  rotate(linksdreh);
  rect(0,0,200,200);        //mittgroßes Quadrat
  popMatrix();
  
   pushMatrix();  
   fill(0); 
   rotate(rechtsdreh);
   rect(0,0, 100,100);      //kleines Quadrat
   popMatrix();
   
     pushMatrix();
    fill(255);
    rotate(linksdreh);
    rect(0,0,50,50);        //mini Quadrat
    popMatrix();
    
      pushMatrix();  
     fill(0); 
     rotate(rechtsdreh);
     rect(0,0, 25,25);      //nano Quadrat
     popMatrix();
 
rechtsdreh=rechtsdreh+(HALF_PI/50);
linksdreh=linksdreh-(HALF_PI/50);
};

