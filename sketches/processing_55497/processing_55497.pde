
size(600,600); 
smooth(); 
background(750,70,50); 

//Body
fill(0,0,255); 
arc(200, 210, 600, 500, 1, 2.1);

//Neck
fill(255,150,250);            
ellipse(200, 200, 25, 10);  
ellipse(200, 190, 25, 10);  
ellipse(200, 180, 25, 10); 
ellipse(200, 170, 25, 10); 
ellipse(200, 210, 25, 10); 

//Head
fill(500,200,100);   
ellipse(200, 100, 120, 150); 

//Face
fill (0);
ellipse(150, 100, 50, 50);
ellipse(250, 100, 50, 50);
strokeWeight (5);
line(180, 150, 220, 150);

//Hand
fill(0); 
strokeWeight (10);
line(160, 270, 100, 90);
line(250, 270, 400, 100);

//legs
rect (150,460, 30, 130);
rect (220, 460, 30, 130);



