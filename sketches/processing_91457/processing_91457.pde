
int rWid = 280;
int rHig = 180;
int rectX = 320;
int rectY = 220;
int maxC = 255;
int t=-50;
float r = random(255);
float b = random (255);
float g = random (255);
float y = 50;
float space = 50;

void setup() {
  size(600, 400);
}

void draw() {
  rectMode(CORNER);
  background(maxC);//white
  fill(0, 0, maxC);//blue
  rect(0, 0, rWid, rHig);//upperleft
  rect(rectX, rectY, rWid, rHig);//bottomright
  fill(maxC, 0, 0);//red
  rect(rectX, 0, rWid, rHig);//upperright
  rect(0, rectY, rWid, rHig);//bottomleft
  strokeWeight(4);//outline thickness
  stroke(maxC);//oultine color
  fill(230, 0, 0);//car color
  rectMode(CENTER);
  rect(mouseX, mouseY, 200, 50);//car body
  fill(0);//black
  rect(mouseX-85, mouseY+50, 20, 48);//left wheel
  rect(mouseX+85, mouseY+50, 20, 48);//right wheel
  fill(230, 0, 0);//red
  quad(mouseX-85, mouseY-25, mouseX-65, mouseY-75, mouseX+65, mouseY-75, mouseX+85, mouseY-25);//car top
  noStroke();//no outline
  fill(44, 255, 250);//blue
  quad(mouseX-70, mouseY-35, mouseX-60, mouseY-65, mouseX+60, mouseY-65, mouseX+70, mouseY-35);//car window
  fill(246, 255, 0);//light's color
  ellipse(mouseX-75, mouseY, 35, 35);//left light
  ellipse(mouseX+75, mouseY, 35, 35);//right light
  fill(255, 230, 0);//yellow
  triangle(mouseX-20, mouseY+15, mouseX-10, mouseY, mouseX, mouseY+15);//W
  triangle(mouseX, mouseY+15, mouseX+10, mouseY, mouseX+20, mouseY+15);//C
  triangle(mouseX-10, mouseY, mouseX, mouseY-15, mouseX+10, mouseY);//P
  fill(r, g, b);
 
  t=t+2;
  if (t>650) {
    r=random(255);
    g=random (255);
    b=random (255);
    fill(r, g, b);
    t=-50;
    
    t=t+2;
  }
  
  
   y=50;
   while (y<= 350) {
    fill(r, b, g);
    ellipse(t, y, 50, 50);
    y = y + space;
    
  
  
  
  
   }
}

void mouseDragged() {

  rectMode(CORNER);
  background(maxC);//white
  fill(maxC, 0, 0);//blue
  rect(0, 0, rWid, rHig);//upperleft
  rect(rectX, rectY, rWid, rHig);//bottomright
  fill(0, 0, maxC);//red
  rect(rectX, 0, rWid, rHig);//upperright
  rect(0, rectY, rWid, rHig);//bottomleft




  strokeWeight(4);//outline thickness
  stroke(maxC);//oultine color
  fill(230, 0, 0);//car color
  rectMode(CENTER);
  rect(mouseX, mouseY, 200, 50);//car body
  fill(0);//black
  rect(mouseX-85, mouseY+50, 20, 48);//left wheel
  rect(mouseX+85, mouseY+50, 20, 48);//right wheel
  fill(230, 0, 0);//red
  quad(mouseX-85, mouseY-25, mouseX-65, mouseY-75, mouseX+65, mouseY-75, mouseX+85, mouseY-25);//car top
  noStroke();//no outline
  fill(44, 255, 250);//blue
  quad(mouseX-70, mouseY-35, mouseX-60, mouseY-65, mouseX+60, mouseY-65, mouseX+70, mouseY-35);//car window
  fill(246, 255, 0);//light's color
  ellipse(mouseX-75, mouseY, 35, 35);//left light
  ellipse(mouseX+75, mouseY, 35, 35);//right light
  fill(255, 230, 0);//yellow
  triangle(mouseX-20, mouseY+15, mouseX-10, mouseY, mouseX, mouseY+15);//W
  triangle(mouseX, mouseY+15, mouseX+10, mouseY, mouseX+20, mouseY+15);//C
  triangle(mouseX-10, mouseY, mouseX, mouseY-15, mouseX+10, mouseY);//P
  fill(250, 255, 3);// yellow moon
  ellipse(t, 50, 75, 75); //move across x-axis
  t=t+2;//movement
  if (t>650) {//if statement
    t=-50;
    ellipse(t, 50, 50, 50);
    t=t+2;
  }//end of if
}



