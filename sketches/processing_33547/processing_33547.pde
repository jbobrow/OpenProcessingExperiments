
//Santiago Peraza - August 4th - text on green tiles - hw3
  
 PFont myDisplayFont;
 
 void setup() {
 size (150, 119);
 smooth();
 myDisplayFont = loadFont("neo-geo3D-20.vlw");
 textAlign(LEFT);
}
  
 void draw () {
   
 noStroke();
   
 colorMode(RGB);
     
 fill(40,112,62); //  green one on the left top side
 rect(0,0,10,60);
   
 fill(32,38,41); //  next
 rect(10,0,20,60);
   
 fill(50,163,2); //  left  BOTTOM BIG
 rect(0,60,60,60);
  
 fill(32,38,41); //  left bottom SMALL
 rect(0,112,30,10);
  
 fill(18,119,53); //
 rect(30,0,25,12);
  
 fill(27,87,63);  //
 rect(55,0,50,12);
  
 fill(69,120,18); //  top right corner
 rect(105,0,45,15);
  
 fill(87,145,113); //  long one
 rect(30,12,120,9);
  
 fill(109,190,0); //  right
 rect(125,21,25,50);  
       
 fill(40,80,42); //
 rect(102,21,23,68); 
 
 fill(64,191,37); //   middle light green
 rect(93,21,9,45);
  
 fill(34,134,66); //botttom right
 rect(125,70,63,50);
  
 fill(168,218,50); //  BOTTOM light
 rect(83,93,42,40);
  
 fill(23,116,71); //  thin on top of ^
 rect(83,89,42,5);
   
 fill(87,145,113); // square
 rect(83,66,19,24);
  
 fill(20,110,71); // xx
 rect(66,66,18,55);
  
 fill(24,45,39); // xxthin
 rect(60,66,6,55);
       
 fill(109,190,0); //  last one
 rect(30,21,63,45);
  
    fill(#04dafa);   //   center text
  textFont(myDisplayFont, 20);
  text("HELLO", 32, 47);
  
      fill(#ffffff);   //   center text
  textFont(myDisplayFont, 40);
  text("Y'ALL!!", 5, 95);
  }

