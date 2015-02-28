
// Konkuk University
 // Department of Dynamic Media
 // SOS iDesign
// Name: WOO Eunhye
 // ID: 201420091


  int _num = 10;     
  Circle[] _circleArr = {
  }; 
  int x = 0;
  int y = 0;

  int xspeed = 2;
  int yspeed = 2;
  
  void setup() {
  size(600,600);
  background(255);
 
  drawCircles();
  }
 
  void draw() {   
  background(255);
  
   fill(#FFAFAF); 
  noStroke(); 
  ellipseMode(CENTER); 
  ellipse(x, y, 50, 50); 

  fill(#6C8DFF); 
  noStroke(); 
  ellipseMode(LEFT); 
  ellipse(x, y, 50, 50);
  
  fill(#6C8DFF); 
  noStroke(); 
  ellipseMode(LEFT); 
  ellipse(y, x, 50, 50);
  // Add the current speed to the x location.
  x = x + xspeed;
  y = y + yspeed;




  if ((x > width) || (x < 0)) {
    // If the object reaches either edge, multiply speed by -1 to turn it around.
    xspeed = xspeed * -1;    
  }


  if ((y > width) || (y < 0)) {
    // If the object reaches either edge, multiply speed by -1 to turn it around.
    yspeed = yspeed * -1;     
  }

  x = y + yspeed;




  // Display circle at x location
  noStroke();
  fill(x,y,0,100);
  quad(x,y,width-x,0,0, height-y,width-x,height-y);
  fill (y,0,x,100);
  quad(x,0,0, height-y,x,height-y,x,y);
  fill (x,y,0,100);
  quad(x,0,0, height-x,0,height-x,x,y);
  fill (y,0,x,100);
  quad(y,x,0, width-y,x,width-y,width-x,y);
   fill (x,y,0,100);
  quad(x,0,y, width-y,x,height-y,width-x,y);
  fill (x,y,0,100);
  quad(x,0,y,height-x,0, width-y,height-x,width-y);
  fill (x,y,0,100);
  quad(x,0,y,0,0, width-y,0,width-y);



  fill(#6C8DFF); 
  noStroke(); 
  ellipseMode(LEFT); 
  ellipse(y, x, 50, 50);
  
  for (int i=0; i<_circleArr.length; i++) {
    Circle thisCirc = _circleArr[i];
    thisCirc.updateMe();
  }
}
 
   void mouseReleased() {
  drawCircles();
 }
 
  void drawCircles() {
  for (int i=0; i<_num; i++) {
    Circle thisCirc = new Circle();
    thisCirc.drawMe();
    _circleArr = (Circle[])append(_circleArr, thisCirc);
  }
  
  
  }
 
 
  class Circle {
  float x, y, x1, y1, x2, y2;
  float radius;
  color linecol, fillcol;
  float alph;
  float xmove, ymove;
  float rot;
 
  Circle() {
  
    y = random(height);


    radius = random(5, 50);
    linecol = color(random(255), random(255), random(255));
    fillcol = color(random(255), random(255), random(255));
    alph = random(30, 150);
 
    xmove = random(-2, 2);// - 5;
    ymove = random(-2, 5); //- 5;
    rot=radians(x*6);
  }
 
  void drawMe() {
    noStroke();
    fill(fillcol, alph);
    //  pushMatrix();
    //  translate(-x,-y);
    //  rotate(rot);
    triangle(x, y, x1, y1, x2, y2);
 
  }
 
  void updateMe() {
    x += xmove;
    y += ymove;
    x1 += xmove*0.1;
    y1 += ymove*0.2;
    x2 += xmove*0.3;
    y2 += ymove*0.4;
    
    if (x > (width+radius)) {
    pushMatrix(); 
    radius-=1020;//short  
    x=3.2; 
    popMatrix(); 
    }
    if (x < (0-radius)) {
      x=0-radius;
      xmove= -xmove;
    }
    if (y > (height+radius)) {
      y=height+radius;
      ymove= -ymove;
    }
    if (y < (0-radius)) {
   pushMatrix(); 
    radius=1020;//short  
    x=-xmove; 
    popMatrix(); 
    }
  
     if (x2 > (width+radius)) {
      x2=width+radius;
      xmove= -xmove;
    }
    if (x2 < (0-radius)) {
      x2=0-radius;
      xmove= -xmove;
    }
    if (y2 > (height+radius)) {
      y2=height+radius;
      ymove= -ymove;
    }
    if (y2 < (0-radius)) {
      y2=0-radius;
      ymove= -ymove;
    }
    drawMe();
  }
}
