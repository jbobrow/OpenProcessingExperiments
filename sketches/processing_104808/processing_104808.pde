
size (360, 385);

background (230);

//half red square
fill (255, 0, 0);
noStroke();
rect (338, 295, 100, 100);

//half yellow squares
fill(255, 200, 5);
rect (0, 295, 40, 100);
rect (240, 0, 100, 140);

//white squares
fill(255);
rect (70, 0, 170, 100);
rect (240, 140, 100, 100);

//horizontal lines
stroke(0);
strokeCap (SQUARE);//square ends
strokeWeight (5);
line (5, 40, 390, 40);
line (70, 40, 70, 5);
line (240, 240, 240, 5);
line (5, 295, 390, 295);
line (240, 240, 340, 240);
line (240, 140, 340, 140);

//vertical lines
line (40, 40, 40, 370); 
line (240, 40, 240, 370); 
line (140, 40, 140, 380); 
line (340, 15, 340, 380); 
line (290, 140, 290, 240);

//red square
fill (255, 0, 0);
rect (40, 40, 200, 200);
    
//black squares
fill (0);
rect (40, 240, 100, 100);
rect (140, 340, 100, 30);

//blue squares
fill (0, 0, 255);
rect (240, 295, 100, 75);









