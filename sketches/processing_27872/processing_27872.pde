

// stehen und tanzen

void setup () {
  size (500, 300);
}





void draw () {                  
  
  if (mousePressed){             

    fill(0, 0, 0, 20);
    rect (0, 0, 500, 300);
    stroke (255);  
    fill (255);  
  
    ellipse (mouseX, 285-mouseY, 30, 30); 
    ellipse (mouseX+70, 285-mouseY, mouseX/4, mouseX/4); 
    ellipse (mouseX+250, 285-mouseY, 30, 30);
    ellipse (mouseX-160, 285-mouseY, mouseX/3, mouseX/3); 
    ellipse (mouseX-370, 285-mouseY, 30, 30);
    ellipse (mouseX+400, 285-mouseY, mouseX/4, mouseX/4); 
    
    ellipse (mouseX, 15+mouseY, mouseX/4, mouseX/4); 
    ellipse (mouseX+100, 15+mouseY, 30, 30); 
    ellipse (mouseX+220, 15+mouseY, mouseX/5, mouseX/5); 
    ellipse (mouseX-90, 15+mouseY, 30, 30);
    ellipse (mouseX-290, 15+mouseY, mouseX/4, mouseX/4); 
    ellipse (mouseX+440, 15+mouseY, 30, 30);
    
    ellipse (15+mouseX, mouseY, 30, 30); 
    ellipse (15+mouseX, mouseY+170, mouseX/4, mouseX/4); 
    ellipse (15+mouseX, mouseY-90, 30, 30);
    ellipse (485-mouseX, mouseY, mouseX/3, mouseX/3); 
    ellipse (485-mouseX, mouseY+70, 30, 30);
    ellipse (485-mouseX, mouseY-220, mouseX/4, mouseX/4); 
                         
         
  

  }else{                        
    fill (255);
    fill (255, 255, 255, 60);
    rect (0, 0, 500, 300);
    stroke(0); 
    fill (0);
    ellipse (mouseX, 285, 30, 30); 
    ellipse (mouseX+70, 285, 30, 30); 
    ellipse (mouseX+250, 285, 30, 30);
    ellipse (mouseX-160, 285, 30, 30);
    ellipse (mouseX-370, 285, 30, 30);
    ellipse (mouseX+400, 285, 30, 30);
    
    ellipse (mouseX, 15, 30, 30); 
    ellipse (mouseX+100, 15, 30, 30); 
    ellipse (mouseX+220, 15, 30, 30);
    ellipse (mouseX-90, 15, 30, 30);
    ellipse (mouseX-290, 15, 30, 30);
    ellipse (mouseX+440, 15, 30, 30);
    
    ellipse (15, mouseY, 30, 30); 
    ellipse (15, mouseY+170, 30, 30); 
    ellipse (15, mouseY-90, 30, 30);
    ellipse (485, mouseY, 30, 30);
    ellipse (485, mouseY+70, 30, 30);
    ellipse (485, mouseY-220, 30, 30);
                         
    
  }
 
}


