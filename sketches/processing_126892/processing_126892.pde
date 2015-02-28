
import de.looksgood.ani.*;
import de.looksgood.ani.easing.*;


float lightcolour = 0;
//float strokeblackwhite = 0;
float strokethick = 0.5;
int deet =40;

int big = 100;
//float baq = 255;

float placex = width/2;
float placey = height/2;
float placez = 0;

float placexx = width/2;
float placeyy = height/2;
float placezz = 0;

float placexxx = width/2;
float placeyyy = height/2;
float placezzz = 0;

float placexxxx = width/2;
float placeyyyy = height/2;
float placezzzz = 0;

float r = 255;
float g = 255;
float b = 255;
float a = 255;

float sr = 0;
float sg = 0;
float sb = 0;



void setup()
{
size(600, 600, P3D);

directionalLight(0, 255, 0, 0, -1, 0);
  
  
 placex = width/2;
 placey = height/2;
placez = 0;

placexx = width/2;
placeyy = height/2;
placezz = 0;

placexxx = width/2;
placeyyy = height/2;
placezzz = 0;

placexxxx = width/2;
placeyyyy = height/2;
placezzzz = 0;

Ani.init(this);
}

void draw()
{
directionalLight(255, 255, 255, 1, 1, -1);
  
  background(sr,sg,sb);
  camera(mouseX, mouseY, (height/2) / tan(PI/6), width/2, height/2, 0, 0, 1, 0);
  
  
  pushMatrix();
    stroke(sr,sg,sb);
    strokeWeight(strokethick );
  translate(placex, placey, placez);
  rotateX(mouseY * 0.01);
  rotateY(mouseX * 0.01);
  fill(r,g,b,a);
  sphereDetail(deet);
  sphere(big+5);
  popMatrix();
  
   pushMatrix();
    stroke(sr,sg,sb);
    strokeWeight(strokethick );
  translate(placexx, placeyy, placezz);
  rotateX(mouseY * 0.01);
  rotateY(mouseX * 0.01);
//  fill(g,b,r,a);
fill(r,g,b,a);
  sphereDetail(deet);
  sphere(big);
  popMatrix();
  
   pushMatrix();
    stroke(sr,sg,sb);
    strokeWeight(strokethick );
  translate(placexxx, placeyyy, placezzz);
  rotateX(mouseY * 0.01);
  rotateY(mouseX * 0.01);
//  fill(b,r,g,a);
fill(r,g,b,a);
  sphereDetail(deet);
  sphere(big);
  popMatrix();
  
  //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~1111
  
  
    pushMatrix();
    stroke(sr,sg,sb);
    strokeWeight(strokethick );
  translate(placex, placeyy, placezzz);
  rotateX(mouseY * 0.01);
  rotateY(mouseX * 0.01);
//  fill(r,g,b,a);
fill(r,g,b,a);
  sphereDetail(deet);
  sphere(big+5);
  popMatrix();
  
   pushMatrix();
    stroke(sr,sg,sb);
    strokeWeight(strokethick );
  translate(placexx, placeyyy, placez);
  rotateX(mouseY * 0.01);
  rotateY(mouseX * 0.01);
//  fill(g,b,r,a);
fill(r,g,b,a);
  sphereDetail(deet);
  sphere(big);
  popMatrix();
  
   pushMatrix();
    stroke(sr,sg,sb);
    strokeWeight(strokethick );
  translate(placexxx, placey, placezz);
  rotateX(mouseY * 0.01);
  rotateY(mouseX * 0.01);
//  fill(b,r,g,a);
fill(r,g,b,a);
  sphereDetail(deet);
  sphere(big);
  popMatrix();
  
  //~~~~~~~~~~~~~~~~~~~~~~~~~~2222
  
    pushMatrix();
    stroke(sr,sg,sb);
    strokeWeight(strokethick );
  translate(placex, placeyyy, placezz);
  rotateX(mouseY * 0.01);
  rotateY(mouseX * 0.01);
//  fill(r,g,b,a);
fill(r,g,b,a);
  sphereDetail(deet);
  sphere(big+5);
  popMatrix();
  
   pushMatrix();
    stroke(sr,sg,sb);
    strokeWeight(strokethick );
  translate(placexx, placey, placezzz);
  rotateX(mouseY * 0.01);
  rotateY(mouseX * 0.01);
//  fill(b,r,g,a);
fill(r,g,b,a);
  sphereDetail(deet);
  sphere(big);
  popMatrix();
  
   pushMatrix();
    stroke(sr,sg,sb);
    strokeWeight(strokethick );
  translate(placexxx, placeyy, placez);
  rotateX(mouseY * 0.01);
  rotateY(mouseX * 0.01);
//  fill(g,b,r,a);
fill(r,g,b,a);
  sphereDetail(deet);
  sphere(big);
  popMatrix();
  
  //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~33333333
  
      pushMatrix();
    stroke(sr,sg,sb);
    strokeWeight(strokethick );
  translate(placexxx, placeyyy, placezz);
  rotateX(mouseY * 0.01);
  rotateY(mouseX * 0.01);
  fill(r,g,b,a);
  sphereDetail(deet);
  sphere(big+5);
  popMatrix();
  
   pushMatrix();
    stroke(sr,sg,sb);
    strokeWeight(strokethick );
  translate(placexx, placeyyy, placez);
  rotateX(mouseY * 0.01);
  rotateY(mouseX * 0.01);
//  fill(g,b,r,a);
fill(r,g,b,a);
  sphereDetail(deet);
  sphere(big);
  popMatrix();
  
   pushMatrix();
    stroke(sr,sg,sb);
    strokeWeight(strokethick );
  translate(placex, placeyy, placez);
  rotateX(mouseY * 0.01);
  rotateY(mouseX * 0.01);
//  fill(b,r,g,a);
fill(r,g,b,a);
  sphereDetail(deet);
  sphere(big);
  popMatrix();
  
  //~~~~~~~~~~~~~~~~~~~~~~~~4444444
  
  
       pushMatrix();
    stroke(sr,sg,sb);
    strokeWeight(strokethick );
  translate(placexx, placeyyy, placez);
 rotateX(mouseY * 0.01);
  rotateY(mouseX * 0.01);
  fill(r,g,b,a);
  sphereDetail(deet);
  sphere(big+5);
  popMatrix();
  
   pushMatrix();
    stroke(sr,sg,sb);
    strokeWeight(strokethick );
  translate(placex, placeyyy, placezz);
  rotateX(mouseY * 0.01);
  rotateY(mouseX * 0.01);
//  fill(g,b,r,a);
fill(r,g,b,a);
  sphereDetail(deet);
  sphere(big);
  popMatrix();
  
   pushMatrix();
    stroke(sr,sg,sb);
    strokeWeight(strokethick );
  translate(placexx, placey, placezz);
  rotateX(mouseY * 0.01);
  rotateY(mouseX * 0.01);
//  fill(b,r,g,a);
fill(r,g,b,a);
  sphereDetail(deet);
  sphere(big);
  popMatrix();
  
  //~~~~~~~~~~~~~~~~~~55555
  
   pushMatrix();
    stroke(sr,sg,sb);
    strokeWeight(strokethick );
  translate(placexxxx, placeyyy, placezzzz);
  rotateX(mouseY * 0.01);
  rotateY(mouseX * 0.01);
  fill(r,g,b,a);
  sphereDetail(deet);
  sphere(big+5);
  popMatrix();
  
   pushMatrix();
    stroke(sr,sg,sb);
    strokeWeight(strokethick );
  translate(placexxxx, placeyyy, placezz);
  rotateX(mouseY * 0.01);
  rotateY(mouseX * 0.01);
//  fill(g,b,r,a);
fill(r,g,b,a);
  sphereDetail(deet);
  sphere(big);
  popMatrix();
  
   pushMatrix();
    stroke(sr,sg,sb);
    strokeWeight(strokethick );
  translate(placexxx, placeyyyy, placezzz);
  rotateX(mouseY * 0.01);
  rotateY(mouseX * 0.01);
//  fill(b,r,g,a);
fill(r,g,b,a);
  sphereDetail(deet);
  sphere(big);
  popMatrix();
  
  
  
//  if (mousePressed) {
//       
//      a = random(255);
////    directionalLight(random(255), random(255), random(255), 0, -1, -1);
//     
////      therotate=therotate+(random(0.05));
////  //lightcolour = 255;
////   strokeblackwhite = random(255);
////   strokethick=4;
//   
//   }
//  else {
//    a = 255;
////    baq = 255;
////     
////    strokeblackwhite = 0;
////strokethick = 20;
//    
//  }
}

