
int myState = 0 ; 


void setup() {
  size(500, 500) ;
 smooth() ;  
}

void draw() {
  
  background(0) ; 
  
  switch(myState) {
   case 0:
   textAlign(CENTER) ; 
   textSize(50) ; 
   text("Color Mix", width/2, height/2) ; 
  break;
 
 case 1:
 textSize(25) ; 
 fill(255) ; 
 text("Mix two colors to make", 240, 350) ; 
 fill(255, 255, 0) ;
 rect(90,200, 60, 50) ;
 fill(#008000) ; 
 rect(170, 200, 60, 50) ;
 fill(#FF0000) ; 
 rect(250, 200, 60, 50) ; 
 fill(#800080) ; 
 rect(330, 200, 60, 50) ;
 fill(#ffa500) ; 
 rect(215, 370, 60, 50) ; 
 fill(255) ; 
 text("Orange", 275, 415) ;
 break;

 case 2:
 textSize(25) ;
 fill(255) ; 
 text("Mix two colors to make", 240, 350) ; 
 fill(#FFA500) ; 
 rect(90, 200, 60, 50) ; 
 fill(#FF0000) ; 
 rect(170, 200, 60, 50) ; 
 fill(#0000FF) ; 
 rect(250, 200, 60, 50) ; 
 fill(#FF8080) ; 
 rect(330, 200, 60, 50) ; 
 fill(#800080) ; 
 rect(215, 370, 60, 50) ; 
 fill(255) ; 
 text("Purple", 275, 415) ; 
 break;
 
 case 3:
 textSize(25) ; 
 fill(255) ; 
 text("Mix two colors to make", 240, 350) ; 
 fill(#0000FF) ; 
 rect(90, 200, 60, 50) ; 
 fill(#800080) ; 
 rect(170, 200, 60, 50) ; 
 fill(#FF0000) ; 
 rect(250, 200, 60, 50) ; 
 fill(#FFFF00) ; 
 rect(330, 200, 60, 50) ; 
 fill(#008000) ; 
 rect(215, 370, 60, 50) ; 
 fill(255) ; 
 text("Green", 270, 415) ;
 break;
 
 case 4:
 textSize(25) ; 
 fill(255) ; 
 text("Mix two colors to  make", 240, 350) ; 
 fill(#FFA500) ; 
 rect(90, 200, 60, 50) ; 
 fill(#FFFFFF) ; 
 rect(170, 200, 60, 50) ; 
 fill(#008000) ; 
 rect(250, 200, 60, 50) ; 
 fill(#0000FF) ; 
 rect(330, 200 , 60, 50) ; 
 fill(#34DDDD) ; 
 rect(215, 370, 60, 50) ; 
 fill(255); 
 text("Turquoise", 280, 415) ; 
 break;


  }
  
} 

void mouseReleased() {
 myState = myState + 1 ;

  // if myState greater than 1, I have to reset it..
  
}


