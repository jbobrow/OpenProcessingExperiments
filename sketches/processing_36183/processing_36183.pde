
void setup(){
  size(500,900);
  background(00,00,00);
}
void draw(){
  smooth();
  //hat
  fill(100,100,100);
  strokeWeight(0);

  triangle (24,260,320,209, 105,160);
  
 
  //face
  fill(240,196,197);
  stroke(240,196,197);
  quad(100,300,100,415,350,400,345,300);
  quad(100,415,100,470,350,460,345,395);
  quad(105,465,105,510,325,500,320,450);
  ellipse(300,475,100,100);
  fill(00,00,00);
  stroke(00,00,00);
  ellipse (385,428,95,95);

//scarf
fill(90,90,90);
quad(280,625,290,620,300,575,260,575);

//face
    fill(240,196,197);
  stroke(240,196,197);
    ellipse(300,475,100,100);
    ellipse(238,549,150,100);
    quad(320,485,280,560,303,576,340,505);
    ellipse(180,520,150,100);
     triangle(20,400,100,550,100,250);
    fill(00,00,00);
  stroke(00,00,00);
  ellipse (145,680,200,200); 
  
  stroke(240,196,197);
  strokeWeight(20);
  line(140,552, 215, 588);
  
  
     //scarf
noStroke();
fill(100,100,100);
quad(100,550,70,600,250,650,270,630);


  //hair
  fill(90,2F,20);
  quad(40,315, 70,440,100,415,120,275);
  quad(100,300,350,340,375,300,300,230);
  triangle(20,400,40,480,60,300);
  //hat
  strokeWeight(2);
  stroke(00,00,00);
  fill(100,100,100);
  quad(24,260,18,400,80,340,80,235);
  quad(80,235,80,340,280, 250, 279, 200);
  quad(279,200, 280, 250, 310, 250, 315, 210);
  triangle(315,210,310, 250, 330,260);
  //eyebrows
  stroke(90, 2F, 20);
  strokeWeight(10);
  noFill();
 
  line(180,385,250,375);
    strokeWeight(8);
  line(300,385,340,385);
    fill(00,00,00);
  stroke(00,00,00);
  
  //eyes
    stroke(00,00,00);
  strokeWeight(3);
  noFill();
  arc(215,405,80,40,PI/7,PI-PI/3);
  strokeWeight(2);
  arc(321,398,70,50,PI/2.5,PI-PI/3);
fill(255,255,255); 
   ellipse(217,412,60,25);
   ellipse(318,412,35,20);
   fill(00,00,00);
   ellipse(220,412,12,12);
   ellipse(318,412,7,7);
  //eyebottom
  noFill();
  strokeWeight(9);
   arc(215,415,80,40,PI+PI/4, TWO_PI-PI/5);
   strokeWeight(7);
  arc(320,425,70,50,PI+PI/3, TWO_PI-PI/3);
    fill(00,00,00);
  stroke(00,00,00);
 
 //nose
 strokeWeight(5);
 noFill();
 arc(280,465,60,40,0-PI/3, PI/3);
 strokeWeight(4);
  arc(280,470,50,30,PI/2, PI+PI/9);
 line(295,430,290,395);
fill(00,00,00);
ellipse(280,482,20, 10);
 
 //ear
 fill(240,196,197);
 arc(50,430,40,80,0+PI/3, PI+PI/2+PI/2);
 
 //lips
 fill(10,10,10);
 stroke(100,50,50);
  arc(280,525,70,50,0, PI);
   arc(280,527,70,10,PI-PI/9, TWO_PI);



}


