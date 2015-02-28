
//weich - hart
//Freude vs Wut

void setup() {
  size(500,500);
  smooth();
   
}
 
void draw() { 
  if(mousePressed){
   background(0);
   noStroke(); 
   
   //Augen
   fill(255);
   ellipse(200,150,50,50);
   ellipse(300,150,50,50);
   
   //Mund  
   fill(255);
   ellipse(250,380,230,200);
   fill(0);
   ellipse(250,400,250,200);
   
   //böse Augen
   fill(0);
   ellipse(200,150,20,20);
   ellipse(300,150,20,20);
   ellipse(250,50,250,200);

    
  }else{
   
   background(255);
   noStroke();
   
   //Augen
   fill(0);
   ellipse(220,150,40,100);
   ellipse(280,150,40,100);

   
   //Mund
   fill(0);
   ellipse(250,270,230,200);
   fill(255);
   ellipse(250,250,250,200);
   

  }
 }
