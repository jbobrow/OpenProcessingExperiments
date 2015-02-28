
int rood;  
int groen;  
int blauw;  
  

void setup() {  
  size(500, 500);  
  noLoop();  
}  
  
float x = 0;  
  
void draw() {  
  background(rood,groen,blauw);  
  x = x + .1;  
  if (x > width) {  
    x = 0;  
  }  
    
 
 
//Spons BOB
    fill(100,255,0);  
    rect(mouseX+25,mouseY-35,90,90);
   
   
  // Mond
    fill(255);  
    rect(mouseX,mouseY,150,50);  

    
 // Neus
    fill(#AFFC00);
    ellipse(mouseX+75,mouseY+5,30,30);  
  
  
  // Ogen
    fill(255);  
    rect(mouseX-50,mouseY-90,100,100);  
    rect(mouseX+100,mouseY-90,100,100);  
     
   
  // Pupil
     fill(0); 
     ellipse(mouseX+20,mouseY-14,15,15);  
      ellipse(mouseX+120,mouseY-14,15,15); 
         
}

  
void mousePressed() {  
    loop();  
    rood=int(random(0,255));  
    groen=int(random(0,255));  
    blauw=int(random(0,255));  
}  
  
void mouseReleased() {  
  noLoop();  
}  
 


