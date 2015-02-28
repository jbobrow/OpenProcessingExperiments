
float size = 1.0;  
float speed = 0.1;  
int numE = 20;  
void setup(){  
  size(400, 400);  
  background(0);  
}  
void draw()  
{      
    //background(255);
    size = size + speed;  
    if(size > 10.0 || size < 0.5) speed = -1. * speed;  
    for(int i = 0; i < numE; i++)  
    {  
         fill(i * 255 / numE); 
        // noStroke();
         ellipse( i*mouseX,  i*mouseY, i * size, i * size);   
         
         stroke(255,20);
         line( 200, 200, i*mouseX,  i*mouseY);  
    }  
} 


