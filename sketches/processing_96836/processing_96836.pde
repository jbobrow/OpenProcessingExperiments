




 





float ballX = 100;





float ballY = 0;





float h = 50;





 





//create a variable for speed





float speedY = 2;





 





void setup() {





  size(550,450);





  smooth();





  noStroke();





  ellipseMode(CORNER);





 





}





 





void draw() {





  //clear the background and set the fill colour





  background(755);





  fill(0);





   





  ellipse(ballX, ballY, h,h);





  










  speedY = speedY + 2.5;  





   









  ballY = ballY + speedY; 





   





   





  if (ballY > height - h) {








    ballY = height - h;






    speedY = speedY * -0.9;





     






  }





  else if (ballY <= 5) { 









    speedY = -speedY;





  }





 





   





}


