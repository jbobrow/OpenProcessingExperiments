

int x = 250;     //x-coordinate
int y = 250;      //y-coordinates
int bodyHeight = 400;  // BodyHeight
int radius = 90;      //head radius


size(480, 480); 
smooth();  
background(204); 
ellipseMode(RADIUS); 


// Neck 
strokeWeight(3);
fill(220);
rect(x, y, 50, 6);
rect(x-5, y+10, 60, 6);
rect(x-10, y+20, 70, 6);
rect(x-5, y+30, 60, 6);
rect(x, y+40, 50, 6);

// Antennae 
strokeWeight(1);
line(220, 100, 100, 50);   // left
fill(255,150,250);
ellipse(100,50,10,10);
line(276, 155, 300, 40);  // middle
ellipse(300,40,10,10);
line(340, 130, 440, 80);    // right 
ellipse(440,80,10,10);


// Head 
noStroke();
fill(224,255,255);                
ellipse(x+40, 155, radius, radius);  // Head 
fill(0,115,0);              //nose 
ellipse(x+50, y-80, 8, 8);    
fill(0,90,100);               //fill eyes
ellipse(x+70, 126, 12, 12);    // left
ellipse(x+10, 126, 12, 12);    // right 

//body
fill(180);
ellipse(x+25, 420, 120, 120);
fill(80);
ellipse(276, 350, radius-50, radius-50);
fill(0,90,100);
ellipse(276, 350, radius-70, radius-70);
fill(220,100,100);
ellipse(276, 350, radius-80, radius-80);
fill(224,255,255);
rect(157, y-bodyHeight, 239, 90);
fill(80);
rect(157, y-bodyHeight, 239, 30);
fill(80);
rect(157, bodyHeight+60, 239, 10);


