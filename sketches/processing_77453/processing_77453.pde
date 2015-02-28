
/* 
     

                Processing - dessin figuratif
    
    
*/

void setup(){
  size(300,300);
  //noStroke(); //sans ligne
  background(#868582);
  smooth();
  //noFill();//sans transparence
 // rectMode(CENTER);     // CENTRER
}


 
 
void draw(){
  
  //corps
  strokeWeight(1);
  stroke(#000000);
  fill(#FFFFFF);
  rect(90, 100, 90, 150);
  
    //pied
  strokeWeight(1);
  fill(#FFC70D);
  stroke(#000000);
  arc(100, 250, 50, 40, PI, TWO_PI);
  // ligen du pied
  line(75,250 , 150, 250);
  
  //triangle / tête
  fill(50,80,100);
  triangle(100,50,180,100,20,180);
  

  
  //bec jaune
  fill(#FFC70D);
  triangle(80,150,70,100,20,180);
  
  
  //Aile
  fill(50,80,100);
  arc(120, 160, 120, 80, 1, PI/2);


  
  
  // oeil
  fill(#000000);
  strokeWeight(10);
  stroke(#FFFFFF);
  ellipse(100,90,20,20);
  
}
  
  
 


