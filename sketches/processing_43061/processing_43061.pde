
// next step, create a button using circles and booleans 


float dia = 100;
float x = dia/2;
float y = dia/2;
float xspeed = 4;
float yspeed = 6;
float col;
float colChange = xspeed-1;




void setup() {

  size (600, 600);
  smooth();
}

void draw () {

  background(255);

  x = x + xspeed;
  y = y + yspeed;
  col = x/2.4;



  fill (0, 0, col);
  ellipse (x, y, dia, dia);


  if (x > width-dia/2 || x < dia/2) {
    xspeed = xspeed * -1;
  }
  
  if (y > height-dia/2 || y < dia/2) {
    yspeed = yspeed * -1; 
  }


  
  
  
}
  void mousePressed (){
    xspeed = xspeed * -1;
        
  }
  
  
  
  void keyPressed (){
    if (key == 'f'){
      xspeed = xspeed * 2;
      yspeed = yspeed * 2;
    }
       
     if (key == 's') {
       xspeed = xspeed / 2;
       yspeed = yspeed / 2;
     }
  }
  
       
    
 /* I want to make it go faster when  press any key
 yet I don't know how to assign specific funtions to key [pressed.
 */
  
    