void mousePressed() {
  Ani.to(this, 1.5, "deet", 2);
  
  Ani.to(this, 1.5, "a", 100);
  
  
    Ani.to(this, 3, "placex", random((width/2)-80,(width/2)+80), Ani.ELASTIC_IN_OUT);
    Ani.to(this, 3, "placey", random((height/2)-80,(height/2)+80), Ani.ELASTIC_IN_OUT);
    Ani.to(this, 3, "placez", random(-80,80), Ani.ELASTIC_IN_OUT);
    
    Ani.to(this, 3, "placexx", random((width/2)-200,(width/2)+200), Ani.ELASTIC_IN_OUT);
    Ani.to(this, 3, "placeyy", random((height/2)-200,(height/2)+200), Ani.ELASTIC_IN_OUT);
    Ani.to(this, 3, "placezz", random(-200,200), Ani.ELASTIC_IN_OUT);
    
    Ani.to(this, 3, "placexxx", random((width/2)-200,(width/2)+200), Ani.ELASTIC_IN_OUT);
    Ani.to(this, 3, "placeyyy", random((height/2)-200,(height/2)+200), Ani.ELASTIC_IN_OUT);
    Ani.to(this, 3, "placezzz", random(-200,200), Ani.ELASTIC_IN_OUT);
    
    Ani.to(this, 3, "placexxxx", random((width/2)-300,(width/2)+300), Ani.ELASTIC_IN_OUT);
    Ani.to(this, 3, "placeyyyy", random((height/2)-300,(height/2)+300), Ani.ELASTIC_IN_OUT);
    Ani.to(this, 3, "placezzzz", random(-300,300), Ani.ELASTIC_IN_OUT);
    
//    Ani.to(this, 3, "placex", random(mouseX-50,mouseX+50), Ani.ELASTIC_IN_OUT);
//    Ani.to(this, 3, "placey", random(mouseY-50,mouseY+50), Ani.ELASTIC_IN_OUT);
//    Ani.to(this, 3, "placez", random(-50,50), Ani.ELASTIC_IN_OUT);
//    
//    Ani.to(this, 3, "placexx", random(mouseX-100,mouseX+100), Ani.ELASTIC_IN_OUT);
//    Ani.to(this, 3, "placeyy", random(mouseY-100,mouseY+100), Ani.ELASTIC_IN_OUT);
//    Ani.to(this, 3, "placezz", random(-100,100), Ani.ELASTIC_IN_OUT);
//    
//    Ani.to(this, 3, "placexxx", random(mouseX-100,mouseX+100), Ani.ELASTIC_IN_OUT);
//    Ani.to(this, 3, "placeyyy", random(mouseY-100,mouseY+100), Ani.ELASTIC_IN_OUT);
//    Ani.to(this, 3, "placezzz", random(-100,100), Ani.ELASTIC_IN_OUT);
//    
//    Ani.to(this, 3, "placexxxx", random(mouseX-200,mouseX+200), Ani.ELASTIC_IN_OUT);
//    Ani.to(this, 3, "placeyyyy", random(mouseY-200,mouseY+200), Ani.ELASTIC_IN_OUT);
//    Ani.to(this, 3, "placezzzz", random(-200,200), Ani.ELASTIC_IN_OUT);
    
//    baq = 0;
    directionalLight(random(255), random(255), random(255), 0, -1, -1);
    
    Ani.to(this, 2, "strokethick", 5);
    
    Ani.to(this, 1.5, "r", random(25));
     Ani.to(this, 1.5, "g", random(255));
      Ani.to(this, 1.5, "b", random(255));
     //Ani.to(this, 1.5, "a", random(255));
     
      Ani.to(this, 1.5, "sr", random(255));
     Ani.to(this, 1.5, "sg", random(255));
      Ani.to(this, 1.5, "sb", random(15));
     //Ani.to(this, 1.5, "sa", random(255));
     
     Ani.to(this, 3, "big", 20, Ani.ELASTIC_IN_OUT);
     
}

