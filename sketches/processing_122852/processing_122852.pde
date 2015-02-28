
void setup()
{
  size(200, 200);
}

void draw () {
    background(255);

  
  stroke(1);
  fill(255,0,0);
  
  ellipseMode(CENTER);
  ellipse (mouseX-40,mouseY-60,20,50); //oor links


  ellipse (mouseX+40,mouseY-60,20,50); //oor rechts
  
  
   ellipse (mouseX-40,mouseY-60,10,20); //binnen oor links


  ellipse (mouseX+40,mouseY-60,10,20); //binnen oor rechts
  

  
  strokeWeight(2);
  noStroke();
  ellipse (mouseX,mouseY+10,120,160); //lichaam
  rect (mouseX-60,mouseY+20,120,70);  //lichaam


  
  stroke(1);
  strokeWeight(2);
  



  strokeWeight(1);
 
  fill(100,0,0);       
  ellipse(mouseX,mouseY,70,20);   //mond
  
  fill(255);
   rect(mouseX-10,mouseY-10,10,10); //tand
   rect(mouseX,mouseY-10,10,10);//tand
   rect(mouseX+10,mouseY-9,10,10);//tand
   rect(mouseX-20,mouseY-9,10,10);//tand

 
  fill(0);
  ellipse(mouseX+30,mouseY-30,5,20); //oog rechts

  ellipse(mouseX-20,mouseY-30,5,20); //oog links

  strokeWeight(2);
  fill(255,0,0);
  ellipse(mouseX-40,mouseY+90,70,10);//linkervoet
  ellipse(mouseX+40,mouseY+90,70,10);//rechtervoet
  
   ellipse (mouseX-60,mouseY+20,40,10); //arm links
  ellipse (mouseX+60,mouseY+20,40,10); //arm rechts

}

