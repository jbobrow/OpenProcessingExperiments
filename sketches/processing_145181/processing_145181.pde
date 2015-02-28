
//Monday, April 21, 2014 11:35 AM
//Patricks Processing Pong Game




boolean gameStart = false;


float x = 200;


float y = 200;  


float speedX = random(5, 7);


float speedY = random(5, 7);


int diam;


int rectSize = 170;


float diamHit;


 


 


void setup() {


 size(700, 700);


 noStroke();


 smooth(3);
 
 stroke(255);    
 
 
 //change frameRate for different ball speed
 
 frameRate(80);


 ellipseMode(CENTER);


}


 


void draw()
{  

//Change background color to change background
 background(#00FF12);

//Change fill to change color of ball and rectangle
 fill(#FF6600);


//Change diam to change size of ball
diam = 20;




{
fill(#0300FF);
 ellipse(x, y, diam, diam);
}






{
fill(#00FFE8);

 rect(0, 0, 20, height);
}




{
fill(#FF0004);

 rect(width-20, mouseY-rectSize/2,8, rectSize);
}

 


 


 if (gameStart) {


 


   x = x + speedX;


   y = y + speedY;


 


   // if ball hits bar, invert X direction and apply effects


   if ( x > width-30 && x < width -20 && y > mouseY-rectSize/2 && y < mouseY+rectSize/2 ) {


     speedX = speedX * -1;


     x = x + speedX;
    


     diamHit = random(70,70);

     
     
  
     ellipse(x,y,diamHit,diamHit);
   
  
    
    
    
    //change rectSize- " " to change how long it takes for the rectangle gets smaller
    rectSize = rectSize-8;


     rectSize = constrain(rectSize, 20,190);       



   }  


 


   // if ball hits wall change direction of X


   else if (x < 25) {


     speedX = speedX * -1.1;


     x = x + speedX;





   }


 


   else {      


   }


   // resets things if you lose

   if (x > width) {  


    gameStart = false;


    x = 150;


     y = 150;  


     speedX = random(3, 5);


     speedY = random(3, 5);


     rectSize = 150;


   }


 


 


   // if ball hits up or down, change direction of Y    


   if ( y > height || y < 0 ) {


     speedY = speedY * -1;


     y = y + speedY;


   }


 }


}


void mousePressed() {


 gameStart = !gameStart;


}


