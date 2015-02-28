
/*Title     : Macau Landmarks under the Night Sky
 Author     : Inah Quejano
 Artwork    : Inah Quejano
 Lecturer   : Luis Gustavo Martins
 Course     : Comms Studio - Media Programming and Scripting
 Course Code: LCM203_A
 Credits to : FunProgramming.Org Tutorials, OpenProcessing SketchPad
 References : Stars Blinking Tutorial and Processing Library
 Fireworks Code by Anders Fisher */
  
/* @pjs preload="trial.png"; */
Firework[] fs = new Firework[20];
boolean once;
float angle = 0.0;
PImage img = loadImage("trial.png");
void setup(){
  size(800,800);
  smooth();
  background(0);
    textFont( createFont("Helvetica", 80) );
    //AF
  for (int i = 0; i < fs.length; i++){
    fs[i] = new Firework();
  }
}
void draw(){
  noStroke();
  fill(50,0,40,20);
  rect(0,0,width,height);
  //IMAQ-Code for Blinking Stars
  fill(0, 50);
  fill(255);
  //background(0); //IMAQ-remove for flashy effect
  ellipse(random(width), random(height), 5, 5);
  //IMAQ- Code for Laser lights.
   pushMatrix();
   /*Remove translate() to make laser lights stay in top-left corner. Still can           hover over to change colors.*/
    //translate(mouseX, mouseY); 
    rotate(angle);
    fill(mouseX-100, mouseY-200, random(150, 200) );
    textSize(16); //edit size
    text("Welcome to MACAU 澳門", width/50, height/50);
    stroke(mouseX-100, mouseY-70, random(150, 200) );
    line(0, 0, width, height);
    noStroke();
    ellipse(100, 100, 10,10);
    angle += 0.5;
    popMatrix();
   image(img, 0, 300); //edit x,y coordinates if needed. 
  //AF
  for (int i = 0; i < fs.length; i++){
    fs[i].draw();
  }
}
  
//when translate() is removed, change from keyPressed to mousePressed()
void mousePressed(){ 
background(0);
  once = false;
  for (int i = 0; i < fs.length; i++){
    if((fs[i].hidden)&&(!once)){
      fs[i].launch();
      once = true;
    }
  }
}
 
 
class Firework{
  float x, y, oldX,oldY, ySpeed, targetX, targetY, explodeTimer, flareWeight, flareAngle;
  int flareAmount, duration;
  boolean launched,exploded,hidden;
  color flare;
  Firework(){
              
    exploded = false;
    hidden = true;
  }
  void draw(){
    if((launched)&&(!exploded)&&(!hidden)){
      launchMaths();
      strokeWeight(1);
      stroke(255);
      line(x,y,oldX,oldY);
    }
    if((!launched)&&(exploded)&&(!hidden)){
      explodeMaths();
      noStroke();
      strokeWeight(flareWeight);
      stroke(flare);
      for(int i = 0; i < flareAmount + 1; i++){
          pushMatrix();
          translate(x,y);
          point(sin(radians(i*flareAngle))*explodeTimer,cos(radians(i*flareAngle))*explodeTimer);
          popMatrix();
       }
    }
    if((!launched)&&(!exploded)&&(hidden)){
      //do nothing
    } 
  }
  void launch(){
    x = oldX = mouseX + ((random(5)*10) - 25);
    y = oldY = height;
    targetX = mouseX;
    targetY = mouseY;
    ySpeed = random(3) + 2;
    flare = color(random(3)*50 + 105,random(3)*50 + 105,random(3)*50 + 105);
    flareAmount = ceil(random(30)) + 20;
    flareWeight = ceil(random(3));
    duration = ceil(random(4))*20 + 30;
    flareAngle = 360/flareAmount;
    launched = true;
    exploded = false;
    hidden = false;
  }
  void launchMaths(){
    oldX = x;
    oldY = y;
    if(dist(x,y,targetX,targetY) > 6){
      x += (targetX - x)/2;
      y += -ySpeed;
    }else{
      explode();
    }
  }
  void explode(){
    explodeTimer = 0;
    launched = false;
    exploded = true;
    hidden = false;
  }
  void explodeMaths(){
    if(explodeTimer < duration){
      explodeTimer+= 0.4;
    }else{
      hide();
    }
  }
  void hide(){
    launched = false;
    exploded = false;
    hidden = true;
  }
}


