

/* @pjs font="Radley-Italic.otf"; */
int x=0; 

int myState = 0 ; 
PImage martha; 
PFont Rad;  

void setup() { 
  size (500, 500); 

  martha=loadImage ("martha.jpg");
 Rad =createFont ("Radley-Italic.otf"); 

}
void draw(){ 
  
  
  switch(myState){
  case 0:
  image (martha, 0, 0, 510, 510);
  textFont(Rad, 28); 
  fill (#FA1753);
  text("Poor, ticklish, Martha hates mouse clicks!", 5, x); 
  x=x+1.5;
  break; 

case 1:
  image (martha, 0, 0, 510, 510);
  textFont(Rad, 20);
  fill (#4737DB);
  text("Don't click the mouse.", 310, 378); 
  break; 

case 2:
  image (martha, 0, 0, 510, 510);
  textFont(Rad, 20);
  fill (#050001);
  text("STOP now!", 310, 378); 
break; 

 case 3:
  image (martha, 0, 0, 510, 510);
  textFont(Rad, 20);
  fill (#341BCB);
  text("ha ha ha ha", 310, 378); 
  break; 
  
  case 4:
  image (martha, 0, 0, 510, 510);
  textFont(Rad, 20);
  fill (#08ABFA);
  text("it tickles, it tickles", 310, 378);
 break; 
 
   case 5:
  image (martha, 0, 0, 510, 510);
  textFont(Rad, 20);
  fill (#8719F7);
  text("ha ha ha ha ha", 310, 378);
 break; 
 
  case 6:
  image (martha, 0, 0, 510, 510);
  textFont(Rad, 20);
  fill (#FF8F05);
  text("it tickles, it tickles",310, 378);
 
 
  }  
} 
void mousePressed(){ 
  
  myState ++; 
    if (myState > 6){ 
  myState = 3;
  }
}



