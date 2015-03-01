
int xPos = 35;
int yPos = 35;
int bSize = 35;

void setup(){
  size(800,600); 
  background(0);
  
  noStroke();
  fill(255);
  rect(100,0,800,600);
  
  fill(255,255,255);
  rect(xPos, yPos, bSize, bSize);
  
  fill(212,208,208);
  rect(xPos, yPos+bSize, bSize, bSize);
  
  fill(100,100,100);
  rect(xPos, yPos+bSize+bSize, bSize, bSize);
  
  
  
    fill(255,175,163);
  rect(xPos, yPos+bSize+bSize+bSize, bSize, bSize);
  
    fill(255,100,100);
  rect(xPos, yPos+bSize+bSize+bSize+bSize, bSize, bSize);

 fill(255,15,13);
  rect(xPos, yPos+bSize+bSize+bSize+bSize+bSize, bSize, bSize);




 fill(255,233,152);
  rect(xPos, yPos+bSize+bSize+bSize+bSize+bSize+bSize, bSize, bSize);

 fill(255,200,100);
  rect(xPos, yPos+bSize+bSize+bSize+bSize+bSize+bSize+bSize, bSize, bSize);

fill(255,200,0);
  rect(xPos, yPos+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize, bSize, bSize);




fill(164,255,161);
  rect(xPos, yPos+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize, bSize, bSize);
  
fill(100,255,100);
  rect(xPos, yPos+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize, bSize, bSize);
  
fill(0,255,0);
  rect(xPos, yPos+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize, bSize, bSize);
  
  



fill(100,200,200);
  rect(xPos, yPos+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize, bSize, bSize);

fill(32,126,200);
  rect(xPos, yPos+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize, bSize, bSize);

fill(3,74,120);
  rect(xPos, yPos+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize, bSize, bSize);


}







void draw(){
  if(mousePressed){
    if(mouseX > 100 && mouseX <800 && mouseY > 0 && mouseY <600) 
    {line (pmouseX, pmouseY, mouseX, mouseY);}
    
    if (mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos && mouseY < yPos+bSize)
    {stroke(255,255,255);
  strokeWeight(5);}
  
      if (mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize && mouseY < yPos+bSize+bSize)
    {stroke(212,208,208);
  strokeWeight(5);}
  
        if (mouseX > xPos && mouseX < xPos+bSize  && mouseY > yPos+bSize+bSize && mouseY < yPos+bSize+bSize+bSize)
    {stroke(100,100,100);
  strokeWeight(5);}
  
  
  
  
  
        if (mouseX > xPos && mouseX < xPos+bSize  && mouseY > yPos+bSize+bSize+bSize && mouseY < yPos+bSize+bSize+bSize+bSize)
    {stroke(255,175,163);
  strokeWeight(5);}
  
        if (mouseX > xPos && mouseX < xPos+bSize  && mouseY > yPos+bSize+bSize+bSize+bSize
        && mouseY < yPos+bSize+bSize+bSize+bSize+bSize)
    {stroke(255,100,100);
  strokeWeight(5);}
  
         if (mouseX > xPos && mouseX < xPos+bSize  
        && mouseY > yPos+bSize+bSize+bSize+bSize+bSize
        && mouseY < yPos+bSize+bSize+bSize+bSize+bSize+bSize)
    {stroke(255,15,13);
  strokeWeight(5);}
  
  
  
   if (mouseX > xPos && mouseX < xPos+bSize   
         && mouseY > yPos+bSize+bSize+bSize+bSize+bSize+bSize
        && mouseY < yPos+bSize+bSize+bSize+bSize+bSize+bSize+bSize)
    {stroke(255,233,152);
  strokeWeight(5);}
  
     if (mouseX > xPos && mouseX < xPos+bSize   
         && mouseY > yPos+bSize+bSize+bSize+bSize+bSize+bSize+bSize
        && mouseY < yPos+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize)
    {stroke(255,200,102);
  strokeWeight(5);}
  
       if (mouseX > xPos && mouseX < xPos+bSize   
         && mouseY > yPos+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize
        && mouseY < yPos+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize)
    {stroke(255,200,0);
  strokeWeight(5);}

  
         if (mouseX > xPos && mouseX < xPos+bSize   
         && mouseY > yPos+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize
        && mouseY < yPos+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize)
    {stroke(164,255,161);
  strokeWeight(5);}
  
         if (mouseX > xPos && mouseX < xPos+bSize   
         && mouseY > yPos+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize
        && mouseY < yPos+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize)
    {stroke(100,255,100);
  strokeWeight(5);}
  
         if (mouseX > xPos && mouseX < xPos+bSize   
         && mouseY > yPos+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize
        && mouseY < yPos+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize)
    {stroke(0,255,0);
  strokeWeight(5);}  
  
  
  
  
         if (mouseX > xPos && mouseX < xPos+bSize   
         && mouseY > yPos+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize
        && mouseY < yPos+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize)
    {stroke(100,200,200);
  strokeWeight(5);}  

           if (mouseX > xPos && mouseX < xPos+bSize   
         && mouseY > yPos+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize
        && mouseY < yPos+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize)
    {stroke(32,120,200);
  strokeWeight(5);}  
  
           if (mouseX > xPos && mouseX < xPos+bSize   
         && mouseY > yPos+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize
        && mouseY < yPos+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize)
    {stroke(3,74,120);
  strokeWeight(5);}    
  
  }
}


