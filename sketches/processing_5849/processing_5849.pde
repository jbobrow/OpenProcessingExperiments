
void setup() {  
  size (400,420);  
  smooth();  
  frameRate(30);  
}  
  
void draw() {  
  // Achtergrond kleur verandert bij beweging
  background(0);  
    
  if(mouseX < width/3) {  
  background(255,100,200);  
  }else if (mouseX < 2*width/3) {  
  background(127,200,200);  
  }else{  
  background(0);  
} 
  //  Teken Zooq met code
  DrawMuismankat();    
 
  ellipseMode(CENTER);  
  rectMode(CENTER);  
 
 
} 
 
   //tekenen zooq in void
   void DrawMuismankat() 
{   
   //Draw Zoog's lichaam 
   stroke(255);  
   fill(175);  
   rect(mouseX,mouseY,20,100);  
   
   //Draw Zoog's hoofd  
   stroke(0);  
   fill(255);  
   ellipse(mouseX,mouseY-30,80,70);  
   
   //Draw Zoog's ogen  
   fill(mouseX,0,mouseY);  
   ellipse(mouseX-19,mouseY-30,32,32);  
   ellipse(mouseX+19,mouseY-30,32,32);  
 
  
   //Oren bij verschillende breedte muis-man-kat
   noStroke();   
   if(mouseX < width/3) {  
   fill(255);
   stroke(0); 
   ellipse(mouseX-25,mouseY-65,40,40);
   ellipse(mouseX+25,mouseY-65,40,40);
   fill(255,0,0);
   ellipse(mouseX-25,mouseY-62,30,30);
   ellipse(mouseX+25,mouseY-62,30,30);
   fill(0); 
   rect(mouseX+0,mouseY-18,5,5);
   }else if (mouseX < 2*width/3) {  
   fill(127);  
   }else{  
   fill(0);  
   rect(mouseX-0,mouseY-65,60,10);
   rect(mouseX-0,mouseY-60,40,20);
   fill(0); 
   rect(mouseX+0,mouseY-18,5,5);
   //katten ogen
   rect(mouseX+20,mouseY-30,4,15);
   rect(mouseX-20,mouseY-30,4,15);
   }   
  
  //Zoog armpje R
  stroke(255);  
  line(mouseX+10,mouseY+10,pmouseX+43,pmouseY+00);   
   
   
  //Zoog armpje L
  stroke(255);
  line(mouseX-10,mouseY+10,pmouseX-43,pmouseY-00); 
 
   
 //Draw Zoog's poten  
  stroke(255);  
  line(mouseX-10,mouseY+50,pmouseX-10,pmouseY+60);   
  line(mouseX+10,mouseY+50,pmouseX+10,pmouseY+60);   
}  
 // tekst miep/miauw
  void mousePressed() {  
  if (mousePressed && (mouseButton == LEFT)) { 
    println("Miauw!"); 
    background(255,0,255);  
} else if (mousePressed && (mouseButton == RIGHT))   
    println("Miep!"); 
  }


