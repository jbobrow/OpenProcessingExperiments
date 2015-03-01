

void setup () {

 size(500,500);
 smooth();
 background(255,255,255);

 
 fill(255,0,0);
   ellipse(250,250,45,45); 
 fill(255,255,255);
   ellipse(250,250,35,35);
 
 fill(255,0,0);
   ellipse(250,250,25,25); 
 fill(255,255,255);
   ellipse(250,250,15,15);
 fill(255,0,0);
   ellipse(250,250,5,5);

}

void draw() 
{
  if(mouseX == 250) {
    cursor(CROSS);
    fill(255,255,255);
    stroke(255,255,255);
    ellipse (250,250,70,70);
    
    stroke(0,0,0);
    fill(255,0,0);
     ellipse(25,25,45,45); 
    fill(255,255,255);
     ellipse(25,25,35,35);
    fill(255,0,0);
     ellipse(25,25,25,25); 
    fill(255,255,255);
     ellipse(25,25,15,15);
    fill(255,0,0);
     ellipse(25,25,5,5);
  }

 
  if(mouseX == 25) {
    cursor(CROSS);
    fill(255,255,255);
    stroke(255,255,255);
    ellipse (25,25,70,70);
    
    stroke(0,0,0);
    fill(255,0,0);
     ellipse(150,150,45,45); 
    fill(255,255,255);
     ellipse(150,150,35,35);
    fill(255,0,0);
     ellipse(150,150,25,25); 
    fill(255,255,255);
     ellipse(150,150,15,15);
    fill(255,0,0);
     ellipse(150,150,5,5);
  }
 
   if(mouseX == 150) {
    cursor(CROSS);
    fill(255,255,255);
    stroke(255,255,255);
    ellipse (150,150,70,70);
    
      stroke(0,0,0);
    fill(255,0,0);
     ellipse(350,350,45,45); 
    fill(255,255,255);
     ellipse(350,350,35,35);
    fill(255,0,0);
     ellipse(350,350,25,25); 
    fill(255,255,255);
     ellipse(350,350,15,15);
    fill(255,0,0);
     ellipse(350,350,5,5);
  }
  
  if(mouseX == 350) {
    cursor(CROSS);
    fill(255,255,255);
    stroke(255,255,255);
    ellipse (350,350,70,70);
    
    stroke(0,0,0);
    fill(255,0,0);
     ellipse(351,50,45,45); 
    fill(255,255,255);
     ellipse(351,50,35,35);
    fill(255,0,0);
     ellipse(351,50,25,25); 
    fill(255,255,255);
     ellipse(351,50,15,15);
    fill(255,0,0);
     ellipse(351,50,5,5);
  }
  
    if(mouseX == 351) {
    cursor(CROSS);
    fill(255,255,255);
    stroke(255,255,255);
    ellipse (351,50,70,70);
    
    stroke(0,0,0);
    fill(255,0,0);
     ellipse(50,350,45,45); 
    fill(255,255,255);
     ellipse(50,350,35,35);
    fill(255,0,0);
     ellipse(50,350,25,25); 
    fill(255,255,255);
     ellipse(50,350,15,15);
    fill(255,0,0);
     ellipse(50,350,5,5);
  }
  
   if(mouseX == 50) {
    cursor(CROSS);
    fill(255,255,255);
    stroke(255,255,255);
    ellipse (50,50,70,70);
    
    stroke(0,0,0);
    fill(255,0,0);
     ellipse(50,350,45,45); 
    fill(255,255,255);
     ellipse(50,350,35,35);
    fill(255,0,0);
     ellipse(50,350,25,25); 
    fill(255,255,255);
     ellipse(50,350,15,15);
    fill(255,0,0);
     ellipse(50,350,5,5);
  }
  
  if(mouseX == 50) {
    cursor(CROSS);
    fill(255,255,255);
    stroke(255,255,255);
    ellipse (50,350,70,70);
  }
 }
