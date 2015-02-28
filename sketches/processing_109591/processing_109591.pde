
int as = 200;
int bs = 200;
int cs = 200;
int aa = 200;
int bb = 200;
int cc = 200;
int aaa = 200;
int bbb = 200;
int ccc = 200;
int win = 200;



void setup() {
  size(700,300);  //Set the window to 700 x 300 pixels
  background(200); //Set the background as grey color
  smooth();
 }

void draw() {
  stroke (0);     //Set line value to black
  
  // Setting of Right part
 
   
  fill(as);
  rect(0,0,100,100);    // Set the location of square a
  fill(bs);
  rect(0,100,100,100);  // Set the location of square b
  fill(cs);
  rect(0,200,100,100);  // Set the location of square c
  fill(aa);
  rect(100,0,100,100);    // Set the location of square aa
  fill(bb);
  rect(100,100,100,100);  // Set the location of square bb
  fill(cc);
  rect(100,200,100,100);  // Set the location of square cc
  fill(aaa);
  rect(200,0,100,100);    // Set the location of square aaa
  fill(bbb);
  rect(200,100,100,100);  // Set the location of square bbb
  fill(ccc);
  rect(200,200,100,100);  // Set the location of square ccc
  
  

  if (mouseX > width/3 && mouseX < width*2/3 ){
   if ( mouseY > 0 && mouseY < height/3) {
   fill(255,0,0);                                //set Red fill color
  rect(300,0,100, 100);
   } 
  else if ( mouseY > 100 && mouseY < 200 ){ // Set Yellow fill color
   fill(240,240,0);
   rect(300,100,100,100);
   }
  else if ( mouseY > 200 && mouseY < height) {  // Set Green color
   fill(0,255,0);
  rect(300,200,100,100);
   } 
  }
  
  // Setting of right part
  fill(0);
  rect(440,50,60,60);                    // Set black sqaure
  fill(255);
  rect(600,50,60,60);                    // Set white square
  stroke(55);
  line(520,75,530,105);                  // Set Letter 'V'
  line(530,105,540,75);
  line(580,75,560,85);                   // Set Letter 'S'
  line(560,85,580,95);
  line(580,95,560,105);
  
  fill(win);
  rect(500,200,100,50);
  win = win - 1;
  if (win < 0) { win = 200;}
  
 }



void mouseReleased() {
 // Restart the game, erase 3 x 3 grids
  if ( mouseX > 300 && mouseX < 400 ) {
    if ( mouseY > 0 && mouseY < 300) {
      if ( as == 0 ) {
       as = 200;
      } else {
       as = 200;
    }
      if (bs == 0 ) {
       bs = 200;
      } else {
       bs = 200;
    }
      if (cs == 0 ) {
       cs = 200;
      } else {
       cs = 200;
    }
      if (aa == 0 ) {
       aa = 200;
      } else {
       aa = 200;
    }
      if (bb == 0 ) {
       bb = 200;
      } else {
       bb = 200;
    }
      if (cc == 0 ) {
       cc = 200;
      } else {
       cc = 200;
    }
     if (aaa == 0 ) {
       aaa = 200;
      } else {
       aaa = 200;
    }
      if (bbb == 0 ) {
       bbb = 200;
      } else {
       bbb = 200;
    }
      if (ccc == 0 ) {
       ccc = 200;
      } else {
       ccc = 200;
    }
    
    
    
   }
  }
  
  
  
 // 3 x 3 grids  
  if ( mouseX > 0 && mouseX < 100) {     //First columne
    if ( mouseY > 0 && mouseY < 100) {   //First columne, First row
      if ( as == 0 ) {
        as = 255;
      } else {
        as = 0;
      }
    }
    else if ( mouseY > 100 && mouseY < 200) { //First columne, second row
     if ( bs == 0 ) {
       bs = 255;
     } else {
       bs = 0;
     }
    }
    else if ( mouseY > 200 && mouseY < 300) { //First columne, third row
      if ( cs == 0 ) {
        cs = 255;
      } else {
        cs = 0;
      }
    }
  }
  if ( mouseX > 100 && mouseX < 200) {  //Second columne
    if ( mouseY > 0 && mouseY < 100) {  //Second columne, first row
      if ( aa == 0 ) {
        aa = 255;
      } else {
        aa = 0;
      }
    }
    if ( mouseY > 100 && mouseY < 200) { //Second columne, second row
      if ( bb == 0) {
        bb = 255;
      } else {
        bb = 0;
      }
    }
    if ( mouseY > 200 && mouseY < 300) { //Second columne, third row
      if ( cc == 0) {
        cc = 255;
      } else {
        cc =0;
      }
    }
  }
  if ( mouseX > 200 && mouseX < 300) {  //Third columne
    if ( mouseY > 0 && mouseY < 100) {  //Third columne, first row
      if ( aaa == 0 ) {
        aaa = 255;
      } else {
        aaa = 0;
      }
    }
    if ( mouseY > 100 && mouseY < 200) { //Third columne, second row
      if ( bbb == 0) {
        bbb = 255;
      } else {
        bbb = 0;
      }
    }
    if ( mouseY > 200 && mouseY < 300) { //Third columne, third row
      if ( ccc == 0) {
        ccc = 255 ;
      } else {
        ccc =0;
      }
    } 
  }

   
}
