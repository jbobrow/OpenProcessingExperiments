
float x;
float y;
float easing = 0.05;
int counter;
  
void setup() {
  size(700, 350);
  noStroke();
  counter=0;
}
  
void draw() {
  noCursor();
  //starfield background
  background(2,30,59);
  pushMatrix();
  frameRate(1);
  fill(255);
    ellipse(30,30,random(0,3),random(0,3));
    ellipse(350,150,random(0,3),random(0,3));
    ellipse(300,300,random(2,5), random(2,5));
    ellipse(100,100,random(2,5),random(2,5));
    ellipse(150,200,random(0,3),random(0,3));
    ellipse(400,40,random(0,3),random(0,3));
    ellipse(330,320,random(0,3),random(0,3));
    ellipse(405,35,random(1,4),random(1,4));
    ellipse(500,270,random(0,3),random(0,3));
    ellipse(610,250,random(0,3),random(0,3));
    ellipse(45,270,random(3,6),random(3,6));
  frameRate(30);
  popMatrix();
   
   
  blackhole(); 
   
  nyan();
   
  pushMatrix();
  float targetX = mouseX;
  float dx = targetX - x;
  if(abs(dx) > 1) {
    x += dx * easing;
  }
  
 float targetY = mouseY;
  float dy = targetY - y;
  if(abs(dy) > 1) {
    y += dy * easing;
  }
  popMatrix();
   
     
// laser pointer dot
    fill (255,0,0);
    ellipse (mouseX, mouseY,6,6);
   
}
   
void blackhole()
{
  //blackhole
  pushMatrix();
      translate(520,150);
          pushMatrix();
              counter++;
              rotate(radians(frameCount));
              strokeWeight(3);
              stroke(random(255),100,255,70);
              fill(random(255),100,255,50);
              ellipse(0,0,200,200);
                  pushMatrix();
                  rotate(radians(frameCount));
                  translate(50,0);
                    pushMatrix();
                    scale (0.7);
                    skuttlebutt ();
                    popMatrix();
                  popMatrix();
          popMatrix();
  popMatrix();
 
} 
     

void nyan()
{
          
//Nyan Cat
  
stroke (0,0,0);
strokeWeight(2);
fill (150,150,150);
    ellipse(x+20,y+55,20,7); //tail
       
//feet
    ellipse(x+30,y+75,10,15); //foot1
    ellipse(x+39,y+75,10,15); //foot2
    ellipse(x+60,y+75,10,15); //foot3
    ellipse(x+69,y+75,10,15); //foot4
  
//body  
  fill(254,203,150);
    rect(x+25,y+25, 60, 50, 7); //poptart crust
noStroke();
fill (255,153,255);
    rect(x+30,y+30, 50, 40, 7); //poptart frosting
      
//Sprinkles on body
noStroke();
fill(255,50,154);
    ellipse(x+40,y+40,3.5,3.5);
    ellipse(x+50,y+50,3.5,3.5);
    ellipse(x+35,y+60,3.5,3.5);
    ellipse(x+55,y+35,3.5,3.5);
    ellipse(x+70,y+40,3.5,3.5);
   /* optional twinkling sprinkles
    ellipse(x+40,y+40,random(2,5), random(2,5));
    ellipse(x+50,y+50,random(2,5), random(2,5));
    ellipse(x+35,y+60,random(2,5), random(2,5));
    ellipse(x+55,y+35,random(2,5), random(2,5));
    ellipse(x+70,y+40,random(2,5), random(2,5));*/
    
     
//cathead//
   
//ears
stroke(0,0,0);
strokeWeight(2);
fill(150,150,150);
    triangle (x+58,y+55,x+63,y+40,x+71,y+50); //earl
    triangle (x+75,y+55,x+86,y+40,x+91,y+55); //earr
     
//head
stroke(0,0,0);
strokeWeight(2); 
fill (150,150,150);
    ellipse (x+75,y+63,40,30);
   
//catnose
noStroke();
fill (255,153,255);
    triangle(x+73,y+64,x+78,y+70,x+83,y+64);
  
//eyes
stroke(0,0,0);
strokeWeight(2);
 fill(0,0,0);
    ellipse(x+70,y+59,5,5);
    ellipse(x+85,y+59,5,5);
       
 //smile
 strokeWeight(2);
 fill(0,0,0);
    arc(x+75,y+72,5,5, 0, PI);   
 noStroke();
 fill(248,248,255);
    ellipse(x+69,y+58,3,3);
    ellipse(x+84,y+58,3,3);
}

void skuttlebutt() {
//make skuttlebutt shape  
noStroke();
   fill(32,3,35); // random colors for the hat
   rect(32,3,35,20); //hat
   rect(27,14,45,5);
   fill(200,0,230); // random colors for the hat band
   rect(32,11,35,3); // hat band
   fill(87); // charcoal
   ellipse(50,55,70,75); // body and wings
   ellipse(19,65,12,40);
   ellipse(81,65,12,40);
   fill(0); // black
   ellipse(48,40,2,2); // eyes and random sizing
   ellipse(52,40,2,2);
   fill(250); // white
   ellipse(50,75,30,35); // tummy
   fill(200,150,0); // random shoe color
   ellipse(39,93,15,5); // feet
   ellipse(61,93,15,5);
   fill(200,150,0); // orange
   triangle(44,44,56,44,50,49); // beak
   stroke(0);
   fill(114,207,234,30)
   ellipse(50,35,80,80);

  
  }


