
//hainvg a look at Danny's code it refl;ect on what I wanted to do
//and I have edited it around and changed it to suit what I wanted
//and needed. 

//Title: Moving Representations

float x, y;  
float size = 20;  
  
void setup()   
{  
  size(300,500);  
  noStroke();  
  frameRate(30); 
}  
  
void draw()   
{  
  background(0);  
    
  x = x + 0.5;  
    
  if (x > width + size) {  
    x = -size;  
  }   
    
  translate(x, height/95-size/2);  
  fill(155);  
  rect(150, 30, 70, 70); //bus (70,70)
  
  translate(x, height/95-size/1.1);  
  fill(155);  
  rect(0, 130, 70, 70);
  
  translate(x, height/95-size/1.1);  
  fill(155);  
  rect(-100, 240, 70, 70);

  translate(x, height/95-size/1.1);  
  fill(155);  
  rect(-200, 340, 70, 70);
  
  translate(x, height/95-size/1.1);  
  fill(155);  
  rect(-300, 450, 70, 70);
  
  translate(x, height/8-size/8);  
  fill(255);  
  ellipse(10, 1, 15, 15);  //people (15, 15)
  
  translate(x, height/8-size/8);  
  fill(255);  
  ellipse(0, 2, 15, 15);
  
   translate(x, height/8-size/8);  
  fill(255);  
  ellipse(-20, 3, 15, 15);  
  
  translate(x, height/8-size/8);  
  fill(255);  
  ellipse(-40, 4, 15, 15);
    
  translate(x, height/80-size/90);  
  fill(200);  
  rect(-20, -100, 60, 60);  //trains (60,60)
    
  translate(x, height/80-size/80);  
  fill(200);  
  rect(30, -20, 60, 60); 
    
  translate(x, height/80-size/80);  
  fill(200);  
  rect(56, 50, 60, 60); 

  translate(x, height/4-size/2);  
  fill(200);  
  rect(56, 60, 60, 60);  

  translate(x, height/50-size/20);  
  fill(255);  
  ellipse(0, 2, 40, 40);  //cars/cabs (40,40)
    
  translate(x, height/95-size/20);  
  fill(255);  
  ellipse(0, 10, 40, 40); 
    
  translate(x, height/95-size/20);  
  fill(255);  
  ellipse(90, 10, 40, 40);  
    
  translate(x, height/50-size/20);  
  fill(255);  
  ellipse(0, 1, 40, 40);  
    
  translate(x, height/80-size/80);  
  fill(255);  
  ellipse(-300, 1, 15, 15);  

  translate(x, height/50-size/20);  
  fill(255);  
  ellipse(-100, 10, 40, 40);   
    
  translate(x, height/5-size/2);  
  fill(255);  
  ellipse(-200, 1, 40, 40);  
    
  translate(x, height/120-size/120);  
  fill(255);  
  ellipse(-300, 1, 15, 15);
}  
 

