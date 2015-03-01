
int eSize = 10; 
size(510, 510); 
background(255); 
colorMode(RGB);
fill(255,0,0,25);
int diameter,x;
noStroke();

  

diameter = 300;

 

for(x=0; x<16; x++){
    ellipse(width/2,height/2,diameter,diameter);
    diameter = diameter - 7;
}



