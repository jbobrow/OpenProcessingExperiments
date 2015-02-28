
//I declare a variable type boolean, I call it mouseIsDown
//and I assign a value false. All in one instruction.
boolean mouseIsDown = false;
int A = 1;
int B = 0;
int C = 0;
int D = 0;
int E = 0;
int F = 0;
int eraserDiam = 20;
 
void setup() {
  size(500, 500);
  background(0);
}
 
void draw() {
 
//variable stroke according to speed
//float strokeW = abs(mouseX - pmouseX);
//strokeWeight(strokeW);
 
  //draw line only if mouse is down
  if (mouseIsDown == true) //same as if(mouseIsDown)
  {
    if((mouseX > 100) && (pmouseX > 100))
    {
      if ((pmouseX == mouseX) && (pmouseY == mouseY))
      {}
      else
      {
      if (A==1)
      {
        line(mouseX+random(-6,6), mouseY+random(-6,6), pmouseX, pmouseY);
      }
      if (B==1)
      {
        noStroke();
        fill(0);
        ellipse(mouseX, mouseY, eraserDiam, eraserDiam);
      }
      if (C==1)
      {
        rect(mouseX+random(-6,6), mouseY+random(-6,6), pmouseX/random(3,30), pmouseY/random(3,30));
      }
      if (D==1)
      {
        point(mouseX + 1, mouseY);
      }
      if (E==1)
      {
        stroke(200,200,200,180);
        fill(0,0,0,0);
        ellipse(mouseX,mouseY,20,20); ;
      }
      if (F==1)
      {
        noStroke();
        fill(0,0,0,6);
        rect(-5,-5,width+10,height+10);
      }
      }
    }
    else
    {
     if ((mouseX > 25) && (mouseX < 75))
     {
      if ((mouseY > 38) && (mouseY < 88))
      {
        A = 1;
        B = 0;
        C = 0;
        D = 0;
        E = 0;
        F = 0;
      }
      if ((mouseY > 38 +75) && (mouseY < 88 +75))
      {
        A = 0;
        B = 1;
        C = 0;
        D = 0;
        E = 0;
        F = 0;
      }if ((mouseY > 38 +150) && (mouseY < 88 +150))
      {
        A = 0;
        B = 0;
        C = 1;
        D = 0;
        E = 0;
        F = 0;
      }if ((mouseY > 38 + 225) && (mouseY < 75 +225))
      {
        A = 0;
        B = 0;
        C = 0;
        D = 1;
        E = 0;
        F = 0;
      }if ((mouseY > 338) && (mouseY < 388))
      {
        A = 0;
        B = 0;
        C = 0;
        D = 0;
        E = 1;
        F = 0;
      }if ((mouseY > 338 +75) && (mouseY < 388 +75))
      {
        A = 0;
        B = 0;
        C = 0;
        D = 0;
        E = 0;
        F = 1;
      }
     }
    }
    
    
    
  }
 stroke((mouseX/4)+random(120),(mouseY/4)+random(120),random(100,255));
 strokeWeight(random(3));
 
 //fill(0,0,0,10);
 //rect(-4,-4,width+8,height+8);


    fill(255);
  
  fill(50,50,50,180);
  rect(0,0,100,height);
  fill(255*A,255*A,255*A);
  rect(25, 50-12, 50, 50);
  fill(255*B,255*B,255*B);
  rect(25,125-12,50,50);
  fill(255*C,255*C,255*C);
  rect(25,200-12,50,50);
  fill(255*D,255*D,255*D);
  rect(25,275-12,50,50);
  fill(255*E,255*E,255*E);
  rect(25,350-12,50,50);
  fill(255*F,255*F,255*F);
  rect(25,425-12,50,50);
}
 
 
 
//this function is called every time you press a mouse button
void mousePressed() {
  mouseIsDown = true;
}
 
//this function is called every time you release a mouse button
void mouseReleased() {
  mouseIsDown = false;
}



