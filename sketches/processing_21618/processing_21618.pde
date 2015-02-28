

int x=1;
float a = 300;
float b;


void setup () {
  // set the size of the window
  size(200,200);

}




void draw () {
  
 
 
 float c = random (255); 
 float b = random (width/2,width/2+10); 
 
  // Draw a withie background
  background (c); 
    
  //Platillo volador  
   x=x+1;
   if (x>230){x=0;}   
  
  fill(175);
  ellipse(x,10,50,20);
  fill(0,0,255);
  ellipse(x,15,25,10);
  
   
  // Set CENTER mode
  ellipseMode (CENTER);
  rectMode(CENTER);
  
  
  
  a = a-1;
  if ( a<-100){ a=300;}
  
  
  //Draw Zoog´s body
  stroke(0);
  fill(0,255,0);
  rect (b,a+30,20,100);
  
  // Draw Zoog´s head
  stroke(0);
  fill(0,255,0);
  ellipse (b,a,60,60);
  
  // Draw Zoog´s Eyes
  fill(c,0,0);
  ellipse(b+20,a-1,16,32);
  ellipse(b-20,a-1,16,32);
  
 
  
  
  

//Draw luz...
       stroke (0);
    fill(0,255,255,100); 
    triangle(x,20,50,200,150,200);
   
  }
  
  

