
int xsize = 1000;
int ysize = 700;



void setup () {
  size (xsize,ysize);               
  background (0);
  smooth ();
  stroke(255);
  //noStroke();
}

void draw () {
 
if (key == 'q') {
  
  
  if( mouseX < xsize/4) { 
  
    int radius = int(random(1,30));
    int rvalue = int(255);
    int gvalue = int(random(0,255));
    int bvalue = int(random(0,255));
    fill(rvalue, gvalue, bvalue,random(0,30));
    stroke(rvalue, gvalue, bvalue,random(0,30)); 
    //rect (mouseX, mouseY, radius, radius); 
    ellipse (mouseX, mouseY, radius, radius);
    
  } 
  
  else if( mouseX < xsize/2) { 
  
    int radius = int(random(1,30));
    int rvalue = int(random(0,255));
    int gvalue = int(255);
    int bvalue = int(random(0,255));
    fill(rvalue, gvalue, bvalue,random(0,30));
    stroke(rvalue, gvalue, bvalue,random(0,30)); 
    //rect (mouseX, mouseY, radius, radius); 
    ellipse (mouseX, mouseY, radius, radius);
    
  }
  
  else if( mouseX < (xsize/4)*3) { 
  
    int radius = int(random(1,30));
    int rvalue = int(random(0,255));
    int gvalue = int(random(0,255));
    int bvalue = int(255);
    fill(rvalue, gvalue, bvalue,random(0,30));
    stroke(rvalue, gvalue, bvalue,random(0,30)); 
    //rect (mouseX, mouseY, radius, radius); 
    ellipse (mouseX, mouseY, radius, radius);
    
  }
  
  else if( mouseX < xsize) { 
  
    int radius = int(random(1,30));
    int rvalue = int(random(0,255));
    int gvalue = int(random(0,255));
    int bvalue = int(random(0,255));
    fill(rvalue, gvalue, bvalue,random(0,30));
    stroke(rvalue, gvalue, bvalue,random(0,30)); 
    //rect (mouseX, mouseY, radius, radius); 
    ellipse (mouseX, mouseY, radius, radius);
    
  }
    
    
    
    
  
 
 
} 



  
}



