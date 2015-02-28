
/* @pjs font="Corben-Bold.otf"; */
int myState = 0;
PFont Corben; 


void setup() { 
size (500,500); 
background (#C6ED1A); //neon yellow//  
frameRate (3); 
Corben = createFont("Corben-Bold.otf"); 
}

void draw () { 


 println("mouseX="+ mouseX); 
 
 if (mouseX>width/4){ 
    fill (random (255), random (255), random (255)); 
  }
    else {
      
  fill (#8115FF); //purple//
}
  noStroke(); 
rect (width/2, height/2, 150, 150);
rectMode (CORNER);
rect (width/2, height/2, 100, 100);
rectMode (CORNERS); 
rect (width/2, height/2, 50, 50); 
rectMode (CENTER); 
rect (width/2, height/2, 100, 100);
rectMode (CORNERS); 

 
  switch(myState){ 
  
      
   case 0: 
   fill(#6D5FF2); //purple//
   text ("click the mouse", 200, 30); 
   break; 
   
   case 1: 
   textFont (Corben, 160); 
   fill(#E8AD15); //orange//
   text ("Pow!", 0, 200); 
   break; 
    
   case 2: 
   textFont (Corben, 140); 
   fill(#FF03C9); // pink// 
   text ("Pow!", 30, 300); 
   break; 
   
   case 3: 
   textFont (Corben, 110); 
   fill(#FF4203); //red// 
   text ("Pow!", 70, 400); 
   break; 
   
   case 4:
   textFont (Corben, 65); 
   fill(#CF07F7);//purple// 
   text ("I'm a laser!", 21, 500); 
   break; 
 
}
}
void mousePressed() { 
line (#AF0726);//dark red//
  rect (width/4, height/4, 20, 20); 
fill (#F70734); //cherry red//
rectMode (CENTER);
 
  myState ++; 
  if (myState > 4){ 
  myState = 0;
  }
}


