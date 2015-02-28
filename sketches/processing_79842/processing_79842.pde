
float xPos=20;  
float yPos=50;  
float zPos=80;  
float xDir = 1;  
void setup() {  
size(500,300);  
noCursor();  

}  

void draw() {  
background(10,52,57);  
fill(250,216,23);
ellipse(xPos, height/2, 60, 60);  
xPos = xPos + 1;   
if(xPos > width)  {  
xPos = 20;  

  }  

     
fill(16,40,157);
ellipse(yPos, width/2, 50, 50);  
yPos = yPos + 1;   
if(yPos > width)  {  

  yPos = 50;  

  }  
fill(196,18,2);
ellipse(zPos, width/2, 80, 80);  
zPos = zPos + 2;   
if(zPos > width)  {  
 zPos = 80;  

}  


     

     


     

     

} 




