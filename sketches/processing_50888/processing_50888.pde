
int barcoX;
 
void setup(){
  size(700,420);
  barcoX=5;
   
}
 
void draw(){

  background(20);
  fill(255);
  ellipse(500,100, 100, 100);
   fill(11,70,155);
    rect(0,300,800,650);
    noStroke();
     smooth();
      fill(255);
      triangle(barcoX-50,350,barcoX+100,200,barcoX+100,400);

      fill(58,41,32);
       quad(barcoX,450,barcoX-50,350,barcoX+200,350,barcoX+150,450);
       
  
  barcoX=barcoX+1;
      
}
    
