
size (800, 600);//
background (0);
smooth();

for ( int i = 0; i < 100; i = i +1){

fill(255);
strokeWeight(random(15));
stroke(random(255),255,255, 20); 
ellipse(random(width),random(height) ,2,2);

}


for ( int i = 0; i < 50; i = i +1){
  
strokeWeight(random(5));
stroke( 255, 255, 255, 20); 
line(400, 300, random(width), random(height));

}


for ( int i = 0; i < 65; i = i +1){
  
strokeWeight(random(2));
stroke( 255, 0, 255, 20); 
line(200, 500, random(width), random(height));

}

for ( int i = 0; i < 80; i = i +1){
  
strokeWeight(random(3));
stroke( 255, 255, 0, 20); 
line(700, 100, random(width), random(height));

}

for ( int i = 0; i < 70; i = i +1){
  
strokeWeight(random(1));
stroke( 0, 255, 255, 20); 
line(700, 500, random(width), random(height));

}


for ( int i = 0; i < 70; i = i +1){
  
strokeWeight(random(2));
stroke( 0, 255, 255, 20); 
line(200, 100, random(width), random(height));

}
