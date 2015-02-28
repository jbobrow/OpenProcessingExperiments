
void setup() { 
  // algemeen
  size (400,420); 
  smooth(); 
  frameRate(30); 
} 
 
void draw() { 
  // Achtergrond bepalen, bewegen doet achtergrond veranderen
  background(0); 
   
  if(mouseX < width/3) { 
  background(255); 
  }else if (mouseX < 2*width/3) { 
  background(127); 
  }else{ 
  background(0); 
}
  // Koning ophalen door void DrawKoning te activeren
  DrawKoning();   


  // Centermode voor ellipse en rect
  ellipseMode(CENTER); 
  rectMode(CENTER); 


}

   // DrawKoning();  om op te roepen
   void DrawKoning()
{  
   //Draw Koning Zoog's lichaam
   stroke(255); 
   fill(175); 
   rect(mouseX,mouseY,20,100); 
  
   //Draw Koning Zoog's hoofd 
   stroke(0); 
   fill(255); 
   ellipse(mouseX,mouseY-30,80,60); 
  
   //Draw Koning Zoog's ogen (meekleurend)
   fill(mouseX,0,mouseY); 
   ellipse(mouseX-19,mouseY-30,32,32); 
   ellipse(mouseX+19,mouseY-30,32,32); 

 
   //kroontje
   noStroke();
   fill(255,255,0);
   // mee-kleurende blokjes, kroontje
   rect(mouseX-0,mouseY-60,80,20);
   if(mouseX < width/3) { 
   fill(255); 
   }else if (mouseX < 2*width/3) { 
   fill(127); 
   }else{ 
   fill(0); 
 } 
  
   rect(mouseX-25,mouseY-65,10,10);
   rect(mouseX-0,mouseY-65,10,10);
   rect(mouseX+25,mouseY-65,10,10);
 
  //Zoog arm
  stroke(255); 
  line(mouseX+10,mouseY+00,pmouseX+43,pmouseY+00);  
  
  
  //scepter (meekleurend)
  fill(255,255,0);
  rect(mouseX+45,mouseY+15,5,50);
  fill(mouseX,100,mouseY);
  ellipse(mouseX+44,mouseY-15,12,12);
  
  //Draw Koning Zoog's benen 
  stroke(255); 
  line(mouseX-10,mouseY+50,pmouseX-10,pmouseY+60);  
  line(mouseX+10,mouseY+50,pmouseX+10,pmouseY+60);  
} 
 // Deze gast heeft ook nog wat te zeggen
  void mousePressed() { 
  if (mousePressed && (mouseButton == LEFT)) {
    println("al die codes ook,...word helemaal gek!");
    background(255,0,255); 
} else if (mousePressed && (mouseButton == RIGHT))
    background(255,0,255); 
    println("Doods Flits!!Voel de kracht van Koning Zooq!");
  }

