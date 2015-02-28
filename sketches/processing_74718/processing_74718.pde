
Skull mySkull1;
Skull mySkull2;
Skull mySkull3;

void setup() {
  size(700,400);
  mySkull1 = new Skull(0, 40); // Parameters go inside the parentheses when the object is constructed.
  mySkull2 = new Skull(30, 180);
  mySkull3 = new Skull(600, 300);
  smooth();  
}
 
void draw() {
  background(0, 0, 0);
   if (mouseY<height/2) {
    background(255,55,255);
    //Boo
   noStroke ();
smooth();
fill(0);
ellipse(300,201,47,46);
ellipse(300,244,47,44);
ellipse(350,220,46,83);
ellipse(400,220,46,83);
fill(255,55,255);
ellipse(350,220,18,68);
ellipse(400,220,18,68);
ellipse(300,200,22,25);
ellipse(300,244,22,25);
fill(0);
rect(285,222,17,88);
rect(440,210,17,63);
rect(440,257,17,15);

  }
  mySkull1.move();
  mySkull1.display();
  mySkull2.move();
  mySkull2.display();
  mySkull3.move();
  mySkull3.display();
}
 
class Skull { // Even though there are multiple objects, we still only need one class. No matter how many cookies we make, only one cookie cutter is needed.Isn’t object-oriented programming swell?
  float xpos;
  float ypos;
  float xspeed;
  float yspeed;
  
 
  Skull(float tempXpos, float tempYpos) { // The Constructor is defined with arguments.
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = 0.5 + random(2.); 
    yspeed = 1.0 +random (0.5);
  }
 
  void display() {
    noStroke ();
    fill(255); // Kars get brighter as they get closer to finish
          //crossbones
  ellipse(xpos-64,ypos-16,15,15);
   ellipse(xpos+64,ypos-16,15,15); 
    ellipse(xpos-71,ypos-5,15,15);
     ellipse(xpos+71,ypos-5,15,15);
      ellipse(xpos+65,ypos+52,15,15);
       ellipse(xpos-65,ypos+52,15,15);
        ellipse(xpos+69,ypos+40,15,15);
         ellipse(xpos-69,ypos+40,15,15);
 beginShape(); 
  vertex(xpos-70,ypos+40);
  vertex(xpos-65,ypos+53);
  vertex(xpos+75,ypos-7);
  vertex(xpos+70,ypos-17);
  endShape(CLOSE); 
   beginShape(); 
  vertex(xpos-70,ypos-2);
  vertex(xpos-65,ypos-15);
  vertex(xpos+70,ypos+40);
  vertex(xpos+65,ypos+53);
  endShape(CLOSE); 
    //skull;
    rectMode(CENTER);
    rect (xpos,ypos+random (40,45),75,random(28,32)/yspeed); 
    ellipseMode(CENTER);
    ellipse(xpos,ypos,80,80);
    fill(0);
  stroke(0);
  ellipse(xpos+20,ypos,15,35);
  ellipse(xpos-20,ypos,15,35);
  ellipse(xpos,ypos+20,9,10);
  //teeth 
  rect(xpos,ypos+random (40,45),60,random(8,18)/yspeed);
  rect(xpos-23,ypos+random (40,42),-3,random(18,20));
  rect(xpos-10,ypos+random (40,42),3,random(18,20));
  rect(xpos+5,ypos+random (40,42),3,random(18,20));
  rect(xpos+20,ypos+random (40,42),3,random(18,20));
  }
 
  void move() {
    
    xpos = xpos + xspeed;
    if ((xpos > width) || (xpos < 0)) {
      xspeed=xspeed *-1;
    }
    ypos=ypos-random(ypos-2,ypos+5);
    if (ypos< 20) {
     ypos=ypos+random(190,110);
    }
    ypos+=(mouseY-width/2);
    if(mouseY> xpos) {
      ypos=ypos +1;
    }
  }
}



