
void setup(){
 size(500, 500);
 background(255);
 smooth();

}
 

void draw() { 
      translate(width/2,height/2);
      noStroke();
      fill(50,100,40,10);
      for (int i=0;i<360;i=i+30){
      rotate(radians(45)); 
      arc(0,10,50,50,0,PI/2);}
  
      fill(180,45,40.20);
      for (int i=0;i<360;i=i+30){
      rotate(radians(30)); 
      triangle(0,45,5,40,-5,35);}
      
     fill(210,200,80,20);
     triangle(0,10,-10,-10,10,-10);
     scale(2);
     triangle(0,0,-10,-20,10,-20);
      
     }
 
    
      
      

  
    
 








