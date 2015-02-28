
size(400,565);
background(225,16,0);

noStroke();
fill(255);
rectMode(CENTER);
rect(200,200,200,400);



fill(0);
ellipse(300,100,150,150);

fill(225,16,0);
ellipse(300,100,100,100);

fill(255);
arc(300,100,100,100,radians(270),radians(450));





fill(255);
ellipse(100,300,150,150);

fill(225,16,0);
arc(100, 300, 150, 150, radians(270), radians(450) );

fill(0);
ellipse(100,300,100,100);


int a =53;
noStroke();
fill(0);
for(int i=0;i<6;i+=1){
  if(1 == i%2)fill(255,255,255);
  else fill(0);
triangle(i*10+i*a+15+a/2,450,i*10+i*a+15,545,i*10+i*a+15+a,545);
println(i/2);
}



stroke(0);
noFill();
strokeWeight(3);
rect(200,282.5,380,545);

fill(199,169,0,80);
rect(width/2,height/2,400,565);





