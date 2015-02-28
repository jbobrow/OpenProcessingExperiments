
int d= 200; //from 0 to 65000


void setup() {
   
  size(400, 400);
 
 
  smooth();
   
}
 
 
void draw() {
  
    
smooth();

  
  
 fill(255,255,255,20);
 if(dist(mouseX,mouseY,width/2,height/2) < 200 ){
    noStroke(); 
    stroke(0); 
    noFill();

    ellipse(d,d, mouseX, mouseY);


   noStroke();
    
     noFill();
   }
       
   if(mousePressed){
     stroke(0);  
     strokeWeight(1);
   }
   else{
     
       background(200);
       fill(255);
       noStroke();  
       float b=dist(200, 200, mouseX, mouseY);
       ellipse(width/2,height/2, b*2,b*2);
       stroke(200);
       strokeWeight(2);
       line(mouseX,mouseY, width/2,height/2);

   }
 
}
