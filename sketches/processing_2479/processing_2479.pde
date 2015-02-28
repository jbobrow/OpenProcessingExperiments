
/*

cindy Ng
turquois sq
June 16, 2009
cindy.ng@cindysng.com
*/

boolean isDrawing = false;  
  
//this is the setup wrapper. Anything in here happens once at the start of the program.  
  
void setup() {  
  size(500,500);  
  background(0);   
  smooth(); 

    
    
};  
  
//this is the draw wrapper. Anything in here happens once per frame.   
  
void draw(){  
    
 if (isDrawing){  
    
 
   stroke(100,200,100,30); 
  line(200,500,mouseX,mouseY);  
  stroke(50,102,70,70); 
  fill(0,34,78,70); 

 
   
 
  
 };  
    
};  
  
  
void mousePressed(){  
  isDrawing = !isDrawing;  
};  
 


