
// Aufgabe_3 Orientierunf,Nähe,Ähnlichkeit
//Dominik Meixner

void setup()
{
 
  size(500,500);
  background(255);
  noStroke();
  frameRate(10);
 
 
 
  fill(0);

      
   rect(20,20,10,70);  //Reihe 1.
   rect(60,20,10,70);
   rect(100,20,10,70);
   
   fill(237,19,19);
   rect(140,20,10,70);
   
   fill(0);
   rect(180,20,10,70);
   rect(220,20,10,70);
   rect(260,20,10,70);
   rect(300,20,10,70);
   rect(340,20,10,70);
   rect(380,20,10,70);
  // rect(420,20,10,70);
   rect(460,20,10,70);
  
  
   translate(0,130);
    
      rect(20,20,10,70);  //Reihe 2.
      rect(60,20,10,70);
      rect(100,20,10,70);
      rect(140,20,10,70);
      rect(180,20,10,70);
      rect(220,20,10,70);
      rect(260,20,10,70);
      rect(300,20,10,70);
      rect(340,20,10,70);
      rect(380,20,10,70);
      rect(420,20,10,70);
      rect(460,20,10,70);
    
   
      translate(0,130);
      
        rect(20,20,10,70);  //Reihe 3.
        rect(60,20,10,70);
        rect(100,20,10,70);
        rect(140,20,10,70);
        rect(180,20,10,70);
        rect(220,20,10,70);
        rect(260,20,10,70);
        rect(300,20,10,70);
        rect(340,20,10,70);
        
        fill(237,19,19);
        rect(380,20,10,70);
        
        fill(0);
        rect(420,20,10,70);
        rect(460,20,10,70);
       
 
        translate(0,130);
        
           rect(20,20,10,70);  //Reihe 4.
           rect(60,20,10,70);
           rect(100,20,10,70);
           rect(140,20,10,70);
           rect(180,20,10,70);
           rect(220,20,10,70);
           rect(260,20,10,70);
           rect(300,20,10,70);
           rect(340,20,10,70);
           rect(380,20,10,70);
           rect(420,20,10,70);
           rect(460,20,10,70);
        
    
}
 
 
void draw()
{
 

translate(425,55);


           
   
 float winkel = map(mouseY,0,5000,0,1.5*PI);
 float winkel2 = map(-mouseX,5,5000,0,1.5*PI);
 
  rectMode(CENTER);
     
      fill(255);
     rect(0,0,70,80);


  rotate(winkel);
  pushMatrix();
 
     rectMode(CENTER);
     fill(0);
     rect(0,0,10,70);
      
   popMatrix();
   resetMatrix();
 
   translate(105,185);
        
    fill(255);
     rect(0,0,70,80);

   rotate(winkel2);
   
   translate(0,0);
    rectMode(CENTER);
     fill(0); 
     rect(0,0,10,70);
     

     
     
     
  }
