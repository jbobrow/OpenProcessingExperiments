
int rWid = 280;
int rHig = 180;
int rectX = 320;
int rectY = 220;
int maxC = 255;
int t=-50;
float r = random(255);
float b = random (255);
float g = random (255);
boolean click = true;
PImage Pic1;
PImage Pic2;
PImage Pic3;
PImage Pic4;



void setup() {
  size(600, 400);
  Pic1=loadImage("11.jpg");//grasshopper
  Pic2=loadImage("125.jpg");//monkey
  Pic3=loadImage("138.jpg");//penguin and whale
  Pic4=loadImage("29.jpg");//cat
}

void draw() {
 if (click){
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
  ellipse(t, 50, 75, 75);
  t=t+2;
  if (t>650) {
    r=random(255);
    g=random (255);
    b=random (255);
    fill(r, g, b);
    t=-50;
    ellipse(t, 50, 50, 50);
    t=t+2;
  }
 }
 else{
     rectMode(CORNER);
  background(maxC);//white
  
  image(Pic1,0,0,rWid,rHig);//upperleft
  image(Pic4,rectX, rectY,rWid,rHig);//bottomright
  
  image(Pic2,rectX, 0, rWid, rHig);//upperright
  image(Pic3,0, rectY, rWid, rHig);//bottomleft




  strokeWeight(4);//outline thickness
  stroke(maxC);//outline color
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
}

void mousePressed() {
if(mousePressed){
  click = !click;}
  
 
}



