
size(300,300);
background(random(255),random(255),random(255));

translate(width/2, height/2); // move to cntr

for(int x=0; x<=360; x +=15){
  pushMatrix();
 rotate(radians (x));
 fill(random(255),random(255),random(255));
 ellipse (100,0,15,20);
 noFill();
 arc(100,0,200,200,PI/2,PI);
 arc(100,0,200,200,PI,3*PI/2);

 popMatrix();
 println(x);}


