
int eSize = 3;

size(510, 510);
background(255);

//fill(0);



for (int x = 0; x <= width; x ++) { 
  stroke(x,27,250,120);
  line(0, 0, x, height);
 
 stroke(0,0,height,x);
  line(0, width, x, height);
 
  stroke(20,x,0,255);
  line(width, 0, x, height);
  
   stroke(20,100,x,255);
  line(0, width, height, x);
  
     stroke(20,200,x,170);
  line(x, width, height,0);
  
     stroke(x,200,0,170);
  line(x, 0, height, width);
  
       stroke(150,255,50,x);
  line(height,x,200,width);
  
         stroke(150,x,50,200);
  line(height,width,x,150);
  
     stroke(150,100,x,200);
  line(100,x,width,0);
  
  stroke(0,x,255,200);
  line(0,x,x,510);
  

     strokeWeight(100); 
  ellipse(400, 200, 50, 50);
  
  
     strokeWeight(100); 
  ellipse(100, 200, 50, 50);
  
  
noStroke(); 
ellipse(200, 400, 50, 50);   

  
  
  
  
  
  
  
  //for (int x = 0; x <= width; x += 10) { 
  //line(0, y, 200, y);
  //line(x, 0, x, 200);
}



