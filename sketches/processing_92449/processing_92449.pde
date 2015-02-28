
int myState = 0 ;

void setup() {
  size(500, 500) ;
  frameRate(10) ;
  
}

void draw() {
  
  
  rectMode(CENTER) ;


  background(0, 0, 0) ;
  
 
  if ((mouseX < 100) && (mouseX > 400) && (mouseY > 100) && (mouseY < 400)){
    noStroke() ;
   
     cursor(HAND);
  }
 
  else{
    noStroke() ;
   
      fill(0, 0, 0) ;
      cursor(HAND);
  }
  


switch(myState) {
 case 0:
background(#FF0000) ;

fill(#000000);
rect(250, 250, 50, 50); //left
 
fill(#000000);
rect(250, 250, 50, 50); //top
 
fill(#000000); 
rect(250, 250, 50, 50); //middle

fill(#000000); 
rect(250, 250, 50, 50); //right

fill(#000000); 
rect(250, 250, 50, 50); //bottom

  break;   
  
  case 1:
background(#FF00EE) ;

fill(#000000);
rect(225, 250, 50, 50); //left
 
fill(#000000);
rect(250, 225, 50, 50); //top
 
fill(#000000); 
rect(250, 250, 50, 50); //middle

fill(#000000); 
rect(275, 250, 50, 50); //right

fill(#000000); 
rect(250, 275, 50, 50); //bottom

  break;   
  
    case 2:
background(#AE00FF) ;

fill(#000000);
rect(200, 250, 50, 50); //left
 
fill(#000000);
rect(250, 200, 50, 50); //top
 
fill(#000000); 
rect(250, 250, 50, 50); //middle

fill(#000000); 
rect(300, 250, 50, 50); //right

fill(#000000); 
rect(250, 300, 50, 50); //bottom

  break;
  
 case 3:
background(#4400FF) ;

fill(#000000);
rect(175, 250, 50, 50); //left
 
fill(#000000);
rect(250, 175, 50, 50); //top
 
fill(#000000); 
rect(250, 250, 50, 50); //middle

fill(#000000); 
rect(325, 250, 50, 50); //right

fill(#000000); 
rect(250, 325, 50, 50); //bottom

  break;  
 
 case 4:
background(#006EFF) ;

fill(#000000);
rect(150, 250, 50, 50); //left
 
fill(#000000);
rect(250, 150, 50, 50); //top
 
fill(#000000); 
rect(250, 250, 50, 50); //middle

fill(#000000); 
rect(350, 250, 50, 50); //right

fill(#000000); 
rect(250, 350, 50, 50); //bottom

  break;
 
  case 5:
background(#00DDFF) ;

fill(#000000);
rect(125, 250, 50, 50); //left
 
fill(#000000);
rect(250, 125, 50, 50); //top
 
fill(#000000); 
rect(250, 250, 50, 50); //middle

fill(#000000); 
rect(375, 250, 50, 50); //right

fill(#000000); 
rect(250, 375, 50, 50); //bottom

  break; 
 
  case 6:
background(#00FFB3) ;

fill(#000000);
rect(100, 250, 50, 50); //left
 
fill(#000000);
rect(250, 100, 50, 50); //top
 
fill(#000000); 
rect(250, 250, 50, 50); //middle

fill(#000000); 
rect(400, 250, 50, 50); //right

fill(#000000); 
rect(250, 400, 50, 50); //bottom

  break; 
  
 case 7:
background(#00FF44) ;

fill(#000000);
rect(75, 250, 50, 50); //left
 
fill(#000000);
rect(250, 75, 50, 50); //top
 
fill(#000000); 
rect(250, 250, 50, 50); //middle

fill(#000000); 
rect(425, 250, 50, 50); //right

fill(#000000); 
rect(250, 425, 50, 50); //bottom

  break; 
  
 case 8:
  background(#BBFF00) ;

fill(#000000);
rect(50, 250, 50, 50); //left
 
fill(#000000);
rect(250, 50, 50, 50); //top
 
fill(#000000); 
rect(250, 250, 50, 50); //middle

fill(#000000); 
rect(450, 250, 50, 50); //right

fill(#000000); 
rect(250, 450, 50, 50); //bottom

break ;  

case 9:
  background(#FFF700) ;

fill(#000000);
rect(25, 250, 50, 50); //left
 
fill(#000000);
rect(250, 25, 50, 50); //top
 
fill(#000000); 
rect(250, 250, 50, 50); //middle

fill(#000000); 
rect(475, 250, 50, 50); //right

fill(#000000); 
rect(250, 475, 50, 50); //bottom
  break ;
  
  case 10:
  background(#FF9D00) ;

fill(#000000);
rect(50, 250, 50, 50); //left
 
fill(#000000);
rect(250, 50, 50, 50); //top
 
fill(#000000); 
rect(250, 250, 50, 50); //middle

fill(#000000); 
rect(450, 250, 50, 50); //right

fill(#000000); 
rect(250, 450, 50, 50); //bottom

break ;

case 11:
background(#FF3700) ;

fill(#000000);
rect(75, 250, 50, 50); //left
 
fill(#000000);
rect(250, 75, 50, 50); //top
 
fill(#000000); 
rect(250, 250, 50, 50); //middle

fill(#000000); 
rect(425, 250, 50, 50); //right

fill(#000000); 
rect(250, 425, 50, 50); //bottom

  break;
  
  case 12:
background(#FF00EE) ;

fill(#000000);
rect(100, 250, 50, 50); //left
 
fill(#000000);
rect(250, 100, 50, 50); //top
 
fill(#000000); 
rect(250, 250, 50, 50); //middle

fill(#000000); 
rect(400, 250, 50, 50); //right

fill(#000000); 
rect(250, 400, 50, 50); //bottom

  break;
  
  case 13:
background(#AE00FF) ;

fill(#000000);
rect(125, 250, 50, 50); //left
 
fill(#000000);
rect(250, 125, 50, 50); //top
 
fill(#000000); 
rect(250, 250, 50, 50); //middle

fill(#000000); 
rect(375, 250, 50, 50); //right

fill(#000000); 
rect(250, 375, 50, 50); //bottom

  break;
  
  case 14:
background(#4400FF) ;

fill(#000000);
rect(150, 250, 50, 50); //left
 
fill(#000000);
rect(250, 150, 50, 50); //top
 
fill(#000000); 
rect(250, 250, 50, 50); //middle

fill(#000000); 
rect(350, 250, 50, 50); //right

fill(#000000); 
rect(250, 350, 50, 50); //bottom

  break;
  
  case 15:
background(#006EFF) ;

fill(#000000);
rect(175, 250, 50, 50); //left
 
fill(#000000);
rect(250, 175, 50, 50); //top
 
fill(#000000); 
rect(250, 250, 50, 50); //middle

fill(#000000); 
rect(325, 250, 50, 50); //right

fill(#000000); 
rect(250, 325, 50, 50); //bottom

  break;  
    
  case 16:
background(#00DDFF) ;

fill(#000000);
rect(200, 250, 50, 50); //left
 
fill(#000000);
rect(250, 200, 50, 50); //top
 
fill(#000000); 
rect(250, 250, 50, 50); //middle

fill(#000000); 
rect(300, 250, 50, 50); //right

fill(#000000); 
rect(250, 300, 50, 50); //bottom

  break;

case 17:
background(#00FFB3) ;

fill(#000000);
rect(225, 250, 50, 50); //left
 
fill(#000000);
rect(250, 225, 50, 50); //top
 
fill(#000000); 
rect(250, 250, 50, 50); //middle

fill(#000000); 
rect(275, 250, 50, 50); //right

fill(#000000); 
rect(250, 275, 50, 50); //bottom

  break;  
     
}
}

void mousePressed() {
  myState = myState + 1 ;
  if(myState > 17) {
    myState = 0 ;
  }
}




