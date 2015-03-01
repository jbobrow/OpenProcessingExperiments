
size (100,100); //size of space 

for (int x= -50; x < 100 ; x += 3){
 ellipse (x,x-2,40,40); 
}
//for the integer -50, the test is x is less than 100
//-50 plus 10 is -40) 
//this ellipse will continue to run until x is greater than
//or equal to 100)


for (int ax = 10 ; ax <500 ; ax+= 10 ){
line (0,ax,ax,100);
}

for (int ax = 10 ; ax <500 ; ax+= 10 ){
line (ax,0,0,ax);
}


