
void setup(){
size(600,600);
}
void draw (){
  if(mouseY<height/2){
  background(255);
  }
  else{
  background(0,0,200);
  }
//skyline
noStroke();
fill(0);
rect(0,20,100,300);
rect(100,100,150,250);
ellipse(300,150,200,300);
rect(250,200,300,200);
rect(550,50,50,350);
fill(255);
rect(5,50,30,40);
rect(30,50,30,40);
rect(100,200,15,15);
rect(130,200,15,15);
rect(155,200,15,15);
ellipse(200,150,100,50);
rect(300,100,20,20);
rect(300,150,20,20);
rect(300,200,20,20);
rect(580,100,30,300);
//plano superior
colorMode(RGB);
fill(174,221,60,160);
rect(0,0,600,400);
//nuvens
noSmooth();
fill(116,193,206,160);
ellipse(30,550,300,100);
ellipse(200,500,300,100);
//raios do sol
if(mouseY>height/2){
  fill(0,0,200);
}
else{
colorMode(RGB);
fill(242,204,47,160);
triangle(400,200,350,500,450,500);
triangle(500,200,350,500,450,500);
triangle(300,200,350,500,450,500);
triangle(250,250,350,500,435,525);
triangle(200,300,450,550,400,500);
triangle(150,300,400,550,450,500);
triangle(100,350,375,530,430,500);
triangle(100,400,425,540,450,475);
triangle(75,475,430,535,430,450);
triangle(80,525,377,540,420,450);
triangle(100,580,430,540,400,470);
triangle(150,650,430,540,400,470);
triangle(300,680,350,500,430,500);
triangle(400,700,350,500,450,500);
triangle(500,700,350,500,450,500);
triangle(575,650,400,500,450,500);
triangle(700,500,350,450,430,500);
triangle(700,560,350,500,480,500);
triangle(700,640,400,550,400,450);
triangle(600,300,350,500,480,500);
}
//centro do sol
colorMode(RGB);
fill(255,0,0,160);
ellipse(400,500,100,100);
}

