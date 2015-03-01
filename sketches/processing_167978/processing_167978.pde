
 }
  void draw (){
    
    
    r=random (255);
    g=random (255);
    b=random(255);
    diam=random(width/5);
    diami=random(height/5);
    
    
    y=random(0,100);
    x=random(0,170);
    
    if (boton==true) { 
  noStroke();
    fill(r,g,b);
    ellipse(x,y,diam,diami);
    }
    if (boton==false) {
   
   fill(r,g,b);
      stroke(255);
    
    rect(x,y,diam,diami);
    }
    
    fill(r,g,b);
    rect(80,180,50,20);
    
     }
     
     
    void mousePressed()
    {
      if (mouseX > 75 && mouseX < 135 && mouseY > 175 && mouseY < 200 )  background(#ED053F); 
      { boton = !boton; 
      }
      }
   

