
PFont font;

void setup(){
  size(600,800);
  smooth();
  background(185, 10, 10);
  
  font = loadFont("PoplarStd-48.vlw");
  textFont(font);
}
void draw(){
   //Background
  
  noStroke();
  fill(0);
  ellipse(100, 100, 150, 150);  //background moon grey
  strokeWeight(2);
  stroke(0);
  fill(245);
  ellipse(103, 100, 150, 150);  //background moon white
  strokeWeight(2);
  stroke(0);
  fill(0, 250, 0);
  triangle(150, 700, 450, 400, 800, 700);  //moutain orange
  fill(200, 255, 0);  
  triangle(50, 700, 200, 500, 350, 700);  //moutain yellow
  noStroke();
  fill(255,0 ,0);
  rect(0, 699, 800, 200);  //ground
  
  robot(mouseX - 300, mouseY - 400);
  
  if (mousePressed ==true){
    textSize(50);
    stroke(10);
    fill(0, 255, 0);
      text("DIE HUMANS", mouseX, mouseY -200);
  
}
}
void robot(int x, int y){
  pushMatrix();
  translate(x, y);
  smooth();
  
 
  
  //Robot 
  translate(300, 250);
  fill(0);
  ellipse(0, 165, 200, 160);
  strokeWeight(2);
  stroke(1);
  fill(80);
  quad(-120, 180, 120, 180, 150, 110, -150, 110); //body
  fill(0);
  ellipse(0, 126, 300, 50);  //shadow under top disc torso
  
  //Gun
  
  fill(100);
  rect(112, 82, 28, 10);  //gun mount
  rect(120, 76, 15,5);  //gun neck
  quad(120, 76, 120, 63, 145, 63, 145, 76);  //gun chamber
  quad(145, 72, 145, 65, 165, 66, 165, 68);  //gun barrel
  
  //Robot Right leg 1
  
  fill(0);
  rect(65, 190, 30, 15);  //leg from body part 1
  fill(90);
  rect(67.5, 200, 25, 3);  //leg part 2
  fill(0);
  fill(90);
  quad(105, 225, 110, 230, 140, 250, 145, 255);  //leg part 4 triangle
  quad(80, 215, 90, 225, 150, 240, 160, 235);  //leg part 3 
  fill(90);
  quad(160, 235, 155, 230, 125, 280, 130, 285);  //leg part 5
  ellipse(80, 215, 25, 25);  //leg joint black
  ellipse(80, 215, 10, 10);  //leg joint grey
  quad(85, 290, 105, 276, 115, 275, 130, 285); //upper claw
  triangle(92, 305, 132, 285, 120, 305); //lower claw
  fill(90);
  ellipse(155, 235, 18, 18);  //leg joint 2 black
  ellipse(155, 235, 8, 8);  //leg joint 2 grey
  ellipse(125, 285, 15, 15);  //leg joint 3 black
  ellipse(125, 285, 5, 5);  //leg joint 3 grey
  
  //Robot left arm
  quad(-118, 180, -98, 180, -110, 270, -123, 270);
  quad(-123, 270, -110, 270, -92, 350, -95, 350);
  triangle(-92, 350, -80, 345, -65, 360);
  triangle(-95, 350, -85, 370, -65, 370); 
  
 //Robot Left leg 3
  
  fill(0);
  rect(-95, 190, 30, 15);  //leg from body part 1
  fill(90);
  rect(-95, 200, 25, 3);  //leg part 2
  fill(0);
  fill(90);
  quad(-105, 225, -110, 230, -140, 250, -145, 255);  //leg part 4 triangle
  quad(-80, 215, -90, 225, -150, 240, -160, 235);  //leg part 3 
  fill(90);
  quad(-160, 235, -155, 230, -125, 280, -130, 285);  //leg part 5
  ellipse(-80, 215, 25, 25);  //leg joint black
  ellipse(-80, 215, 10, 10);  //leg joint grey
  quad(-85, 290, -105, 276, -115, 275, -130, 285); //upper claw
  triangle(-92, 305, -132, 285, -120, 305); //lower claw
  fill(90);
  ellipse(-155, 235, 18, 18);  //leg joint 2 black
  ellipse(-155, 235, 8, 8);  //leg joint 2 grey
  ellipse(-125, 285, 15, 15);  //leg joint 3 black
  ellipse(-125, 285, 5, 5);  //leg joint 3 grey  
  
  
  //Robot middle large leg
  
  quad(-5, 250, 20, 250, 35, 325, 20, 325); //Upper Leg
  quad(-45, 370, -40, 375, 35, 325, 20, 325); //Lower Leg
  quad(-45, 370, -40, 378, 35, 410, 20, 400); //Lower Leg 2
  ellipse(5, 240, 50, 50); //Upper leg joint
  ellipse(5, 240, 25, 25);  //Upper leg joint
  fill(0);
  ellipse(5, 240, 15, 15); //Upper leg joint
  fill(90);
  quad(28, 407, 45, 380, 55,400,  55, 380);    //heel
  quad(28, 407, 18, 420, 15,455,  35, 440);    //heel
  ellipse(28, 325, 20, 20); //knee joint
  ellipse(28, 325, 10, 10);  //knee joint
  ellipse(-40, 370, 15, 15); //2nd knee joint
  ellipse(-40, 370, 5, 5);  // 2nd knee joint
  ellipse(28, 407, 15, 15); //ankle
  ellipse(28, 407, 5, 5);  // ankle
  

  //Robot Body
  
  ellipse(0,110, 320, 70);  //Body torso lighter bottom
  fill(100);
  ellipse(0,103, 300, 55);  //Body toros  darker top
  //noStroke();
  fill(80);
  ellipse(0, 178, 240, 42);  //bottom round of torso
  noStroke();
  ellipse(0, 175, 240, 42);  //bottom round of torso
  strokeWeight(3);
  stroke(0);
  quad(-25, 155, 40, 155, 40, 215, -25, 215);  //controll panel
  rect(-18, 180, 20, 6);  //button 1 on panel
  rect(-18, 190, 20, 6);  //button 1 on panel
  rect(-18, 200, 20, 6);  //button 1 on panel
  rect(-25, 156, 65, 10);  //top grey rect on panel
  rect(10, 185, 20, 20); //right bottom of shape on panel
  quad(11, 185, 18, 175, 25, 175, 25, 185);  //right bottom shape on panel
  quad(50, 194, 50, 158, 75, 156, 75, 192);  //right square on skirt
  quad(-50, 194, -50, 158, -75, 156, -75, 192);  //left square on skirt
  quad(-90, 190, -90, 154, -115, 149, -115, 182);  //left 2nd square on skirt
  rotate(PI/15);
  rect(155, 116, 10, 30);  //tank on skirt1
  rect(148, 121, 10, 30); //tank on skirt2
  rotate(PI/-15);
  strokeWeight(2);
  fill(155);
  rect(-25, 153, 65, 4); //white shadow on control panel
  
  //Robot Neck
  
  fill(80);
  rect(-40, 40, 80, 40);  //neck
  ellipse(0, 75, 80, 40);  //neckcircle
  noStroke();
  ellipse(0, 70, 78, 30);  //neckcircle
  stroke(2);
  ellipse(0, 68, 78, 32);  //neckcircle
  
  //Robot Head
     
  fill(100);
  strokeWeight(2);
  stroke(0);
  ellipse(15, -36, 60, 15);  //sat dish on head
  line(-48,-50, -35, -30); //antenna base left angle
  strokeWeight(4);
  line(-48, -50, -56, -60);  //antenna top left angle
  strokeWeight(2);
  ellipse(-58, -30, 10, 5);
  line(-58,-40, -58, -35); //antenna base vert
  strokeWeight(4);
  line(-58, -43, -58, -50);  //antenna top vert
  strokeWeight(2);
  ellipse(-38, -32, 15, 15);
  ellipse(0, -20, 150, 30); //anlge on top head
  ellipse(0, 25, 250, 100);  //Head
  ellipse(40, 30, 50, 65);  //eyesocket 3
   
  // Robot Head Details
  
  fill(100);
  rect(-5, 18, 10, 6);  // rectangle nose
  ellipse(-12, 50, 5, 5);  // small mouth cir grey
  ellipse(8, 50, 5, 5);  // small mouth cir grey
  line(-29, 40, 15, 40);  //line between eye 2 and eye 3
  
  //Eyeball 1
   
  ellipse(-115, 35, 50, 53);//eyeball 1 grey
  ellipse(-120, 35, 45, 45);//eyeball 1 black
  fill(100, 0, 0);
  ellipse(-120, 35, 45, 45);//eyeball 1 red
  
  //Eyeball 2
   
  fill(100);
  ellipse(-50, 40, 43, 43);//eyeball 2 grey
  fill(0);
  ellipse(-55, 40, 35, 35);//eyeball 2 black
  fill(100, 0, 0);
  ellipse(-53, 40, 30, 30);//eyeball 2 red
  fill(255);
  noStroke();
  ellipse(-51, 39, 4, 4);//eyeball 2 white circle
  ellipse(-49, 31, 8, 3);//eyeball 2 white circle
   
  //Eyeball 3
   
  strokeWeight(2);
  stroke(0);
  fill(100);
  ellipse(45, 30, 45, 45);//eyeball 3 grey
  fill(0);
  ellipse(45, 30, 35, 35);//eyeball 3 black
  fill(100, 0, 0);
  ellipse(45, 30, 30, 30);//eyeball 3 red
  fill(255);
  ellipse(40, 30, 5, 5);  //eyeball 3 white cir
  ellipse(45, 20, 10, 6);  //eyeball 3 white oval
            
  //Eyeball 4
   
  fill(100);
  ellipse(123, 32, 33, 45);//eyeball 4 grey
  fill(0);
  ellipse(130, 32, 20, 33);//eyeball 4 black
  fill(100, 0, 0);
  ellipse(133, 32, 20, 26);//eyeball 4 red
  
  //Circle detail sensor Right
  
  fill(100);
  ellipse(82, 16, 30, 38);//grey big
  ellipse(91, 15, 15, 15);//grey med
  ellipse(92, 15, 10, 10);//grey small
  fill(0);
  ellipse(94, 16, 5, 5);//black small
  
  //Circle detail sensor Left
  
  fill(100);
  ellipse(-82, 16, 30, 38);//grey big
  ellipse(-91, 15, 15, 15);//grey med
  ellipse(-92, 15, 10, 10);//grey small
  fill(0);
  ellipse(-94, 16, 5, 5);//black small
  fill(255);
  noStroke();
  ellipse(-94, 16, 2, 2);//white accent
    
  //Lower Circle detail sensor
  
  stroke(2);
  fill(100);
  ellipse(85, 48, 25, 20);//grey small
  fill(0);
  ellipse(90, 48, 18, 18);//black small
  fill(255);
  noStroke();
  ellipse(90, 48, 13, 13);  //white trim
  fill(100, 0, 0);
  ellipse(91, 48, 12, 14);
  strokeWeight(2);
  stroke(0);
  popMatrix();
}  
     
    




