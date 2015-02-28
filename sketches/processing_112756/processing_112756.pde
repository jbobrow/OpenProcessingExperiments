
void setup () { 


  size (830, 500); 


  background(178, 216, 255); 


  smooth();
} 





void draw() { 


  background(178, 216, 255); 





  for (int a=1; a<500; a+=1) { 





    stroke(a/2, 90, 110); 


    line(0, a, 1000, a);
  } // Ceu 





  noStroke(); 


  fill(8, 71, 95); 


  rect(0, 430, 850, 400); // Mar 








  stroke(255); 


  point(random(0, 1010), random(0, 300)); 


  point(random(0, 1010), random(0, 300)); 


  point(random(0, 1010), random(0, 300)); 


  point(random(0, 1010), random(0, 300)); 


  point(random(0, 1010), random(0, 300)); 


  point(random(0, 1010), random(0, 300)); 


  // estrelas 





  stroke (255);   


  fill(255); 


  beginShape(); 


  vertex(160, 260); 


  bezierVertex(450, 20+(mouseX/10), 660, 135, 735, 360); 


  bezierVertex(615, 360, 330, 135, 160, 260); 


  endShape(); // edifício 




  stroke (255);   
  fill(222, 218, 217); 


  beginShape(); 
  
  vertex (280,210);
   
  bezierVertex (230,280,180,320,130,400);
  bezierVertex (130,400,380+(mouseX/20),330,280,210);
  
  endShape ();






  stroke (255);   


  fill(222, 218, 217); 


  beginShape(); 


  vertex (460, 220); 


  bezierVertex (260, 300, 200, 350, 140, 420); 


  bezierVertex (140, 420, 490+(mouseX/20), 420, 460, 220); 


  endShape (); // edifício 










  stroke (255); 


  fill(222, 218, 217); 


  rect(50, 360, 620, 70); // edfício 

  rect (610,345,140,85); // edificio
  



  fill(255); 


  arc (300, 440, 380, 220, PI, 2*PI); 


  stroke(222, 218, 217); 


  rect (130, 390, 340, 49); // edifício 





  if (mouseX>250) { 


    for (int c=130;c<450;c+=31) { 


      stroke(170); 


      fill (245, 240, 143); 


      rect(c, 390, 31, 49);
    } //janelas do edifício
  }
