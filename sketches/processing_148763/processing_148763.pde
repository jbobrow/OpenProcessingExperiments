
//Konkuk University
//Dynamic Media
//JANG Jinseon
//201420105

void setup() {  

  size (1024, 768);  

  background(255);  

  smooth();  

  noLoop();  

}  

   
void draw() {  

  for (int a = 10; a< width; a = a+40) {  
     for (int b = 10; b< width; b = b+40) {  
   
     stroke(#404FFF);  
      strokeWeight(9);  
      fill(20);  
      rect(a-0.4, b-0.4, 20, 50);  

     stroke(#388FFF);  
      strokeWeight(10);
      fill(#FF045F);  
      rect(a-0.2, b-0.2, 10, 10);  

    }  

  }  

}  

   
void keyPressed() {  

  background(255);  

  redraw();  

} 
