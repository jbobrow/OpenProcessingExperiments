
size(400,565);
background(225,100,100);


fill(0);
quad(300,0,400,0,400,565,200,565);


point(100,100);
stroke(0);
strokeWeight(8);

line(200,566,300,0);

noStroke();   
ellipse(235, 535, 50, 50);  

stroke(0); 
noFill();   
ellipse(235, 535, 50, 50);  


noStroke();   
ellipse(220, 535, 50, 50);  
 
stroke(0); 
 
ellipse(290, 535, 50, 50);  



triangle(40,130,50,400,250,50);
fill(192,3,255,90);

triangle(80,170,90,440,290,90);

triangle(120,210,130,480,330,130);
noFill();



textSize(70);
text("ART", 0, 565);

int eSize = 3;

for(int i=0; i<200; i+=5) {    
  ellipse(i, i, eSize, eSize);  
}

int i = 0;    

while(i < 200) {   
  ellipse(i, i, eSize, eSize);  
  i = i + 5;
}


