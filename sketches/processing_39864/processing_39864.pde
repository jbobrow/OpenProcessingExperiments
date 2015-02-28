

void setup () {  

  //Defining area
   size(500,500); 
   background(53,27,88); 
  smooth();  
}  

//Line definitions
void draw () 
{
    int a= 50;
    int b= 50;
    
    if 
      (mousePressed) {
  stroke (236,36,86);
   line(mouseX, mouseY, a*8,b/3);}
 else {  
   stroke (159,199,242);
    line(mouseX, mouseY, a,b);
    
 }
}  


