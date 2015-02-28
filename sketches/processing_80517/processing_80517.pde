
void setup(){
  size(500,500);
  background(76,14,134);
}

void draw(){
  fill(63,19,103);
  triangle(0,200,0,500,500,500);
  strokeWeight(5);
  
  fill(101,25,167);
   noStroke();
  triangle(500,250,500,500,250,350);
 
  
  fill(135,61,201);
  triangle(100,258,250,350,350,305);
 noStroke();
  
  fill(83,7,111);
   noStroke();
  triangle(0,200,250,350,0,350);
  
  fill(203,119,29);
   noStroke();
  quad(500,500,500,450,250,350,230,350);
  
  fill(190,110,20);
   noStroke();
  quad(230,350,250,350,350,305,360,305);
  


  fill(random(100),random(100),random(100),random(100));
  noStroke();
  rect(0,0,50,50);
  rect(50,100,50,50);
  rect(100,50,50,50);
  rect(150,150,50,50);
  rect(100,100,50,50);
  rect(50,50,50,50);
  rect(100,150,50,50);
  rect(0,50,50,150);
  rect(50,0,50,50);
  rect(100,0,50,50);
  rect(150,0,50,50);
  rect(200,0,50,50);
  rect(250,0,50,50);
  rect(300,0,50,50);
  rect(350,0,50,50);
  rect(400,0,50,50);
  rect(450,0,50,50);
  rect(150,50,50,50);
  rect(200,50,50,50);
  rect(250,50,50,50);
  rect(300,50,50,50);
  rect(350,50,50,50);
  rect(400,50,50,50);
  rect(450,50,50,50);
  rect(150,100,50,50);
  rect(200,100,50,50);
  rect(250,100,50,50);
  rect(300,100,50,50);
  rect(350,100,50,50);
  rect(400,100,50,50);
  rect(450,100,50,50);
  rect(50,150,50,50);
  rect(200,150,50,50);
  rect(250,150,50,50);
  rect(300,150,50,50);
  rect(350,150,50,50);
  rect(400,150,50,50);
  rect(450,150,50,50);
  rect(100,200,50,50);
  rect(150,200,50,50);
  rect(200,200,50,50);
  rect(250,200,50,50);
  rect(300,200,50,50);
  rect(350,200,50,50);
  rect(400,200,50,50);
  rect(450,200,50,50);
  
  stroke(0);
  strokeWeight(1);
  line(0,500,230,350);
  line(0,450,230,350);
  line(0,400,230,350);
  line(50,500,230,350);
  line(100,500,230,350);
  line(150,500,230,350);
  line(200,500,230,350);
  line(250,500,230,350);
  line(300,500,230,350);
  line(350,500,230,350);
  line(400,500,230,350);
  line(450,500,230,350);
  line(0,350,230,350);
  line(0,375,230,350);
  
  line(100,258,mouseX,mouseY);
  line(120,260,mouseX,mouseY);
  line(350,305,mouseX,mouseY);
  line(0,200,mouseX,mouseY);
  line(10,210,mouseX,mouseY);
  line(20,220,mouseX,mouseY);
  line(30,230,mouseX,mouseY);
  line(40,240,mouseX,mouseY);
  line(50,250,mouseX,mouseY);
  line(60,260,mouseX,mouseY);
  line(70,270,mouseX,mouseY);
  line(80,280,mouseX,mouseY);
  line(90,290,mouseX,mouseY);
  line(100,300,mouseX,mouseY);
  line(110,310,mouseX,mouseY);
  line(130,320,mouseX,mouseY);
  line(140,330,mouseX,mouseY);
  line(150,340,mouseX,mouseY);
  line(160,350,mouseX,mouseY);
  line(170,360,mouseX,mouseY);
  line(180,370,mouseX,mouseY);
  line(190,380,mouseX,mouseY);
  line(200,390,mouseX,mouseY);
  line(210,400,mouseX,mouseY);
  line(220,410,mouseX,mouseY);
  line(230,420,mouseX,mouseY);
  line(240,430,mouseX,mouseY);
  line(250,440,mouseX,mouseY);
  line(260,450,mouseX,mouseY);
  line(270,460,mouseX,mouseY);
  line(280,470,mouseX,mouseY);
  line(290,480,mouseX,mouseY);
  line(300,490,mouseX,mouseY);
  line(310,500,mouseX,mouseY);
  line(0,200,310,500);
  
  
  
 noStroke();  
triangle(0,200,100,200,100,250);
triangle(100,250,500,250,350,300);

fill(219,206,84);
rect(350,275,3,30);
ellipse(350,275,30,20);
rect(340,275,3,30);
rect(345,275,3,30);
rect(355,275,3,28);
ellipse(348,273,30,20);
fill(219,186,84);
ellipse(345,278,30,20);
ellipse(340,278,30,20);
rect(350,275,3,30);
rect(335,285,3,20);
rect(328,283,3,20);
ellipse(330,279,30,20);
ellipse(360,279,30,20);
rect(370,285,3,14);
rect(365,285,3,16);
ellipse(375,285,20,10);



  
  
}


void mousePressed(){saveFrame("img###.jpg");
}


