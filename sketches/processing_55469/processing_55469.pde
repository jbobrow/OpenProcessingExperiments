
//city_origami_logo

float x = 80;

float y = 77;

float ea;
float targeta;


float eb;
float targetb;

float ec;
float targetc;

float ed;
float targetd;



void setup(){
 
  size (500,500);
  smooth();
  
}

void draw(){
    
   background(255);
   noStroke();
   
  
   
    //light grey quads
    
   
  //float mx = map(mouseX, 0,width, 90,-90);


  if (mouseX>100 && mouseX<200 && mouseY > 100 && mouseY < 200)
  {
    targetb = -170;
  }
  else
  {
    targetb = 90;
  }

  eb += (targetb-eb) * 0.05;

  float x2 = 208+  cos(radians(eb))*200;
  float y2 = 196+  sin(radians(eb))*100;
  //println(y1);


  float fillVal2 = map(y2, 0, 200, 200, 220);
 

    
//  fill(fillVal2);
//  beginShape();
//  vertex(206, 133);//top right
//  vertex(x2+53, y2-138); //bottom right 
//  vertex(x2, y2-100); //bottom left
//  vertex(152, 165);//top left
//  endShape(CLOSE);
  

  fill(220);
  beginShape();
  vertex(206, 133);//top right
  vertex(261, 165); //bottom right 
  vertex(208, 196); //bottom left
  vertex(152, 165);//top left
  endShape(CLOSE);
  
   
//quad(206, 133, 261, 165, 208, 196, 152, 165); //quad 1
  
      
  fill(220);
  
  beginShape();
  vertex(206+ x, 133 + y); //top right
  vertex(261 + x, 165 + y); //bottom right
  vertex(208 + x, 196 + y); //bottom left
  vertex(153 + x, 165 + y); //top left
  endShape(CLOSE);
  
  
  //quad(206+ x, 133 + y, 261 + x, 165 + y, 208 + x, 196 + y, 153 + x, 165 + y); //quad 2
  
  
  fill (200); //medium grey quads
  
  beginShape();
  vertex(179, 243); //top right
  vertex(208, 258); //bottom right 
  vertex(208, 290); //bottom left
  vertex(153, 260); //top left
  endShape(CLOSE);
  
   //quad(179, 243, 208, 258, 208, 290, 153, 260); //quad 1
   
   
  
  beginShape();
  vertex(180+x, 244+y); //top right
  vertex(208+x, 260+y); //bottom right 
  vertex(208+x, 292+y); //bottom left
  vertex(153+x, 260+y); //top left
  endShape(CLOSE); 
  
  //quad(180+x, 244+y, 208+x, 260+y, 208+x, 292+y, 153+x, 260+y); //quad 2
  
  
  fill (150);//dark grey quads
  

  //float mx = map(mouseX, 0,width, 90,-90);


  if (mouseX>100 && mouseX<200 && mouseY > 100 && mouseY < 200)
  {
    targetc = -90;
  }
  else
  {
    targetc = 90;
  }

  ec += (targetc-ec) * 0.05;

  float x3 = 152+  cos(radians(ec))*100;
  float y3 = 260+  sin(radians(ec))*100;
  //println(y1);


  float fillVal3 = map(y3, 0, 200, 100, 200);
 
 noStroke();
// fill(fillVal3);
// beginShape();
//  vertex(152, 165); //top left
//  vertex(180, 180); //top right
//  vertex(180, 244); //bottom right
//  vertex(x3, y3-105); //bottom left
//  endShape(CLOSE); 
  
  fill(150);
  beginShape();
  vertex(152, 165); //top left
  vertex(180, 180); //top right
  vertex(180, 244); //bottom right
  vertex(152, 260); //bottom left
  endShape(CLOSE); 
  
 //quad(152, 165, 180, 180, 180, 244, 152, 260); //quad 1
 
    if (mouseX>100 && mouseX<200 && mouseY > 100 && mouseY < 200)
  {
    targetd = -95;
  }
  else
  {
    targetd = 90;
  }

  ed += (targetd-ed) * 0.05;

  float x4 = 208+  cos(radians(ed))*100;
  float y4 = 227-50+  sin(radians(ed))*70;
  
 
  //println(y1);


  float fillVal4 = map(y4, 0, 200, 0, 220);
 
 noStroke();
 fill(fillVal4);
  //fill(150);
   beginShape();
  vertex(208, 196); //top left
  vertex(261, 165); //top right 
  vertex(x4-20, y4-20); //bottom right//-20 is making the fold in the back
  vertex(x4, y4-20); //bottom left
  endShape(CLOSE); 
  
  fill(150);
   beginShape();
  vertex(208, 196); //top left
  vertex(261, 165); //top right 
  vertex(53+x4, 196); //bottom right
  vertex(x4,y4- 20); //bottom left
  endShape(CLOSE); 
  
 

   //quad(208, 196, 261, 165, 261, 196, 208, 227); //quad 2
 fill(150);
  beginShape();
  vertex(208, 257); //top left
  vertex(233, 242); //top right 
  vertex(235, 275); //bottom right
  vertex(208, 291); //bottom left
  endShape(CLOSE); 
 
 
// quad(208, 257, 233, 242, 235, 275, 208, 291); //quad 3

  fill(150);
  beginShape();
  vertex(153 +x, 165 +y); // top left
  vertex(180 +x, 180 +y); //top right
  vertex(180 +x, 244 +y); //bottom right
  vertex(152+x, 260 +y); // bottom left
  endShape(CLOSE); 
  
 //quad(153 +x, 165 +y, 180 +x, 180 +y, 180 +x, 244 +y, 152+x, 260 +y); //quad 4
 
 
 
 //FOLDING ANIMATION FOR QUAD 5 (DARK GREY)  
 
 
 //float mx = map(mouseX, 0,width, 90,-90);


  if (mouseX>250 && mouseX<300 && mouseY >250 && mouseY < 300)
  {
  targeta = -90;
  }
  else
  {
    targeta = 90;
  }

  ea += (targeta-ea) * 0.05;

  float x1 = 208+x+  cos(radians(ea))*100;
  float y1 = 227+y-35+  sin(radians(ea))*100;
  //println(y1);

  float fillVal = map(y1, 0, 200, 0, 255);
  
  fill(fillVal);
  beginShape();
  vertex(208+x, 196+y); //top left
  vertex(261+x, 165+y); //top right
  //vertex(261+x, 197+y+62); //bottom right
  vertex(x1, y1); //bottom left
  endShape(CLOSE); 
  
  
  fill(150);
  beginShape();
  vertex(208+x, 196+y); //top left
  vertex(261+x, 165+y); //top right
  vertex(261+x, 197+y+62); //bottom right
  vertex(x1, y1); //bottom left
  endShape(CLOSE); 
 
 
 //quad(208+x, 196+y, 261+x, 165+y, 261+x, 197+y+62, 208+x, 227+y+62); //quad 5
     
    
  
 }