void mouseReleased() {
  Ani.to(this, 5, "deet", 40);
  
   Ani.to(this, 1.5, "placex", mouseX);
    Ani.to(this, 1.5, "placey", mouseY);
    Ani.to(this, 1.5, "placez", 0);
    
     Ani.to(this, 1.5, "placexx", mouseX, Ani.ELASTIC_OUT);
    Ani.to(this, 1.5, "placeyy", mouseY, Ani.ELASTIC_OUT);
    Ani.to(this, 1.5, "placezz", 0, Ani.ELASTIC_OUT);
    
     Ani.to(this, 1.5, "placexxx", mouseX);
    Ani.to(this, 1.5, "placeyyy", mouseY);
    Ani.to(this, 1.5, "placezzz", 0);
    
     Ani.to(this, 1.5, "placexxxx", mouseX, Ani.ELASTIC_OUT);
    Ani.to(this, 1.5, "placeyyyy", mouseY, Ani.ELASTIC_OUT);
    Ani.to(this, 1.5, "placezzzz", 0, Ani.ELASTIC_OUT);
    
    Ani.to(this, 1.5, "sr", random(255));
     Ani.to(this, 1.5, "sg", random(255));
      Ani.to(this, 1.5, "sb", random(15));
     //Ani.to(this, 1.5, "sa", random(255));
    
     //baq = 255;
     
    //strokeblackwhite = 0;
    Ani.to(this, 1.5, "strokethick", 0);
    
    Ani.to(this, 1.5, "r", random(15));
     Ani.to(this, 1.5, "g", random(155));
      Ani.to(this, 1.5, "b", random(255));
     //Ani.to(this, 1.5, "a", random(255));
     
     Ani.to(this, 1.5, "big", 100, Ani.ELASTIC_IN);
}



