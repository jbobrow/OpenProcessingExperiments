
size(500,500);
noStroke();
translate(250,250);
background(10,0,0,0);

for(float i=0; i<350; i++){
   rotate(0.2);
   strokeWeight(10);
   stroke(50,255,50,random(25));
   line( i,0,15,15);
   noStroke();
   fill(random(25),random(255),random(255),random(20));
   triangle( i,0,15,15,30,40);
   fill(random(255),random(25),random(25),200);
   ellipse( i,0,15,15);
   
  
}

