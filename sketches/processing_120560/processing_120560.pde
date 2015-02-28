
size(400,565);
background(255,255,255);

fill(204,204,204);
ellipse(100,300,200,200);

fill(200,105,54,75);
ellipse(150,250,200,200);

fill(0,0,0);
ellipse(350,500,40,40);

fill(204,51,0);
ellipse(150,400,30,30);

fill(204,51,102);
ellipse(250,100,20,20);

fill(255,0,102);
ellipse(250,450,10,10);

stroke(0);
strokeWeight(1);
line(200,500,300,100);

stroke(0);
strokeWeight(1);
line(200,500,200,100);

strokeWeight(2);
line(400, 500, 300, 100);

fill(204,0,0);
triangle(50,100,100,100,300,300);

fill(255,255,255);
triangle(150,200,200,400,400,400);

strokeWeight(0);
for(int i = 0; i < 100; i++){
  stroke(random(30), random(30), random(30));
  line(random(width), random(height), random(width), random(height));
}

fill(0);
textSize(40);
text("EL LISSITZKY", 20, 80);


int i = 0;
if (i > 0) background(255, 0, 0);





