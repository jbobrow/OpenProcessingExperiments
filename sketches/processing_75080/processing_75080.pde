
  
  

  
  
  void setup(){
 size(500, 500);
  background(300,100,60);
  



 
noStroke();


   fill(300,60,60);  
 rect(50,80,400,400);
 
 strokeWeight(0);   
 fill(200,2,60);
 rect(100,150,300,300);
 
 

 
 
 fill(234,69,69);
  smooth();
 
   ellipseMode(CENTER);
   ellipse ( 200,200,20,20);
  ellipse(300,200,20,20);
  
 pushMatrix();


 noFill(); 
 stroke(234,69,69);
 strokeWeight(22);
 
 beginShape();
 curveVertex(370,500);
 curveVertex(220,280);
 curveVertex(25,260);
 curveVertex(24,20);
  endShape();
  
  popMatrix();
textSize(30);
  text("Joseph albers",300,250);


 text("with drawing on top",50,400);

}

  
  
  
  
  
  
  
  
  
  
  
  
  
  
 
 

