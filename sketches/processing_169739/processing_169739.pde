
float speedX = 2;
float speedY = 3.5;

float Xpo;
float Ypo;

void setup() {
   size(800, 300);
   frameRate(15);
   background(0);
}

void draw() {
  //background(255);
  smooth();  
  

    fill(254, 255, 10, 10);
  ellipse(Xpo, Ypo+25, 100, 100);


  Xpo = Xpo + speedX;
  
  if (Xpo < width) {
    speedX = -speedX;
  }
 if (Xpo > 0) {
  speedX = -speedX;

 }
 
 
 
     fill(247,206,40, 10);
   ellipse(Xpo, Ypo+50, 100, 100);

  noStroke();
  Xpo = Xpo + speedX;
  
  if (Xpo < width) {
    speedX = -speedX;
  }
 if (Xpo > 0) {
  speedX = -speedX;

 }


     fill(250, 150, 0, 10);
   ellipse(Xpo, Ypo+75, 100, 100);

  noStroke();
  Xpo = Xpo + speedX;
  
  if (Xpo < width) {
    speedX = -speedX;
  }
 if (Xpo > 0) {
  speedX = -speedX;





    }

 
     fill(250, 71, 0, 10);
   ellipse(Xpo, Ypo+100, 100, 100);

  noStroke();
  Xpo = Xpo + speedX;
  
  if (Xpo < width) {
    speedX = -speedX;
  }
 if (Xpo > 0) {
  speedX = -speedX;

 }
 
 
  
     fill(252, 0, 0, 10);
   ellipse(Xpo, Ypo+125, 100, 100);

  noStroke();
  Xpo = Xpo + speedX;
  
  if (Xpo < width) {
    speedX = -speedX;
  }
 if (Xpo > 0) {
  speedX = -speedX;

 }
 
 
  
     fill(250, 0, 79, 10);
   ellipse(Xpo, Ypo+150, 100, 100);

  noStroke();
  Xpo = Xpo + speedX;
  
  if (Xpo < width) {
    speedX = -speedX;
  }
 if (Xpo > 0) {
  speedX = -speedX;

 }
 
 
   
     fill(250, 0, 117, 10);
   ellipse(Xpo, Ypo+175, 100, 100);

  noStroke();
  Xpo = Xpo + speedX;
  
  if (Xpo < width) {
    speedX = -speedX;
  }
 if (Xpo > 0) {
  speedX = -speedX;

 }
 
    
     fill(250, 0, 180, 10);
   ellipse(Xpo, Ypo+200, 100, 100);

  noStroke();
  Xpo = Xpo + speedX;
  
  if (Xpo < width) {
    speedX = -speedX;
  }
 if (Xpo > 0) {
  speedX = -speedX;

 }


    
     fill(224, 93, 224, 10);
   ellipse(Xpo, Ypo+225, 100, 100);

  noStroke();
  Xpo = Xpo + speedX;
  
  if (Xpo < width) {
    speedX = -speedX;
  }
 if (Xpo > 0) {
  speedX = -speedX;

 }
 
      fill(137, 21, 255, 10);
   ellipse(Xpo, Ypo+250, 100, 100);

  noStroke();
  Xpo = Xpo + speedX;
  
  if (Xpo < width) {
    speedX = -speedX;
  }
 if (Xpo > 0) {
  speedX = -speedX;

 }
 
       fill(76, 95, 252, 10);
   ellipse(Xpo, Ypo+275, 100, 100);

  noStroke();
  Xpo = Xpo + speedX;
  
  if (Xpo < width) {
    speedX = -speedX;
  }
 if (Xpo > 0) {
  speedX = -speedX;

 }
 
        fill(76, 107, 252, 10);
   ellipse(Xpo, Ypo+300, 100, 100);

  noStroke();
  Xpo = Xpo + speedX;
  
  if (Xpo < width) {
    speedX = -speedX;
  }
 if (Xpo > 0) {
  speedX = -speedX;

 }
 
}

