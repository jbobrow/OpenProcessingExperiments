
/*
Elizabeth Clare
Aug 4 green Quilt with words!
*/
PFont myDisplayFont;

void setup() {
  
  size(150,120);
  background(110,194,2);//background,largest color
   
   
 fill(10);
 
  
}

void draw () {
  
 myDisplayFont= loadFont("Zapfino-48.vlw");
 
  textFont(myDisplayFont,10);
  smooth();
text("its cool to",5,50);

  fill(41,46,50);
  noStroke();
  colorMode(RGB);
 //im starting at top left and moving right for the rectangles
  rect(74,0,37,38);

  fill(116,143,110);  
  rect(110,0,40,38);//top right rect
  
fill(74,131,102);  //4
  rect(0,52,40,26);  
 
fill(59,111,13);  
  rect(40,52,31,48); 
  
 fill(62,181,4);  
  rect(71,34,44,68); 
  
  
  
  fill(34,130,37);  
  rect(115,38,14,54); 
  


 fill(32,99,69);  
  rect(129,38,21,54);  
 
   fill(162,207,51);  //rectable number9
  rect(0,78,41,5); 
  
 fill(26,34,35);  
  rect(0,83,40,37);  
  
   fill(31,71,38);  
  rect(40,100,31,20);  
  
   fill(64,194,44);  
  rect(71,100,16,20);  
  
   fill(80,134,106); //rect13
  rect(87,100,28,20);  
 
  fill(36,55,54);  
  rect(115,92,35,28);  
  
   fill(44,131,77);  
  rect(126,108,24,12);  //15bottomright
 
  fill(101,133,97);  
  rect(71,116,16,4);  
 
   myDisplayFont= loadFont("Zapfino-48.vlw");
  textFont(myDisplayFont,8);
  smooth();
text("be green!",71,98);
 
 


  
 
 
 
 
  
}

