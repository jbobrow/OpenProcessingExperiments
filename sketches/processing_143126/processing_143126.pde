

// multiple robots with functions 

void setup() { 

size(725,525); 

} 


void draw() { 

background(400,400,800); 

for (int c = 0; c <= 700; c += 300) { 

for (int d = 0; d <= 600; d += 150) { 

      robot(c,d); 


    } 


  } 


} 


 void robot(int x, int y) { 

 pushMatrix(); 

 translate(x,y); 

 rectMode(CENTER); 


 float mx = mouseX; 
 float my = mouseY; 

 float sx = map(mx,0,500,0,200); 
 float sy = map(my,0,700,0,200); 
 for (int a = 0; a <= 30; a += 5) { 
 for (int b = 0; b <= 30; b += 5) { 
      
//heart
      smooth();
      noStroke(); 
      //stroke(sx,sy,sx); 
      fill(255,0,0);
      beginShape();
      vertex(50, 15);
      bezierVertex(sx, -5, 90, 5, 50, 40);
      vertex(50, 15);
      bezierVertex(50, -5, 10, 5, 50, 40);
      endShape();


      strokeWeight(5); 
      fill(255,200,200);

      //stroke(sx,sy,sx); 
    
      


      ellipse(40,40,a/2,b/2); 


      ellipse(60,40,a/2,b/2); 


        


      fill(255); 


      noStroke(); 

      //white eyeball    
      ellipse(40,40,10,10); 


      ellipse(60,40,10,10); 


      fill(0); 

      //eye ball 
      ellipse(40,40,5,5);
      fill(127, 0, 0); 


      ellipse(60,40,5,5); 
      fill(127, 0, 0);
      

        


      noFill(); 


      stroke(0); 


      //bezier(20,40,50,50,sx,sy,sx,sy); 


      //bezier(80,40,50,50,sy,sx,sy,sx); 


        


      noStroke(); 


      fill(255,200,200); 


      ellipse(sx,sy,15,15); 
      
      noStroke();
      fill(127,0,0);
      ellipse (sy, sx, 10, 10);
      
   
    
      fill(255,0,0);
      beginShape();
      vertex(50, 15);
      bezierVertex(50, -5, 90, 5, 50, 40);
      vertex(50, 15);
      bezierVertex(50, -5, 10, 5, 50, 40);
      endShape();


    } 


  } 


  popMatrix(); 


} 



