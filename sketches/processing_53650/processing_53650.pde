
size(500,500);
smooth();
background(0);

translate(250,250);
noStroke();

for (float i=0; i<500;i=i+1) {


  fill(random(255),random(255),random(255),random(100));
  rotate(0.1);
  rect(i,0, 100,40);
  
  //triangle(i+80,100,600,i,i,300);
  //rect(i,100,200,200);

 
}
                
                
