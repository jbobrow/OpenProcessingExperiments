
 PFont font ;
 
 void setup (){
   size (500,500);
   smooth();
   font = loadFont("DIN-Black-48.vlw");
   textFont(font);
 }
 
 void draw () {
   background (255);
   textSize(36);
  
   
    if (mousePressed == true) {
    int x = mouseX;
    int y = mouseY;
    fill (0);
    text ("S", 50, 300);
  }
  else {
    fill(0);
    text ("S", 50, 300); 
}


if (mousePressed == true) {
    
    fill (0);
    text ("P", 75+5, 300);
  }
  else {
    fill(0);
    text ("P", 75, 300); 
}

if (mousePressed == true) {
    
    fill (0);
    text ("R", 100+25, 300);
  }
  else {
    fill(0);
    text ("R", 100, 300); 
}

if (mousePressed == true) {
    
    fill (0);
    text ("E", 127+70, 300);
  }
  else {
    fill(0);
    text ("E", 127, 300); 
}

if (mousePressed == true) {
    
    fill (0);
    text ("A", 151+140, 300);
  }
  else {
    fill(0);
    text ("A", 151, 300); 
}

if (mousePressed == true) {
    
    fill (0);
    text ("D", 178+300, 300);
  }
  else {
    fill(0);
    text ("D", 178,300); 
}

   
   
   
 
 
 }
 
 
 
 
 
// for (int x =20; x<width; x+=20) {
//     float mx = mouseX / 10;
//     float offsetA = random (-mx, mx);
//     float offsetB = random (-mx, mx);
//     line (x +offsetA, 20, x-offsetB, 100);
//   }    

