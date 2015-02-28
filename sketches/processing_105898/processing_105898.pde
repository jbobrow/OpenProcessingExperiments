
class Monster {

  float x;
  float y;
  float gravity= .1;
  
  float ySpeed;
  float xSpeed;

  void prime(float a, float b) {
    x=a;
    y=b;
    ySpeed = random(1, 5);
    xSpeed = 2;
  }

  void animate() {
    //Body
    fill(0,274,239);
    rect(x, y, 80, 80);
    rect(x, y, 10, 150);
    noStroke();
    rect(x+40, y, 10, 150);


    //Eyes
    fill(0);
    noStroke();
    ellipse(x+30, y+20, 50, 50);
    fill (255);
    ellipse(x+20, y+20, 10, 10);
    fill(0);
    ellipse(x+80, y+20, 35, 35);
    fill(255);
    ellipse(x+90, y+20, 10, 10);

    //Mouth
    if (mousePressed) {
      fill(random(255));
    }
    stroke(255);
    rect(x+60, y+50, 10, 10);
  }

 



  void move(){
    
     if (mousePressed) {
    
   
    
    if(y<=0 || y>=height-150) {
      ySpeed= ySpeed *-1; 
      xSpeed= xSpeed *-1;
      
    }
     y = y + ySpeed;
     ySpeed = ySpeed+gravity;
     
     x = x+ xSpeed;
     xSpeed = xSpeed+gravity;
    
  }
  }




  }



