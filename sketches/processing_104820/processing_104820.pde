
size(610,610);

background(255);

//yellow rect bottom left
strokeWeight(0);
fill(250, 250, 0);
rect(0, 470, 55, 140); 

//yellow rect top right
rect(380, 0, 213, 220);

//bottom right hand red 
fill(255, 0, 0); 
rect(586, 470, 25, 140);

//first horizontal line 
strokeWeight(10);
strokeCap(SQUARE);
line(10,75, 595, 75); 

//second horizontal line 
strokeWeight(10);
strokeCap(SQUARE);
line(10, 220, 595, 220);

//third horizontal line 
strokeWeight(10);
strokeCap(SQUARE);
line( 10, 470, 610, 470); 

//third vertical line 
strokeWeight(10);
strokeCap(SQUARE);
line(590, 15, 590, 600);

//second vertical line 
strokeWeight(10);
strokeCap(SQUARE);
line(385, 6, 385, 577);

//first vertical line 
strokeWeight(10);
strokeCap(SQUARE);
line(150, 10, 150, 75);

//first lower box vertical
strokeWeight(10);
strokeCap(SQUARE);
line(55, 75, 55, 590);  

//horizontal line between black box and red box
strokeWeight(10);
strokeCap(SQUARE);
line(55, 400, 610, 400);

//vertical line that cuts box under red box in half 
strokeWeight(10);
strokeCap(SQUARE);
line(485, 220 , 485, 400); 

//black line below red square (vertical)
strokeWeight(10);
strokeCap(SQUARE);
line(220, 400 , 220, 600); 

//horizontal line below blue square
strokeWeight(10);
strokeCap(SQUARE);
line(55, 540, 385, 540);

//redsquare
fill(240, 0 , 0); 
rect(55, 75, 330, 325); 

//bluesquare
colorMode(RGB);
fill(0,0,245); 
rect(385, 470, 205, 115);

//horizontal line under blue box
line(220 , 585, 385 , 585);

//black rect left of blue square
fill(0); 
rect(220, 540, 165, 45); 

//black square under red square 
rect(55, 400, 165, 140);
