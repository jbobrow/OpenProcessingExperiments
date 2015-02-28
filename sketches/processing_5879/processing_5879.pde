
void setup() {  
  size (600,650);  
  smooth();  
  frameRate(30);  
}  
  
void draw() {  
  background(50);  
{  

} 

  DrawClown();     
  DrawTaart();
  ellipseMode(CENTER);  
  rectMode(CENTER);   
 
} 
   void DrawTaart() 
{ 
  fill(255);
  ellipse(mouseY-40,mouseX-50,25,40);  
  fill(255,255,0);
  rect(mouseY-50,mouseX-50,15,40);
  stroke(0);
}  
   
   void DrawClown() 
{   
    //haar
    noStroke();
    fill(80,255,30);
    ellipse(mouseX+70,mouseY-120,120,70);
    fill(80,255,30);
    ellipse(mouseX-70,mouseY-120,120,70);

   //lichaam 
   stroke(255);  
   fill(255,255,0);  
   rect(mouseX,mouseY,40,100);
  
   //hoofd
   stroke(0);  
   fill(255);  
   ellipse(mouseX,mouseY-100,120,120);  
   
  //ogen 
  fill(220,0,0);
  ellipse(mouseX+30,mouseY-100,32,64);  
  ellipse(mouseX-30,mouseY-100,32,64);  
  stroke(0); 

  noStroke();
  fill(255,255,255);
  ellipse(mouseX+30,mouseY-100,30,20);  
  ellipse(mouseX-30,mouseY-100,30,20); 

  noStroke();
  fill(0,0,0);
  ellipse(mouseX+30,mouseY-100,15,15);  
  ellipse(mouseX-30,mouseY-100,15,15); 
  
  //neus
  fill(mouseY,0,0);
  noStroke();
  ellipse(mouseX+00,mouseY-60,30,30);

  //armen 
  stroke(255);  
  line(mouseX+20,mouseY+00,pmouseX+143,pmouseY-30); 
  line(mouseX-20,mouseY+00,pmouseX-143,pmouseY-30);   
   
  //benen  
  stroke(255);  
  line(mouseX-20,mouseY+50,pmouseX-30,pmouseY+160);   
  line(mouseX+20,mouseY+50,pmouseX+30,pmouseY+160);   
}  



