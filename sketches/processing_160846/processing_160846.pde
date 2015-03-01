

void setup() {  //setup function called initially, only once
  size(500, 400);
  background(120);  //set background grey
  }

void draw() {
    stroke(35,50,50)
    fill(163,100,200)
    ellipse(250,200,150,150); //draw purple circle
    
    rectMode(CENTER);  // Set rectMode to CENTER
    
    stroke(100,100,100)
    fill(0,255,0)
    rect(100,300,100,100); // draw  green rectangle
    
    stroke(255)
    fill(255,0,0)
    triangle(32, 80, 60, 20, 90, 80); //draw red triangle
    
    stroke(0,0,200)
    line(400,300,200,300); //draw line
    
    stroke(250,0,0)
    point(400,300)
    point(200,300); //draw 2 points 
    }
    

   

 

    
