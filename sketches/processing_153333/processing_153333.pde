
void setup(){
  
 size(800,300);
   background(255,255,255);
    noCursor();

}
 
void draw(){
   
 if(mousePressed){
   
          noStroke();
   fill(mouseY,200,mouseY/3);
   rect(mouseX,0,10,100);     
   
    noStroke();
   fill(mouseY,mouseX,55);
   rect(mouseX+67,0,10,100);
   
         noStroke();
   fill(mouseX,55,mouseY);
   rect(mouseX-9,25,15,100);
   
       noStroke();
   fill(14,mouseX-10,mouseY);
   rect(mouseX-50,35,15,100);
   
        noStroke();
   fill(0,mouseY,mouseX);
   rect(mouseX-2,65,15,100);
   
     noStroke();
   fill(mouseY,mouseX,180);
   rect(mouseX-90,65,100,10);
   
        noStroke();
   fill(mouseX,200,120);
   rect(mouseX+77,165,100,10);
   
            noStroke();
   fill(mouseX,mouseY,255);
   rect(mouseX+10,300,10,56);   
   
                noStroke();
   fill(mouseY,mouseX/2,100);
   rect(mouseY-5,250,100,30);
   
               noStroke();
   fill(mouseX,mouseY/2,100);
   rect(mouseY+mouseX,290,10,100);
   
           noStroke();
   fill(mouseX,mouseY,50);
   rect(mouseY*mouseX,165,100,10);
   
              noStroke();
   fill(mouseY*mouseX,mouseX,0);
   rect(mouseX,175,100,30);
  
   
 }else{  
   
       noStroke();
   fill(mouseX,80,mouseY);
   rect(mouseX,0,10,100);          
   
   noStroke();
   fill(mouseX/2,80,mouseY/3);
   rect(mouseX+mouseX+400,0,10,100);
   
      noStroke();
   fill(mouseY,90,mouseX/2);
   rect(mouseX,25,15,100);
   
    noStroke();
   fill(255,mouseX-10,mouseY/2);
   rect(mouseX-300,55,15,100);
   
     noStroke();
   fill(255,mouseY,mouseX);
   rect(mouseX,70,15,100);
   
    noStroke();
   fill(mouseX,0,255);
   rect(mouseX-15,180,10,100);
   
         noStroke();
   fill(mouseX/2,mouseY,255);
   rect(mouseX-10,200,15,100);
   
            noStroke();
   fill(mouseX,mouseY/2,255);
   rect(mouseY,250,10,100);
   
              noStroke();
   fill(mouseY,mouseX/2,0);
   rect(mouseX-5,200,100,30);
         
         noStroke();
   fill(mouseY,mouseX,255);
   rect(mouseX+10,150,10,10);   
   
               noStroke();
   fill(mouseX,mouseY/2,255);
   rect(mouseY,230,10,100);
   
              noStroke();
   fill(mouseY,mouseX/2,0);
   rect(mouseX-5,250,100,30);
   
               noStroke();
   fill(mouseX,mouseY/2,255);
   rect(mouseY,290,10,100);
   
                 noStroke();
   fill(mouseY,mouseX/2,0);
   rect(mouseY+600,250,100,30);
   
               noStroke();
   fill(mouseX,mouseY/2,255);
   rect(mouseX+400,290,10,100);
   
         noStroke();
   fill(mouseX,mouseY/2,255);
   rect(mouseX+400,290,10,30);
   

   
   }
 
 
 
 
 
 }

