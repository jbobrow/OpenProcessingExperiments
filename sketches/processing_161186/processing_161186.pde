
float flyX;
float flyY;
float flyF1;
float flyF2;
float flyF3;


void setup(){
 size(800,600);

flyX = 1;
flyY = 1;
flyF1 = 1;
flyF2 = 1;
flyF3 = 1;
}

void draw(){
  background(flyF3+mouseX/4,flyF1+mouseY/4,flyF2);
  
  //Moving flyswatter
  strokeWeight(4);
  line(mouseX,mouseY,mouseX,mouseY-200);
  noFill();
  rect(mouseX-50,mouseY-300,100,100,7);  
  
  //Verticle lines
  strokeWeight(1);
  line(mouseX-45,mouseY-300,mouseX-45,mouseY-200);
  line(mouseX-40,mouseY-300,mouseX-40,mouseY-200);
  line(mouseX-35,mouseY-300,mouseX-35,mouseY-200);
  line(mouseX-30,mouseY-300,mouseX-30,mouseY-200);
  line(mouseX-25,mouseY-300,mouseX-25,mouseY-200);
  line(mouseX-20,mouseY-300,mouseX-20,mouseY-200);
  line(mouseX-15,mouseY-300,mouseX-15,mouseY-200);
  line(mouseX-10,mouseY-300,mouseX-10,mouseY-200);
  line(mouseX-5,mouseY-300,mouseX-5,mouseY-200);
  line(mouseX,mouseY-300,mouseX,mouseY-200);
  line(mouseX+5,mouseY-300,mouseX+5,mouseY-200);
  line(mouseX+10,mouseY-300,mouseX+10,mouseY-200);
  line(mouseX+15,mouseY-300,mouseX+15,mouseY-200);
  line(mouseX+20,mouseY-300,mouseX+20,mouseY-200);
  line(mouseX+25,mouseY-300,mouseX+25,mouseY-200);
  line(mouseX+30,mouseY-300,mouseX+30,mouseY-200);
  line(mouseX+35,mouseY-300,mouseX+35,mouseY-200);
  line(mouseX+40,mouseY-300,mouseX+40,mouseY-200);
  line(mouseX+45,mouseY-300,mouseX+45,mouseY-200);
 
  //Horizontal lines
  line(mouseX-50,mouseY-295,mouseX+50,mouseY-295);
  line(mouseX-50,mouseY-290,mouseX+50,mouseY-290);
  line(mouseX-50,mouseY-285,mouseX+50,mouseY-285);
  line(mouseX-50,mouseY-280,mouseX+50,mouseY-280);
  line(mouseX-50,mouseY-275,mouseX+50,mouseY-275);
  line(mouseX-50,mouseY-270,mouseX+50,mouseY-270);
  line(mouseX-50,mouseY-265,mouseX+50,mouseY-265);
  line(mouseX-50,mouseY-260,mouseX+50,mouseY-260);
  line(mouseX-50,mouseY-255,mouseX+50,mouseY-255);
  line(mouseX-50,mouseY-250,mouseX+50,mouseY-250);
  line(mouseX-50,mouseY-245,mouseX+50,mouseY-245);
  line(mouseX-50,mouseY-240,mouseX+50,mouseY-240);
  line(mouseX-50,mouseY-235,mouseX+50,mouseY-235);
  line(mouseX-50,mouseY-230,mouseX+50,mouseY-230);
  line(mouseX-50,mouseY-225,mouseX+50,mouseY-225);
  line(mouseX-50,mouseY-220,mouseX+50,mouseY-220);
  line(mouseX-50,mouseY-215,mouseX+50,mouseY-215);
  line(mouseX-50,mouseY-210,mouseX+50,mouseY-210);
  line(mouseX-50,mouseY-205,mouseX+50,mouseY-205);
  
  fill(0,0,0);
  ellipse(mouseX,mouseY,20,60);
  
  flyX = flyX + random(-3,3) + flyY/300;
  flyY = flyY + random(-3,3) + flyX/300;
  
  //Fly
  fill(flyF1,flyF2,flyF3);
  triangle(flyX+10,flyY+10, flyX+10, flyY+40, flyX+0, flyY+50);
  triangle(flyX+10, flyY+10, flyX+10, flyY+40, flyX+20, flyY+50);
  
  //Fly eyes
  fill(250,0,0);
ellipse(flyX+7,flyY+17,5,5);
ellipse(flyX+14,flyY+17,5,5);

//Texts
//fill(flyX, 102, 153);
//text("you missed..", flyX, flyY);
//fill(0, 102, 153);
//text("KLASK!!", mouseX, mouseY);


//Fly legs
  //line(flyX

  
  
 //Logix 
  
}
void mousePressed() {
  if (flyX == 0) {
    flyX = random(100,700);
    flyY = random(0,200);
    flyF1 = random(0,200);
    flyF2 = random(0,200);
    flyF3 = random(0,200);
    
    
  } else {
    flyX = random(100,700);
    flyY = random(0,200);
    flyF1 = random(0,200);
    flyF2 = random(0,200);
    flyF3 = random(0,200);
  }
}
