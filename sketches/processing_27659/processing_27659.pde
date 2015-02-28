
PFont regular;
PFont bold;
PFont italicbold;
PFont italic;

void setup() {
  size(640, 480);
  smooth();
 regular = loadFont("CordiaUPC-200.vlw");
 bold = loadFont("CordiaUPC-Bold-200.vlw");
 italicbold = loadFont("CordiaUPC-BoldItalic-200.vlw"); //fonts
 italic = loadFont("CordiaUPC-Italic-200.vlw");
 textFont(regular);
 textSize(200);
  
}

void draw() {

  int s = second();  // Values from 0 - 59
  int m = minute();  // Values from 0 - 59
  int h = hour();    // Values from 0 - 23
  
  //minutes digits
  int ones_digit = m%10;
  int tens_digit = m/10;

  background(255); //white background for AM
  
  if( h > 12) { //IF PM
    background(5); //black background for PM
    fill(50);
    h = h - 12;
  }
  else { //if AM
    background(255);
    fill(240);
  }
 
 //first line
 //////////////1
     if(h == 1){//1
      textFont(bold);
      fill(230);
      text("1", 20, 110); //1 
      fill(50);
      textFont(regular);
      
   }else{
      text("1", 20, 110); //1
     
     
      
      
if(tens_digit==1) { ////1 MINUTES TENS
textFont(italicbold);
fill(150);
text("1", 20, 110); 
fill(50);
textFont(regular);

}else{
text("1", 20, 110);


if(ones_digit==1) { //////1 MINUTES ONES
textFont(italic);
fill(125);
text("1", 20, 110);
fill(50);
textFont(regular);

}else{
  text("1", 20, 110);
}
     
   }
//////////////2
     if(h == 2){//2
      textFont(bold);
      fill(230);
      text("2", 120, 110); //2 
      fill(50);
      textFont(regular);
    
   }else{
      text("2", 120, 110); //2
     
   } 
   
     
if(tens_digit==2) { ////2 MINUTES TENS
textFont(italicbold);
fill(150);
text("2", 120, 110); 
fill(50);
textFont(regular);

}else{
text("2", 120, 110); 


   
   if(ones_digit==2) { //////2 MINUTES ONES
textFont(italic);
fill(125);
text("2", 120, 110);
fill(50);
textFont(regular);

}else{
  text("2", 120, 110);
}
     
   
   }
    
    ///////////////3
     if(h == 3){//3
      textFont(bold);
      fill(230);
    text("3",220, 110); //3
     fill(50);
      textFont(regular);
      }else{
      text("3", 220, 110); //3 
     
     
if(tens_digit==3) { ////3 MINUTES TENS
textFont(italicbold);
fill(150);
text("3", 220, 110); 
fill(50);
textFont(regular);

}else{
text("3", 220, 110); 
   }
   
   if(ones_digit==3) { //////3 MINUTES ONES
textFont(italic);
fill(125);
text("3", 220, 110);
fill(50);
textFont(regular);

}
     
     
   }
   
   /////////4
   
 //first line
 //////////////4
     if(h == 4){//4
      textFont(bold);
      fill(230);
      text("4", 320, 110); //4 
      fill(50);
      textFont(regular);
      
   }else{
      text("4", 320, 110); //4
     
     
      
      
if(tens_digit==4) { ////4MINUTES TENS
textFont(italicbold);
fill(150);
text("4", 320, 110); 
fill(50);
textFont(regular);

}else{
text("4",320, 110);


if(ones_digit==4) { //////4 MINUTES ONES
textFont(italic);
fill(125);
text("4", 320, 110);
fill(50);
textFont(regular);

}else{
  text("4",320, 110);
}
     
}

   }

////////////5    
   if(h == 5){//5
      textFont(bold);
      fill(230);
      text("5",420, 110); //5 
      fill(50);
      textFont(regular);
      
   }else{
      text("5",420, 110); //5 
      
     if(tens_digit==5) { ////5 MINUTES TENS
textFont(italicbold);
fill(150);
text("5", 420, 110); 
fill(50);
textFont(regular);

}else{
text("5", 420, 110); 

   }
   
   if(ones_digit==5) { //////5 MINUTES ONES
textFont(italic);
fill(125);
text("5", 420, 110);
fill(50);
textFont(regular);

}else{
  text("5", 420, 110);
}
     
   
   }
/////////////////////6

    if(h == 6){//6
      textFont(bold);
      fill(230);
        text("6",520, 110); //6
      fill(50);
      textFont(regular);
      
   }else{
        text("6",520, 110); //6
        
        if(tens_digit==6) { ////6 MINUTES TENS
textFont(italicbold);
fill(150);
text("6", 520, 110); 
fill(50);
textFont(regular);

}else{
text("6", 520, 110); 

   }
   
   if(ones_digit==6) { //////6 MINUTES ONES
textFont(italic);
fill(125);
text("6", 520, 110);
fill(50);
textFont(regular);

}else{
  text("6", 520, 110);
}
     
     
   } 
    
    //second line
   //////////////////7
    
    if(h == 7){//7
      textFont(bold);
      fill(230);
        text("7",20, 250); //7
      fill(50);
      textFont(regular);
      
   }else{
        text("7",20, 250); //7
        
    if(ones_digit==7) { //////7 MINUTES ONES
textFont(italic);
fill(125);
text("7", 20, 250);
fill(50);
textFont(regular);

}else{
  text("7", 20, 250);
}
     
   
   }
   
   /////////////////8
   
    if(h == 8){//8
      textFont(bold);
      fill(230);
         text("8",120, 250); //8
      fill(50);
      textFont(regular);
      
   }else{
         text("8",120, 250); //8
         
              
    if(ones_digit==8) { //////8 MINUTES ONES
textFont(italic);
fill(125);
text("8", 120, 250);
fill(50);
textFont(regular);

}else{
  text("8", 120, 250);
}

   }
/////////////9   
    
  if(h == 9){//9
      textFont(bold);
      fill(230);
      text("9",220, 250); //9
      fill(50);
      textFont(regular);
      
   }else{
      text("9",220, 250); //9 
      
             
    if(ones_digit==9) { //////9 MINUTES ONES
textFont(italic);
fill(125);
text("9", 220, 250);
fill(50);
textFont(regular);

}else{
  text("9", 220, 250);
}

   }
  
 //////////////10
     if(h == 10){//10
      textFont(bold);
      fill(230);
      text("1 0", 320, 250); //10
      fill(50);
      textFont(regular);
      
   }else{
      text("1 0", 320, 250); //10
   
 if(tens_digit==0) { ////0 MINUTES TENS
textFont(italicbold);
fill(150);
text("0", 420, 250); 
fill(50);
textFont(regular);

}else{
text("0", 420, 250);


   }
       
    if(ones_digit==0) { //////0 MINUTES ONES
textFont(italic);
fill(125);
text("0", 420, 250);
fill(50);
textFont(regular);

}else{
  text("0", 420, 250);
}
   }
    //third line
    ///////////////////11
    if(h == 11){//11
      textFont(bold);
      fill(230);
       text("1 1",20, 390); //11
      fill(50);
      textFont(regular);
      
   }else{
       text("1 1",20, 390); //11
     
   }

    ////////////////////12
    
    
    if(h == 12){//12
      textFont(bold);
      fill(230);
      text("1 2",220, 390); //12
      fill(50);
      textFont(regular);
      
   }else{
      text("1 2",220, 390); //12
     
   }
  
   
      }
   }




