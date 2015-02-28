
void setup () {
  size(640, 360);
}

void draw () {
  //Herd
  background (100);
  fill(200);
  rect( 150, 50, 350, 270,20);
  fill(150);
  ellipse(230,110,100,90);
  ellipse(420,110,100,90);
  ellipse(420,250,100,90);
  ellipse(230,250,100,90);
  //Gas
  rect(205,320, 40, 17);
    rect(267,320, 40, 17);
      rect(340 ,320, 40, 17);
        rect(400,320, 40, 17);
  
  //Flammen



  
  
 

  //Pfanne
  if(mousePressed){
    fill(230);
  ellipse(230,110,100,90);

   scale(random(1, 1.008));
    
  fill(255);
  
  triangle(230,65, 245, 113, 220,113);
  triangle(230,160, 245, 113, 220,113);
  triangle(280,113, 220, 130, 220,100);
  triangle(180,113, 230,100, 230, 130);
  
  
  
  fill(100);
  ellipse(mouseX,mouseY-80, 80, 80);
  
  rect(mouseX-8, mouseY-80, 15,80);
  
   scale(random(1, 1.01));


  fill(240);
  ellipse(mouseX,mouseY-80,60,50);
  fill(200);
  ellipse(mouseX,mouseY-80,20,25);

  }

    

}

 
 



  

  
  

 