//if (mousePressed)
//{
//  therotate=therotate+(random(0.05));
//  //lightcolour = 255;
//   strokeblackwhite = random(255);
//   strokethick=4;
//   
//    Ani.to(this, 1.5, "placex", 200, Ani.ELASTIC_OUT);
//    Ani.to(this, 1.5, "placey", 200, Ani.ELASTIC_OUT);
//    Ani.to(this, 1.5, "placez", 100, Ani.ELASTIC_OUT);
//    
//    Ani.to(this, 1.5, "placexx", 600, Ani.ELASTIC_OUT);
//    Ani.to(this, 1.5, "placeyy", 600, Ani.ELASTIC_OUT);
//    Ani.to(this, 1.5, "placezz", -100, Ani.ELASTIC_OUT);
//    
//    Ani.to(this, 1.5, "placexxx", 400, Ani.ELASTIC_OUT);
//    Ani.to(this, 1.5, "placeyyy", 400, Ani.ELASTIC_OUT);
//    Ani.to(this, 1.5, "placezzz", 600, Ani.ELASTIC_OUT);
//    
//}
//else
//{ strokeblackwhite = 0;
//strokethick = 20;
//
// Ani.to(this, 1.5, "placex", width/2, Ani.ELASTIC_OUT);
//    Ani.to(this, 1.5, "placey", height/2, Ani.ELASTIC_OUT);
//    Ani.to(this, 1.5, "placez", 0, Ani.ELASTIC_OUT);
//    
//     Ani.to(this, 1.5, "placexx", width/2, Ani.ELASTIC_OUT);
//    Ani.to(this, 1.5, "placeyy", height/2, Ani.ELASTIC_OUT);
//    Ani.to(this, 1.5, "placezz", 0, Ani.ELASTIC_OUT);
//    
//     Ani.to(this, 1.5, "placexxx", width/2, Ani.ELASTIC_OUT);
//    Ani.to(this, 1.5, "placeyyy", height/2, Ani.ELASTIC_OUT);
//    Ani.to(this, 1.5, "placezzz", 0, Ani.ELASTIC_OUT);
//    
//
//}


//void keyPressed() {
//  if (deet <= 15) {
//    deet ++;
//  } else {
//    deet = 3;
//  }
//}
    


