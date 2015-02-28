
size(250,250);
background(255);
smooth();

noStroke();

fill(255,54,195,60);
triangle(100,250,130,35,180,250);

fill(252,99,181,70);
//light pink triangles 
triangle(140,250,120,230,165,250);
triangle(160,250,110,180,190,250);
triangle(180,250,150,140,240,250);
triangle(235,250,230,160,260,250);

fill(252,99,181,85);
//light pink triangles on bottom
triangle(65,250,100,70,90,250);
triangle(140,250,125,150,150,250);
triangle(200,250,110,120,220,250);
triangle(225,250,200,130,250,250);

fill(242,34,76,95);
//medium dark pink on bottom
triangle(45,250,60,120,70,250);
triangle(125,250,80,150,180,250);
triangle(200,250,180,50,250,250);

fill(252,99,181,85);
//medium-dark pink on top
triangle(140,0,125,150,150,0);
triangle(200,0,110,120,220,0);
triangle(225,0,200,130,250,0);
triangle(0,50,100,130,0,90);
triangle(0,190,150,120,0,150);


fill(242,34,76,95);
//dark pink on top
triangle(125,0,80,150,180,0);
triangle(200,0,180,50,250,0);
triangle(250,0,200,150,250,70);
triangle(50,0,120,130,100,0);
triangle(0,-10,40,60,30,0);
triangle(0,40,80,120,0,70);

fill(252,99,181,70);
//light pink triangles 
triangle(140,0,120,230,165,0);
triangle(160,0,110,180,190,0);

triangle(235,0,230,160,260,0);



noFill();
stroke(0,40);
strokeWeight(.5);
//Scribbles
for(int x=30; x<=250; x+=40){
  for(int y =30; y<=250; y+=40){
    ellipse(x,y,50,50);
    ellipse(x,y,35,35);
    ellipse(x,y,x,55);
    ellipse(x,y,x,y);
    
  }
}
 for(int x =60; x<=250; x+=35){
    for(int y = 50; y<=250; y+=25){
       ellipse(x,y,35,20);
    ellipse(x,y,x,55);
    ellipse(x,y,x,y);
  }
}  
for(int x=70; x<=2500; x+=20) {
  for(int y=60; y<=250; y+=50) {
    ellipse(x,y,70,70);
    ellipse(x,y,20,20);
    ellipse(x,y,40,40);
  }
}

noFill();
strokeWeight(.45);
stroke(0,0,0,30);
translate(width/2, height/2);
rotate(PI/4.0);
rect(-156, -6, 130, 130);
rect(-100,-50,90,90);
rect(-100,10,150,150);
rect(-50,-60,30,30);
rect(-10,-70,70,70);

strokeWeight(.45);
rect(-40,-50,100,100);
rect(50,-100,120,120);
rect(150,-10,55,55);



