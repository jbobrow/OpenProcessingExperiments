
float vuelta = 0;  
int sat=0;  
int h=0;  
int x=250;  
int y =250;  
int z = 100;  
boolean creciendo = true;  

   

void setup(){  
  size(500,500);
 background(0,255,150); 
 colorMode(HSB,200);   
 strokeWeight(10);  
}  

void draw(){  

 if (mousePressed == true){   

    vuelta=0;  
    x= mouseX;  
    y= mouseY;  

  
if (creciendo==true){  
  
z=z+4;  
  
}  

else {  

z=z-4;    

  }  

 if (z>150) {  
 creciendo=false;  

 }  

 if (z<=0)  {  
creciendo=true;  

 }  

 
while(vuelta<=z) {  

  strokeWeight(4);  

  h=round(mouseY*100/500);  

    sat=round(mouseX*100/500);  

   

stroke(h,sat,6*vuelta);  

ellipse(x,y,round(z-vuelta),round(z-vuelta));  

vuelta=vuelta+1;  

smooth();  

}  

vuelta=0;  

 }  


} 



