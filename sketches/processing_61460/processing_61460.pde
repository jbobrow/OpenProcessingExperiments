
size(600,600);
noStroke();
translate(250,250);
background(random(25),random(35),random(50));
 
for(float i=0; i<350; i++){
   rotate(0.2);
   strokeWeight(10);
   stroke(18,255,45,random(25));
   line( i,0,20,20);
   noStroke();
   fill(random(25),random(255),random(255),random(20));
   triangle( i,0,20,20,30,40);
   fill(random(255),random(25),random(25),200);
  
   
}
