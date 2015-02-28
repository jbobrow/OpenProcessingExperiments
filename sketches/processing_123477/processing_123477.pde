
size(600,600);

translate(300,300);

for (int i=0;i<6;i++){
 strokeWeight(5);
 stroke(255);
 line(0,0,100,0);
 stroke(1);
 strokeWeight(4);
 rotate(PI/3);
 fill(0,70,150);

 strokeWeight(4);
 fill(255);
 triangle(40,100,100,90,90,65);
 
 triangle(200,150,100,90,90,65);
 
 triangle(50,30,10,10,20,20);
}
//snow
for(int j=0;j<1000;j++){
  stroke(255, random(75,278));
  strokeWeight(4);
  point(random(-400,400), random(-400,400));
}
