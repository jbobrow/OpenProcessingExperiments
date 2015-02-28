

boolean firstTime;

public void setup() {
  size(550,550);
  smooth();
  background(255);
  noFill();
  firstTime = true;
  
}

public void draw() {
  // background(255, 255, 255);
  
   pushStyle();
  fill(150, 150, 250, 20);
  noStroke();
  rect(0,0, width, height);
  popStyle();
 
 float ang2 = radians(frameCount * 2  % 360); 

 int w=width/2;
 int h=height/2;
 float b=random(255);
    

 ////////////////////////////////////////////////////////////////////// 
 //1st OBJECT
 
    pushMatrix();
    translate(50,50);
    for (int i=0;i<10;i++) {
    fill(255,0,b);
    rect(i,i,50,50);
    translate(50,50);
    rotate(ang2);
    }
    popMatrix();
    
    pushMatrix();
    translate(50,50);
    for (int i=0;i<10;i++) {
    fill(0,255,b);
    triangle(0, 0, 25, -50, 50, 0);
    translate(50,50);
    rotate(ang2);
    }
    popMatrix();
    
    pushMatrix();
    translate(50,50);
    for (int i=0;i<10;i++) {
    fill(0,255,b);
    triangle(50, 0, 100, 25, 50, 50);
    translate(50,50);
    rotate(ang2);
    }
    popMatrix();
    
    pushMatrix();
    translate(50,50);
    for (int i=0;i<10;i++) {
    fill(0,255,b);
    triangle(50, 50, 25, 100, 0, 50);
    translate(50,50);
    rotate(ang2);
    }
    popMatrix();
    
     pushMatrix();
    translate(50,50);
    for (int i=0;i<10;i++) {
    fill(0,255,b);
    triangle(0, 0, -50, 25, 0, 50);
    translate(50,50);
    rotate(ang2);
    }
    popMatrix();
    
    //////////////////////////////////////////////////////////////
    //2ND OBJECT
    
     pushMatrix();
    translate(250,50);
    for (int i=0;i<10;i++) {
    fill(0,255,b);
    rect(i,i,50,50);
    translate(50, 50);
    rotate(ang2);
    }
    popMatrix();
    
    pushMatrix();
    translate(250,50);
    for (int i=0;i<10;i++) {
    fill(255,0,b);
    triangle(0, 0, 25, -50, 50, 0);
    translate(50, 50);
    rotate(ang2);
    }
    popMatrix();
    
    pushMatrix();
    translate(250,50);
    for (int i=0;i<10;i++) {
    fill(255,0,b);
    triangle(50, 0, 100, 25, 50, 50);
    translate(50, 50);
    rotate(ang2);
    }
    popMatrix();
    
    pushMatrix();
    translate(250,50);
    for (int i=0;i<10;i++) {
    fill(255,0,b);
    triangle(50, 50, 25, 100, 0, 50);
    translate(50, 50);
    rotate(ang2);
    }
    popMatrix();
    
     pushMatrix();
    translate(250,50);
    for (int i=0;i<10;i++) {
    fill(255,0,b);
    triangle(0, 0, -50, 25, 0, 50);
    translate(50, 50);
    rotate(ang2);
    }
    popMatrix();
    
     //////////////////////////////////////////////////////////////
     //3RD OBJECT
     
     pushMatrix();
    translate(450,50);
    for (int i=0;i<10;i++) {
    fill(255,0,b);
    rect(i,i,50,50);
    translate(50, 50);
    rotate(ang2);
    }
    popMatrix();
    
    pushMatrix();
    translate(450,50);
    for (int i=0;i<10;i++) {
    fill(0,255,b);
    triangle(0, 0, 25, -50, 50, 0);
    translate(50, 50);
    rotate(ang2);
    }
    popMatrix();
    
    pushMatrix();
    translate(450,50);
    for (int i=0;i<10;i++) {
    fill(0,255,b);
    triangle(50, 0, 100, 25, 50, 50);
    translate(50, 50);
    rotate(ang2);
    }
    popMatrix();
    
    pushMatrix();
    translate(450,50);
    for (int i=0;i<10;i++) {
    fill(0,255,b);
    triangle(50, 50, 25, 100, 0, 50);
    translate(50, 50);
    rotate(ang2);
    }
    popMatrix();
    
     pushMatrix();
    translate(450,50);
    for (int i=0;i<10;i++) {
    fill(0,255,b);
    triangle(0, 0, -50, 25, 0, 50);
    translate(50, 50);
    rotate(ang2);
    }
    popMatrix();
    
    ////////////////////////////////////////////////////////////////////// 
    //4TH OBJECT
    
    pushMatrix();
    translate(50,250);
    for (int i=0;i<10;i++) {
    fill(0,b,255);
    rect(i,i,50,50);
    translate(50, 50);
    rotate(ang2);
    }
    popMatrix();
    
    pushMatrix();
    translate(50,250);
    for (int i=0;i<10;i++) {
    fill(255,b,0);
    triangle(0, 0, 25, -50, 50, 0);
    translate(50, 50);
    rotate(ang2);
    }
    popMatrix();
    
    pushMatrix();
    translate(50,250);
    for (int i=0;i<10;i++) {
    fill(255,b,0);
    triangle(50, 0, 100, 25, 50, 50);
    translate(50, 50);
    rotate(ang2);
    }
    popMatrix();
    
    pushMatrix();
    translate(50,250);
    for (int i=0;i<10;i++) {
    fill(255,b,0);
    triangle(50, 50, 25, 100, 0, 50);
    translate(50, 50);
    rotate(ang2);
    }
    popMatrix();
    
     pushMatrix();
    translate(50,250);
    for (int i=0;i<10;i++) {
    fill(255,b,0);
    triangle(0, 0, -50, 25, 0, 50);
    translate(50, 50);
    rotate(ang2);
    }
    popMatrix();
    
    //////////////////////////////////////////////////////////////
    //5TH OBJECT 
    
     pushMatrix();
    translate(250,250);
    for (int i=0;i<10;i++) {
    fill(255,b,0);
    rect(i,i,50,50);
    translate(50, 50);
    rotate(ang2);
    }
    popMatrix();
    
    pushMatrix();
    translate(250,250);
    for (int i=0;i<10;i++) {
    fill(0,b,255);
    triangle(0, 0, 25, -50, 50, 0);
    translate(50, 50);
    rotate(ang2);
    }
    popMatrix();
    
    pushMatrix();
    translate(250,250);
    for (int i=0;i<10;i++) {
    fill(0,b,255);
    triangle(50, 0, 100, 25, 50, 50);
    translate(50, 50);
    rotate(ang2);
    }
    popMatrix();
    
    pushMatrix();
    translate(250,250);
    for (int i=0;i<10;i++) {
    fill(0,b,255);
    triangle(50, 50, 25, 100, 0, 50);
    translate(50, 50);
    rotate(ang2);
    }
    popMatrix();
    
     pushMatrix();
    translate(250,250);
    for (int i=0;i<10;i++) {
    fill(0,b,255);
    triangle(0, 0, -50, 25, 0, 50);
    translate(50, 50);
    rotate(ang2);
    }
    popMatrix();
    
     //////////////////////////////////////////////////////////////
     //6TH OBJECT 
     
     pushMatrix();
    translate(450,250);
    for (int i=0;i<10;i++) {
    fill(0,b,255);
    rect(i,i,50,50);
    translate(50, 50);
    rotate(ang2);
    }
    popMatrix();
    
    pushMatrix();
    translate(450,250);
    for (int i=0;i<10;i++) {
    fill(255,b,0);
    triangle(0, 0, 25, -50, 50, 0);
    translate(50, 50);
    rotate(ang2);
    }
    popMatrix();
    
    pushMatrix();
    translate(450,250);
    for (int i=0;i<10;i++) {
    fill(255,b,0);
    triangle(50, 0, 100, 25, 50, 50);
    translate(50, 50);
    rotate(ang2);
    }
    popMatrix();
    
    pushMatrix();
    translate(450,250);
    for (int i=0;i<10;i++) {
    fill(255,b,0);
    triangle(50, 50, 25, 100, 0, 50);
    translate(50, 50);
    rotate(ang2);
    }
    popMatrix();
    
     pushMatrix();
    translate(450,250);
    for (int i=0;i<10;i++) {
    fill(255,b,0);
    triangle(0, 0, -50, 25, 0, 50);
    translate(50, 50);
    rotate(ang2);
    }
    popMatrix();
    
     ////////////////////////////////////////////////////////////////////// 
 //7TH OBJECT
 
    pushMatrix();
    translate(50,450);
    for (int i=0;i<10;i++) {
    fill(255,0,b);
    rect(i,i,50,50);
    translate(50, 50);
    rotate(ang2);
    }
    popMatrix();
    
    pushMatrix();
    translate(50,450);
    for (int i=0;i<10;i++) {
    fill(0,255,b);
    triangle(0, 0, 25, -50, 50, 0);
    translate(50, 50);
    rotate(ang2);
    }
    popMatrix();
    
    pushMatrix();
    translate(50,450);
    for (int i=0;i<10;i++) {
    fill(0,255,b);
    triangle(50, 0, 100, 25, 50, 50);
    translate(50, 50);
    rotate(ang2);
    }
    popMatrix();
    
    pushMatrix();
    translate(50,450);
    for (int i=0;i<10;i++) {
    fill(0,255,b);
    triangle(50, 50, 25, 100, 0, 50);
    translate(50, 50);
    rotate(ang2);
    }
    popMatrix();
    
     pushMatrix();
    translate(50,450);
    for (int i=0;i<10;i++) {
    fill(0,255,b);
    triangle(0, 0, -50, 25, 0, 50);
    translate(50, 50);
    rotate(ang2);
    }
    popMatrix();
    
    //////////////////////////////////////////////////////////////
    //8TH OBJECT
    
     pushMatrix();
    translate(250,450);
    for (int i=0;i<10;i++) {
    fill(0,255,b);
    rect(i,i,50,50);
    translate(50, 50);
    rotate(ang2);
    }
    popMatrix();
    
    pushMatrix();
    translate(250,450);
    for (int i=0;i<10;i++) {
    fill(255,0,b);
    triangle(0, 0, 25, -50, 50, 0);
    translate(50, 50);
    rotate(ang2);
    }
    popMatrix();
    
    pushMatrix();
    translate(250,450);
    for (int i=0;i<10;i++) {
    fill(255,0,b);
    triangle(50, 0, 100, 25, 50, 50);
    translate(50, 50);
    rotate(ang2);
    }
    popMatrix();
    
    pushMatrix();
    translate(250,450);
    for (int i=0;i<10;i++) {
    fill(255,0,b);
    triangle(50, 50, 25, 100, 0, 50);
    translate(50, 50);
    rotate(ang2);
    }
    popMatrix();
    
     pushMatrix();
    translate(250,450);
    for (int i=0;i<10;i++) {
    fill(255,0,b);
    triangle(0, 0, -50, 25, 0, 50);
    translate(50, 50);
    rotate(ang2);
    }
    popMatrix();
    
     //////////////////////////////////////////////////////////////
     //9TH OBJECT
     
     pushMatrix();
    translate(450,450);
    for (int i=0;i<10;i++) {
    fill(255,0,b);
    rect(i,i,50,50);
    translate(50, 50);
    rotate(ang2);
    }
    popMatrix();
    
    pushMatrix();
    translate(450,450);
    for (int i=0;i<10;i++) {
    fill(0,255,b);
    triangle(0, 0, 25, -50, 50, 0);
    translate(50, 50);
    rotate(ang2);
    }
    popMatrix();
    
    pushMatrix();
    translate(450,450);
    for (int i=0;i<10;i++) {
    fill(0,255,b);
    triangle(50, 0, 100, 25, 50, 50);
    translate(50, 50);
    rotate(ang2);
    }
    popMatrix();
    
    pushMatrix();
    translate(450,450);
    for (int i=0;i<10;i++) {
    fill(0,255,b);
    triangle(50, 50, 25, 100, 0, 50);
    translate(50, 50);
    rotate(ang2);
    }
    popMatrix();
    
     pushMatrix();
    translate(450,450);
    for (int i=0;i<10;i++) {
    fill(0,255,b);
    triangle(0, 0, -50, 25, 0, 50);
    translate(50, 50);
    rotate(ang2);
    }
    popMatrix();

    ////////////////////////////////////////////////////////////////////// 
 //1st SMALL OBJECT
 
    pushMatrix();
    translate(162.5,162.5);
    for (int i=0;i<10;i++) {
    fill(255,255,b);
    rect(i,i,25,25);
    translate(25,25);
    rotate(ang2);
    }
    popMatrix();
    
    pushMatrix();
    translate(162.5,162.5);
    for (int i=0;i<10;i++) {
    fill(255,b,255);
    triangle(0, 0, 12.5, -25, 25, 0);
    translate(25,25);
    rotate(ang2);
    }
    popMatrix();
    
    pushMatrix();
    translate(162.5,162.5);
    for (int i=0;i<10;i++) {
    fill(255,b,255);
    triangle(25, 0, 50, 12.5, 25, 25);
    translate(25,25);
    rotate(ang2);
    }
    popMatrix();
    
    pushMatrix();
    translate(162.5,162.5);
    for (int i=0;i<10;i++) {
    fill(255,b,255);
    triangle(25, 25, 12.5, 50, 0, 25);
    translate(25,25);
    rotate(ang2);
    }
    popMatrix();
    
     pushMatrix();
    translate(162.5,162.5);
    for (int i=0;i<10;i++) {
    fill(255,b,255);
    triangle(0, 0, -25, 12.5, 0, 25);
    translate(25,25);
    rotate(ang2);
    }
    popMatrix();
    ////////////////////////////////////////////////////////////////////// 
 //2ND SMALL OBJECT
 
    pushMatrix();
    translate(362.5,162.5);
    for (int i=0;i<10;i++) {
    fill(255,255,b);
    rect(i,i,25,25);
    translate(25,25);
    rotate(ang2);
    }
    popMatrix();
    
    pushMatrix();
    translate(362.5,162.5);
    for (int i=0;i<10;i++) {
    fill(255,b,255);
    triangle(0, 0, 12.5, -25, 25, 0);
    translate(25,25);
    rotate(ang2);
    }
    popMatrix();
    
    pushMatrix();
    translate(362.5,162.5);
    for (int i=0;i<10;i++) {
    fill(255,b,255);
    triangle(25, 0, 50, 12.5, 25, 25);
    translate(25,25);
    rotate(ang2);
    }
    popMatrix();
    
    pushMatrix();
    translate(362.5,162.5);
    for (int i=0;i<10;i++) {
    fill(255,b,255);
    triangle(25, 25, 12.5, 50, 0, 25);
    translate(25,25);
    rotate(ang2);
    }
    popMatrix();
    
     pushMatrix();
    translate(362.5,162.5);
    for (int i=0;i<10;i++) {
    fill(255,b,255);
    triangle(0, 0, -25, 12.5, 0, 25);
    translate(25,25);
    rotate(ang2);
    }
    popMatrix();
 
   ////////////////////////////////////////////////////////////////////// 
 //3RD SMALL OBJECT
 
    pushMatrix();
    translate(162.5,362.5);
    for (int i=0;i<10;i++) {
    fill(255,255,b);
    rect(i,i,25,25);
    translate(25,25);
    rotate(ang2);
    }
    popMatrix();
    
    pushMatrix();
    translate(162.5,362.5);
    for (int i=0;i<10;i++) {
    fill(255,b,255);
    triangle(0, 0, 12.5, -25, 25, 0);
    translate(25,25);
    rotate(ang2);
    }
    popMatrix();
    
    pushMatrix();
    translate(162.5,362.5);
    for (int i=0;i<10;i++) {
    fill(255,b,255);
    triangle(25, 0, 50, 12.5, 25, 25);
    translate(25,25);
    rotate(ang2);
    }
    popMatrix();
    
    pushMatrix();
    translate(162.5,362.5);
    for (int i=0;i<10;i++) {
    fill(255,b,255);
    triangle(25, 25, 12.5, 50, 0, 25);
    translate(25,25);
    rotate(ang2);
    }
    popMatrix();
    
     pushMatrix();
    translate(162.5,362.5);
    for (int i=0;i<10;i++) {
    fill(255,b,255);
    triangle(0, 0, -25, 12.5, 0, 25);
    translate(25,25);
    rotate(ang2);
    }
    popMatrix();
    ////////////////////////////////////////////////////////////////////// 
 //4TH SMALL OBJECT
 
    pushMatrix();
    translate(362.5,362.5);
    for (int i=0;i<10;i++) {
    fill(255,255,b);
    rect(i,i,25,25);
    translate(25,25);
    rotate(ang2);
    }
    popMatrix();
    
    pushMatrix();
    translate(362.5,362.5);
    for (int i=0;i<10;i++) {
    fill(255,b,255);
    triangle(0, 0, 12.5, -25, 25, 0);
    translate(25,25);
    rotate(ang2);
    }
    popMatrix();
    
    pushMatrix();
    translate(362.5,362.5);
    for (int i=0;i<10;i++) {
    fill(255,b,255);
    triangle(25, 0, 50, 12.5, 25, 25);
    translate(25,25);
    rotate(ang2);
    }
    popMatrix();
    
    pushMatrix();
    translate(362.5,362.5);
    for (int i=0;i<10;i++) {
    fill(255,b,255);
    triangle(25, 25, 12.5, 50, 0, 25);
    translate(25,25);
    rotate(ang2);
    }
    popMatrix();
    
     pushMatrix();
    translate(362.5,362.5);
    for (int i=0;i<10;i++) {
    fill(255,b,255);
    triangle(0, 0, -25, 12.5, 0, 25);
    translate(25,25);
    rotate(ang2);
    }
    popMatrix();
 
  }
  
   
  



