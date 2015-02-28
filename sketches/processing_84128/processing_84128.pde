
PFont myFont; //Font Variable
float count = 0; //Number of Mouse Clicks
Snow[] snow = new Snow[500]; //Snow Array

void setup(){
  size(500,400);
  smooth();
  
  //Initialize Snow Array
  
  for (int i = 0; i<snow.length;i++){
    snow[i] = new Snow();
  }
}

void draw(){
  
  background(160,191,188);
  noStroke();
  
  //Draw the Ground
  fill(255,248,232);
  rectMode(CENTER);
  rect(0,height,width*2,200);
  
  //Draw the Pavement
  fill(121,120,120);
  triangle(width*2/3-20,height,width*2/3+20,height-150,width*2/3+60,height);
  
  //Draw the House
  fill(252,224,145);
  rect(width*2/3+20,height-145,100,90);
  
  //Draw the Door of the House
  fill(106,55,0);
  rect(width*2/3+20,height-120,25,40);
  
  //Draw the Top of the House
  fill(106,82,58);
  triangle(width*2/3-50,height-190,width*2/3+20,height-215,width*2/3+90,height-190);
  
  //Draw a Tree
  fill(118,90,12);
  rect(220,290,20,20);
  fill(68,137,78);
  triangle(180,280,220,240,260,280);
  triangle(190,260,220,220,250,260);
  triangle(200,240,220,210,240,240);
  
  //Move and Display Snow Array
  for(int i=0;i<snow.length;i++){
    snow[i].move();
    snow[i].display();
  }
  
  //Title Screen
  if (count==0){
  //  myFont = createFont("Helvetica", 50, true);
  //  textFont(myFont);
  //  fill(191,77,77);
  //  textSize(5);
  //  text("Let's Make a Snowman! (click to begin)", 10, 20);
  }
  
  //Set the Base
  if (count==1){
  //  myFont = createFont("Helvetica", 50, true);
  //  textFont(myFont);
  //  fill(191,77,77);
  //  textSize(5);
  //  text("First, We'll Create a Base.", 10, 20);
    
    fill(0,0,0,100);
    ellipse(100,350,120,30);
    fill(250,246,237);
    ellipse(100,300,120,120);
  }
  
  //Create the Head
  else if (count==2){
  //  myFont = createFont("Helvetica", 50, true);
  //  textFont(myFont);
  //  fill(191,77,77);
  //  textSize(5);
  //  text("Then, We'll Add a Head!", 10, 20);
    
    fill(0,0,0,100);
    ellipse(100,350,120,30);
    fill(250,246,237);
    ellipse(100,300,120,120);
    ellipse(100,220,90,90);
  }
  
  //Add Some Eyes...
  else if (count==3){
  //  myFont = createFont("Helvetica", 50, true);
  //  textFont(myFont);
  //  fill(191,77,77);
  //  textSize(5);
  //  text("For the Face, Let's Include Some Eyes...", 10, 20);
    
    fill(0,0,0,100);
    ellipse(100,350,120,30);
    fill(250,246,237);
    ellipse(100,300,120,120);
    ellipse(100,220,90,90);
    fill(0);
    ellipse(85,210,10,10);
    ellipse(115,210,10,10);
  }
  
  //And a Nose...
  else if (count==4){
  //  myFont = createFont("Helvetica", 50, true);
  //  textFont(myFont);
  //  fill(191,77,77);
  //  textSize(5);
  //  text("A Nose...", 10, 20);
    
    fill(0,0,0,100);
    ellipse(100,350,120,30);
    fill(250,246,237);
    ellipse(100,300,120,120);
    ellipse(100,220,90,90);
    fill(0);
    ellipse(85,210,10,10);
    ellipse(115,210,10,10);
    fill(255,173,64);
    triangle(98,220,108,225,98,230);
  }
  
  //And a Pipe.
  else if (count==5){
  //  myFont = createFont("Helvetica", 50, true);
  //  textFont(myFont);
  //  fill(191,77,77);
  //  textSize(5);
  //  text("And a Pipe! Last but not least...", 10, 20);
    
    fill(0,0,0,100);
    ellipse(100,350,120,30);
    fill(250,246,237);
    ellipse(100,300,120,120);
    ellipse(100,220,90,90);
    fill(0);
    ellipse(85,210,10,10);
    ellipse(115,210,10,10);
    fill(255,173,64);
    triangle(98,220,108,225,98,230);
    fill(203,184,107);
    rect(110,240,15,3);
    rect(115,238,5,5);
  }
  
  //Place the Ol' Silk Hat
  else if (count==6){
  //  myFont = createFont("Helvetica", 50, true);
  //  textFont(myFont);
  //  fill(191,77,77);
  //  textSize(5);
  //  text("Let's Give Our Friend an Ol' Silk Hat!", 10, 20);
    
    fill(0,0,0,100);
    ellipse(100,350,120,30);
    fill(250,246,237);
    ellipse(100,300,120,120);
    ellipse(100,220,90,90);
    fill(0);
    ellipse(85,210,10,10);
    ellipse(115,210,10,10);
    fill(255,173,64);
    triangle(98,220,108,225,98,230);
    fill(203,184,107);
    rect(110,240,15,3);
    rect(115,238,5,5);
    rectMode(CENTER);
    fill(0);
    rect(100,180,60,10);
    rect(100,160,40,30);
    fill(252,248,117);
    rect(100,170,40,10);
  }
  
  //Final Message Pt. 1
  else if (count==7){
  //  myFont = createFont("Helvetica", 50, true);
  //  textFont(myFont);
  //  fill(191,77,77);
  //  textSize(5);
  //  text("Congrats! May This Snowman Bring You Joy...", 10, 20);
    
    fill(0,0,0,100);
    ellipse(100,350,120,30);
    fill(250,246,237);
    ellipse(100,300,120,120);
    ellipse(100,220,90,90);
    fill(0);
    ellipse(85,210,10,10);
    ellipse(115,210,10,10);
    fill(255,173,64);
    triangle(98,220,108,225,98,230);
    fill(203,184,107);
    rect(110,240,15,3);
    rect(115,238,5,5);
    rectMode(CENTER);
    fill(0);
    rect(100,180,60,10);
    rect(100,160,40,30);
    fill(252,248,117);
    rect(100,170,40,10);
  }
  
  //Final Message Pt. 2
  else if (count>=8){
  //  myFont = createFont("Helvetica", 50, true);
  //  textFont(myFont);
  //  fill(191,77,77);
  //  textSize(5);
  //  text("And May You Have a Wonderful Holiday Season!", 10, 20);
    
    fill(0,0,0,100);
    ellipse(100,350,120,30);
    fill(250,246,237);
    ellipse(100,300,120,120);
    ellipse(100,220,90,90);
    fill(0);
    ellipse(85,210,10,10);
    ellipse(115,210,10,10);
    fill(255,173,64);
    triangle(98,220,108,225,98,230);
    fill(203,184,107);
    rect(110,240,15,3);
    rect(115,238,5,5);
    rectMode(CENTER);
    fill(0);
    rect(100,180,60,10);
    rect(100,160,40,30);
    fill(252,248,117);
    rect(100,170,40,10);
  }
}

void mousePressed(){ //Mouse Click Increases the Count
  count+=1;
}

void keyPressed(){ //Key Press Will Revert Count to Zero
  count=0;
}
class Snow{
  float xpos;
  float ypos;
  float xspeed;
  float yspeed;
  float ballsize;
  
  Snow(){
    xpos = random(500);
    ypos = random(400);
    xspeed = random(1,2);
    yspeed = random(1,2);
    ballsize = random(1,5);
  }
  
  void move(){
    if (xpos+(ballsize/2) > 500 || xpos-(ballsize/2) < 0) {
      xspeed = xspeed * (-1);
    }
    
    if (ypos+(ballsize/2) > 400 || ypos-(ballsize/2) < 0) {
      yspeed = yspeed * (-1);
    }
    xpos += xspeed;
    ypos += yspeed;
  }
  
  void display(){
    fill(255);
    ellipse(xpos,ypos,ballsize,ballsize);
  }
}


