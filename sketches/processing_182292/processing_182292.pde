
/*
 * Monster sketch
 */

//void setup and void draw make active mode, without them it is static
void setup() {
  size(800, 1000);
  noStroke();
}

void draw() {//this will loop over and over
  background(0);
  
  fill(#1E28D3);
  for(int i =0; i < 101; i++){
    
      for(int x = 0; x< 101; x++){
        
      ellipse(10*i, 10*x, 5, 5);
      
      }
    
  }
    
  
    fill(#F5EE1B);//leg flank right;
    ellipse(424, 510, 100, 100);
  
    fill(#F5EE1B);//right leg ;
    triangle(440, 513, 398, 502, 409, 652); 
    
    fill(120);//last part of left arm
    triangle(326, 412, 255, 384, 290, 433);
    
    fill(150);//left arm second one
    triangle(362, 381, 290, 433, 383, 438);
  
    fill(204);//left arm
    triangle(363, 372, 350, 410, 382, 422);
   
    
  
    fill(#CDCD32); //torso
    rect(399, 380, 150, 200); 
  
    fill(#F5EE1B);//leg left;
    triangle(547, 485, 490, 481, 553, 668); 
  
    fill(#F5EE1B);//leg flank left;
    ellipse(500, 507, 100, 100);
    

   
    fill(#CDCD32);//shoulder right
    arc(475, 390, 150, 100, PI, TWO_PI);  
    
    
        
   fill(204);//arm socket right
   rect(490, 373, 50, 50);
   
   fill(150);//right arm 
   triangle(539, 375, 490, 425, 614, 425);
   
   fill(120);//forearm right
   triangle(614, 425, 575, 402, 619, 329);
    
  
     fill(255);//fluff #3 behind neck
    triangle(425, 384, 436, 274, 446, 284); 

    fill(255);//fluff #4 behind neck
    triangle(376, 290, 368, 296, 390, 306); 
  
    fill(255);//fluff #5 behind neck
    triangle(371, 312, 381, 324, 393, 301);    
    
    fill(255);//more fluff
    triangle(377, 337, 353, 332, 366, 312);
  
    fill(204);//neck
    quad(300, 100, 350, 100, 400, 360, 480, 360);
    
  
   
    
    fill(255);//chest fluff
    quad(400, 300, 450, 350, 400, 500, 350, 350); 
    
    fill(255);//fluff #1
    triangle(481, 366, 480, 331, 417, 332);
    
    fill(255);//fluff #2
    triangle(442, 307, 466, 339, 475, 298);

   fill(#C3C62E);//yellow horns left side
   rect(140, 80, 100, 10);
   
   fill(#C3C62E);//yellow horns left side #2
   rect(175, 80, 10, 100);
   
   fill(#C3C62E);//yellow horns left side #3
   rect(140, 30, 10, 100);
   
   fill(#C3C62E);//yellow horns left side #4
   rect(40, 30, 100, 10);
   
   fill(#C3C62E);//yellow horns left side #5
   rect(40, 30, 10, 100);
   
   fill(#C3C62E);//yellow horns left side #6
   rect(40, 80, 50, 10);
   
   

   fill(#F5EE1B);//yellow
   ellipse(330, 150, 250, 250);
   
   fill(#C3C62E);//yellow horns right side
   rect(400, 80, 100, 10);
   
   fill(#C3C62E);//yellow horns #2 right side
   rect(490, 20, 10, 90);

   fill(#C3C62E);//yellow horns #3 right side
   rect(500, 20, 100, 10);
   
    fill(#C3C62E);//yellow horns #4 right side
   rect(550, 30, 10, 100);

   fill(#C3C62E);//yellow horns #4 right side
   rect(600, 20, 10, 200);

  fill(#1411F2);//blue
  ellipse(252, 144, 72, 72);
  
  fill(#C3C62E);//yellow eyelid
  arc(252, 140, 72, 72, PI, TWO_PI);

  fill(#1411F2);//blue
  ellipse(370, 144, 72, 72);

  fill(#C3C62E);//yellow eyelid
  arc(370, 140, 72, 72, PI, TWO_PI);

  fill(255);//white mustache
  arc(305, 220, 150, 150, PI, TWO_PI);
  
  fill(0);//mustache lines
  rect(250, 190, 3, 30);
  
   fill(0);//mustache lines
  rect(280, 190, 3, 30);
  
   fill(0);//mustache lines
  rect(330, 190, 3, 30);
  
   fill(0);//mustache lines
  rect(360, 190, 3, 30);
  
  
  
  fill(255);
  text(mouseX + "," + mouseY, 20, 20); //shows where your x and y coordinate is at with mouse movement
  
}



