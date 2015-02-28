
size (250,250);
background (#fffdd0);

int x1 = 5;
smooth();
 
for (x1 = 5; x1 < 125 ; x1 = x1 + 10){

stroke (#ff77b7);  
strokeWeight(2);
line (125, x1, x1+130, 125);
line (125, x1+130, x1, 125);
strokeWeight(1); 
line (125, 130-x1, x1, 125);
line (125, 240-x1, x1+130, 125);

}


