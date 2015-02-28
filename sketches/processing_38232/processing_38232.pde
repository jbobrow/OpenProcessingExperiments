
//Iv Shqevi
//transformation. 
//The dot circle made by squares
background(0);
size(300,300);

int mySize = 20;  
int radius = 120;

translate(width/2, height/2);  

for(int i = 0; i < 360; i+=mySize){
  pushMatrix();   
    rotate(radians(i));    
    translate(radius,0);   
    fill(0,255,0);
    rect(0,0,mySize,mySize); 
  popMatrix();    
}

