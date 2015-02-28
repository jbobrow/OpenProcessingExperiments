
int tri1a;
int tri1b; 
int tri2a; 
int tri2b; 
int tri3a;
int tri3b; 




void setup(){   
  
  tri1a = -10;
  tri1b = 455;
  tri2a = 170;
  tri2b = 430;
  tri3a = 175;
  tri3b = 460;
  

  
  size(400, 450); 
  
  
}
  
 void keyPressed(){
 
   switch(key){
     case 'a': 
 
 fill(255, 255, 255, 255); 
 
 ellipse(45, 50, 45,  45); 
 ellipse(30, 90, 25, 25); 
 ellipse(25, 100, 15, 15); // 3 top left corner 
 ellipse(190, 90, 60, 60); //middle single 
 ellipse(320, -30, 200, 200); //top right
 ellipse(55, 225, 70, 70); //smallest
 ellipse(-10, 310, 150, 150); //to its left
 ellipse(250, 190, 100, 100); //on top of next ellipse
 ellipse(300, 290, 250, 250);  //right on top of big one
 ellipse(120,300, 170, 170); //on top of bottom left
 ellipse(45, 390, 200, 200); //bottom left
 ellipse(290, 420, 350, 350); //big bottom right 
 
 triangle(tri1a, tri1b, tri2a, tri2b, tri3a, tri3b); 
 triangle(tri1a +15, tri1b -25, tri2a -25, tri2b -25, tri3a -25, tri3b -25);
 triangle(tri1a +20, tri1b -80, tri2a -45, tri2b -55, tri3a -55, tri3b -55);
 triangle(tri1a +35, tri1b -150, tri2a -35, tri2b -85, tri3a -35, tri3b -80); 
 triangle(tri1a +80, tri1b -210, tri2a -10, tri2b -125, tri3a -30, tri3b -130);
 triangle(tri1a +140, tri1b -260, tri2a +40, tri2b -135, tri3a -7, tri3b -160);
 triangle(tri1a +200, tri1b -290, tri2a +80, tri2b -145, tri3a +30, tri3b -170);
 triangle(tri1a +260, tri1b -310, tri2a +130, tri2b -140, tri3a +70, tri3b -180);
 triangle(tri1a +330, tri1b -315, tri2a +170, tri2b -170, tri3a +120, tri3b -190); 
 triangle(tri1a +410, tri1b -305, tri2a +220, tri2b -150, tri3a +180, tri3b -200);

 triangle(160, 200, 140, 150, 180, 200); 
 triangle(130, 150, 80, 90, 150, 140);
  //new one
 triangle(145, 80, 135, 50, 150, 85); 
 triangle(125, 80, 120, 70, 130, 80); 
 triangle(110, 60, 105, 40, 115, 60); 
 triangle(70, 35, 60, 30, 75, 35); 
 triangle(85, 50, 70, 40, 85, 45); 
 triangle(50, 40, 45, 35, 55, 40); 
 triangle(20, 20, 15, 10, 25, 25); 
 
 triangle(260, 135, 258, 90, 270, 125); 
 triangle(272, 100, 285, 70, 283, 95); 
 triangle(280, 150, 295, 80, 300, 150); 
 triangle(310, 80, 315, 50, 320, 80); 
 triangle(325, 65, 338, 40, 335, 65);
 triangle(340, 45, 345, 35, 345, 45);
 triangle(350, 30, 355, 15, 355, 30); 
 
 break; 
 case 's':
 
  fill(0, 0, 0); 
 
 ellipse(45, 50, 45,  45); 
 ellipse(30, 90, 25, 25); 
 ellipse(25, 100, 15, 15); // 3 top left corner 
 ellipse(190, 90, 60, 60); //middle single 
 ellipse(320, -30, 200, 200); //top right
 ellipse(55, 225, 70, 70); //smallest
 ellipse(-10, 310, 150, 150); //to its left
 ellipse(250, 190, 100, 100); //on top of next ellipse
 ellipse(300, 290, 250, 250);  //right on top of big one
 ellipse(120,300, 170, 170); //on top of bottom left
 ellipse(45, 390, 200, 200); //bottom left
 ellipse(290, 420, 350, 350); //big bottom right 
 break; 
 default: 
 break; 
   } 
 }

  void draw(){
    
    background (0, 10, 20, 34);
    
  stroke(255, 255, 255);
  strokeWeight(.5); 
    
 smooth();    
 fill(238, 238, 21, 10); 
 ellipse(45, 50, 45,  45); 
 fill(255, 185, 15, 32); 
 ellipse(30, 90, 25, 25); 
 fill(227, 168, 105, 32); 
 ellipse(25, 100, 15, 15); // 3 top left corner
 
 fill(0, 199,  140, 12); 
 ellipse(190, 90, 60, 60); //middle single 
 fill(0, 238, 238, 2); 
 ellipse(320, -30, 200, 200); //top right
 
 fill(199, 255, 112, 22); 
 ellipse(55, 225, 70, 70); //smallest
 fill(255, 193, 37, 22); 
 ellipse(-10, 310, 150, 150); //to its left
 fill(205, 192, 176, 22); 
 ellipse(250, 190, 100, 100); //on top of next ellipse
 fill(250, 128, 114, 32); 
 ellipse(300, 290, 250, 250);  //right on top of big one
 fill(190, 220, 58, 32);  
 ellipse(120,300, 170, 170); //on top of bottom left
 fill(51, 161, 201, 32); 
 ellipse(45, 390, 200, 200); //bottom left

 
  fill(61, 145, 64, 200); 
  ellipse(290, 420, 350, 350); //big bottom right 
  
  }
 
 void mousePressed (){
   
   fill(255, 255, 255); 
   stroke(10); 
 ellipse(45, 50, 5, 5); 
 ellipse(30, 90, 5, 5); 
 ellipse(25, 100, 5, 5); 
 ellipse(190, 90, 5, 5); 
 ellipse(320, -30, 5, 5); 
 ellipse(55, 225, 5, 5);  
 ellipse(-10, 310, 5, 5); 
 ellipse(250, 190, 5, 5); 
 ellipse(300, 290, 5, 5); 
 ellipse(120,300, 5, 5); 
 ellipse(45, 390, 5, 5);
 

 }

