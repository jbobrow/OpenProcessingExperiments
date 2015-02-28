
float a = 1; 
void setup () { 
size (600,600); 
background (0); 
}void draw () { 


  


  ellipse (mouseX, mouseY, width/6, height/6); 


  stroke (1+a,255,0,20);  


  noFill(); 


  a += 1 ; 


  


}
