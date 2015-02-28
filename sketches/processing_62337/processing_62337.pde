
int counter;

vovoid setup()
 { 
  size(400, 600);
   background(50, 150, 255);
   smooth();
   frameRate(60); 
   textSize(24);

} 


void draw() 
{  
 fill(180,232,84);  
 ellipse( width/2, 400, 100,100); 
 triangle(250, 400, 300, 350, 300, 450); 
 fill(0,0,0); 
 ellipse(175,375,10,10); 
 noFill();
 arc(width/2, 400, 20,20, 0, PI); 
 textAlign(CENTER);
 fill(29,68,98); 
 text("glub glub glub", width/2,500);
 fill(0,0,random(255),60);
 ellipse(mouseX,mouseY,25,25);
}
