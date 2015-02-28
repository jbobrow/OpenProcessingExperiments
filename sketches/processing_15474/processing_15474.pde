
 
 
 void setup()
 {
   size(400, 400);
 }
 
 void draw()
 {
 
 for (int i = 0; i <= 5; i++) 
 {  
    strokeWeight(random(i));
    stroke(mouseX + mouseY, 80+random(100), random(255));
    for(int k=0; k<400; k=k+60)
    {
      strokeWeight(i+random(3));
      for(int j=0; j<400; j=j+10)
      {
        stroke(mouseX + mouseY, random(255), random(255));
         if(mouseX+mouseY > 400)
          {
              rect(k+i * 10, j, random(5)+(mouseX+mouseY)/400, random(5)+ (mouseX+mouseY)/400);
           }
          else
          {
            stroke(100+random(100), mouseX, random(255)-mouseY);
          strokeWeight(random(3));
          ellipse(k+i * 10, j, random(5)+(mouseX+mouseY)/300, random(5)+ (mouseX+mouseY)/300);
          }
      }
    }  
  }
}

