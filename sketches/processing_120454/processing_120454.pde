
size(400,565);
background(255);

noStroke();
fill(249,27,27);
triangle(150,50,30,210,380,520);

stroke(0);
strokeWeight(3);

fill(0);

quad(200,325,300,325,300,475,200,475);

fill(255);

quad(150,300,250,300,250,400,150,400);

fill(255);

quad(320,10,320,70,390,70,390,10);

fill(255);

quad(10,250,10,300,60,300,60,250);

noFill();

quad(-10,275,-10,340,40,340,40,275);


noStroke();
fill(249,27,27);

ellipse(75, 450, 100, 100);

fill(0);

ellipse(125, 500, 70, 70);

strokeWeight(4);
stroke(0);
noFill();
ellipse(400, 325, 50, 50);
ellipse(400, 325, 150, 150);
ellipse(400, 325, 250, 250);

stroke(0);
strokeWeight(5);
line(100, -10, 100, 575);

strokeWeight(3);
line(-10, 480, 450, 100);

strokeWeight(5);
line(100, -10, 100, 575);

noStroke();
fill(0);
triangle(150,150,250,25,350,150);

int i = 15;
int eSize = 13;

noStroke();
fill(0);
 
while(i < 100) {
  ellipse(i, i, eSize, eSize);
  i = i + 25;
}

smooth();
 
fill(0);
 
  for(int x = 180; x <= width; x += 30){
    ellipse(x, 520, eSize, eSize);
  }



smooth();
 
for(int x=0; x<=width; x+=45){
 
  if(x <= width/3){
    fill(249,27,27);
  }
  else{
    fill(0);
  }
  ellipse(x, height/2, eSize, eSize);
  println("x=" + x);
}


