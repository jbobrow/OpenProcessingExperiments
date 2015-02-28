
void setup() {  //setup function called initially, only once
  size(500, 500);  //Size of screen
   
}
  
void draw() {  //draw function loops
   background(0,0,255); // Loop function
     
   x = mouseX - 50  //We were dull and just made every single integer.
     
   y = mouseY - 50
     
   j = mouseX + 50
     
   k = mouseY - 50
     
   o = mouseY + 35
     
   p = y + 15
     
   t = x - 17
     
   q = j - 17
     
   w = k + 15
     
   z = t + 30
     
   l = q + 30
     
    strokeWeight(4);   //Face ,Yellow
    fill(255,233,0);
    ellipse(mouseX, mouseY, 250, 250);
      
    fill(255,255,255);   //Eye
    arc(x,y, 80, 80, 0, PI);
          
    fill(255,255,255);   // Other Eye
    arc(j,k,80, 80, 0, PI);
      
    fill(255,0,0);    // Mouth
    arc(mouseX,o+30,180,150,3,6.5);
      
    fill(0,0,0);   //Pupil
    ellipse(t,p,25,25);
      
    fill(0,0,0);  // Other Pupil
    ellipse(q,w,25,25);
      
    if (mousePressed) //Code that makes it all change when button pressed
    {
        background(255,0,0);
          
            strokeWeight(4);
    fill(255,233,0);
    ellipse(mouseX, mouseY, 250, 250);
      
    fill(255,255,255);
    arc(x,y, 80, 80, 0, PI);
      
    fill(255,255,255);
    arc(j,k,80, 80, 0, PI);
      
    fill(255,0,0);
    arc(mouseX,o,180,150,0,PI);
      
    fill(0,0,0);
    ellipse(z,p,25,25);
      
    fill(0,0,0);
    ellipse(l,w,25,25);
    }
   
    
}

