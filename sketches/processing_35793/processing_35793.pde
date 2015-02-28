
size(400,400);
background(255,255,255);

smooth();
int centerX = width/2;
int centerY = 2*width/5;

//neck
line(centerX - 49, centerY + 70, centerX - 49, centerY + 110);
line(centerX - 49, centerY + 110, centerX - 170, centerY + 160);
line(centerX + 49, centerY + 70, centerX + 49, centerY + 110);
line(centerX + 49, centerY + 110, centerX + 170, centerY + 160);

// head
ellipse(centerX, centerY, centerY, centerX);
// hair line
bezier(centerX - centerY/2, centerY, 
       centerX - centerY/2 - 10, centerY - 90,
       centerX - centerY/2, centerY - 110,
       centerX - 15, centerY - 130);
bezier(centerX - 15, centerY - 130, 
       centerX + 70, centerY - 125,
       centerX + 100, centerY - 90,
       centerX + centerY/2, centerY);      
line(centerX - centerY/2, centerY + 10,
     centerX - centerY/2 + 20, centerY - 80);
line(centerX - centerY/2 + 20, centerY - 80, 
     centerX + 50, centerY - 85);
bezier(centerX + 50, centerY - 85, 
       centerX + 69, centerY - 58,
       centerX + 76, centerY - 43,
       centerX + centerY/2, centerY + 10);
     
// ears
// left ear
bezier(centerX - centerY/2, centerY - 5, 
       centerX - centerY/2 - 3, centerY - 15,
       centerX - centerY/2 - 15, centerY - 15,
       centerX - centerY/2 - 10, centerY + 15);
bezier(centerX - centerY/2 - 10, centerY + 15,
       centerX - centerY/2 - 5, centerY + 34,
       centerX - centerY/2 - 3, centerY + 40,
       centerX - centerY/2 + 4, centerY + 34);       
//right ear
bezier(centerX - (-centerY/2), centerY -5, 
       centerX -(-centerY/2 - 3), centerY - 15,
       centerX - (-centerY/2 - 15), centerY - 15,
       centerX - (-centerY/2 - 10), centerY + 15);
bezier(centerX - (-centerY/2 - 10), centerY + 15,
       centerX - (-centerY/2 - 5), centerY + 34,
       centerX - (-centerY/2 - 3), centerY + 40,
       centerX - (-centerY/2 + 4), centerY + 34);      
       
// mouth
bezier(centerX - 28, centerY + centerX/4,
       centerX - 10, centerY + centerX/4 - 5,
       centerX - 5, centerY + centerX/4 - 8,
       centerX, centerY + centerX/4 - 5);
bezier(centerX, centerY + centerX/4 - 5,
       centerX + 5, centerY + centerX/4 - 8,
       centerX + 10, centerY + centerX/4 -5,
       centerX + 28, centerY + centerX/4);

bezier(centerX - 28, centerY + centerX/4,
       centerX - 5, centerY + centerX/4 + 10,
       centerX + 5, centerY + centerX/4 + 10,
       centerX + 28, centerY + centerX/4);
line(centerX - 28, centerY + centerX/4,
     centerX + 28, centerY + centerX/4);
     
// nose
line(centerX - 2, centerY - 19,
     centerX - 4, centerY + 22);
     

// glasses
rect(centerX - 58, centerY - 25, 45, 25);
rect(centerX + 15, centerY - 25, 45, 25);
line(centerX - 13, centerY - 14, centerX + 13, centerY - 14);
line(centerX - centerY/2, centerY, centerX - 58, centerY - 14);
line(centerX + 60, centerY - 14, centerX + centerY/2, centerY);

fill(0,0,0);
// eyes
ellipse(centerX - centerY/4 + 3, centerY - 15, 7, 7);
ellipse(centerX +centerY/4 - 3, centerY - 15, 7, 7);

//eyebrows
strokeWeight(5);
line(centerX - 20, centerY - 35,
     centerX - 60, centerY - 36);
line(centerX + 20, centerY - 35,
     centerX + 60, centerY - 36);
     
                                                                
