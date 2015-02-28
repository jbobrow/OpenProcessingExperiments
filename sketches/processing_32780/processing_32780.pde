

/*Assignment by Catalina Cortazar */

PFont  myDisplayFont;

void setup() {
  size(150, 120);
  background(65, 150, 91);
  smooth();
  
   smooth();
  myDisplayFont=loadFont("AmericanTypewriter-Bold-48.vlw"); 
   
  
 
}



void draw() {
  
  
  
  

  noStroke();

  fill(112, 144, 108);
  rect(0, 0, 45, 37);

  fill(70, 186, 3);
  quad(45, 20, 86, 20, 86, 70, 45, 70);  

  fill(32, 99, 70);
  rect(0, 37, 45, 91-37);


  fill(45, 55, 56);
  rect(0, 91, 7, 107-91);

  fill(176, 225, 66);
  rect(7, 91, 30, 107-91);
  
   fill(176, 225, 66);
  rect(30, 91, 15, 120-91);

   fill(176, 225, 66);
  quad(45, 70, 86, 70, 86, 120, 45, 120);  


   fill(37, 87, 67);
  quad(86, 101, 113, 101, 113, 120, 86, 120);  
  
     fill(136, 215, 14);
  rect(113, 101, 150-113, 120-101);
  
  
  
   fill(93, 151, 119);
  quad(143, 77, 150, 77, 150, 101, 143, 101);  
  
    
   fill(63, 104, 62);
  quad(143, 20, 150, 20, 150, 77, 143, 77);  
  
  
      
   fill(61, 142, 86);
  quad(86, 70, 143, 70, 143, 101, 86, 101);  
  
  fill(0, 0, 0);
 
  textFont (myDisplayFont, 48);
  text("G",0,37);
  textFont (myDisplayFont, 41);
  text("R",45,70);
  textFont (myDisplayFont, 37);
  text("E",86,101);
  
  textFont (myDisplayFont, 48);
  text("E",45,120);
  
  textFont (myDisplayFont, 27);
  text("N",113,120);
  
  
}


