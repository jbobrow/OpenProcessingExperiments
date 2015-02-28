

void setup () {
  size (600,700); 
  background (77,109,175);
  smooth();
 
  int anzahl = 10;
 
  for (int i=0; i<anzahl; i=i+1){
       
     for (int j=0; j<anzahl; j=j+1){
         fill (255,158,93,20);
         if (i%2==10)fill(59,0,100,0);
         noStroke();
         ellipse (j*(width/anzahl+2),i*(height/anzahl+2),random(10,120),random(10,80));
        
         stroke(#58290A,20);
         strokeWeight (random(100));
    
          fill(#58290A,60);
          rect (j*(width/anzahl+5),i*(height/anzahl+2),random(25,50),random(10,95));
          } 
      }
  }
 
 

void draw () {
   
  if (keyPressed){

   if(key=='2') {
      strokeWeight(10);
    stroke(20,60,23,100);
   fill (random(255),random(255),random(255),150);
   rect (mouseX,mouseY,random(-20,20),random(-20,20));
   } 
            
          }
 
   
    if(key=='1') {
      strokeWeight(2);
    stroke(5,100,100,66);
   fill (random(100),random(50),random(100),100);
   rect (mouseX,mouseY,random(-20,20),random(90,120));
   } 
 

 

  if(mousePressed){   
   stroke(5,100,100,66);
      strokeWeight (random(10));
      fill (5,100,100,66);
      ellipse (mouseX,mouseY,random(0,30),random(0,20));
      fill (5,100,100,66);
      ellipse (mouseX,mouseY,random(0,30),random(0,20));
      ellipse (mouseX+random(-20,25),mouseY+random(-20,25),random(0,5),random(0,5));
     
     stroke(5,100,100,66);
    strokeWeight (1);
    fill (5,100,100,66);
    ellipse (mouseX,mouseY,random(0,30),random(0,20));
    rect (mouseX,mouseY,random(15,30),random(10,20));
   }
   
}




