
//Belgü UÇAR,060411029,GRAPHIC DESIGN,belguucar@windowslive.com

//Nebile SEÇKİN,050411032,GRAPHIC DESIGN,nebileseckin@hotmail.com

//Belde UÇAR,060411014,GRAPHIC DESIGN,beldeucar@hotmail.com




void setup(){
  
  smooth();
  
size(800,400);

   frameRate(3);
}


void draw(){
 
//I edited mouseY for changing backfont colour..

  background(mouseY); 

  
  
  

noStroke(); 
fill(random(189),random(234),random(12));
rect(650,300,40,40);


fill(random(12),random(162),random(234));
rect(610,300,40,40);
fill(random(219),random(12),random(234));
rect(650,260,40,40);
fill(random(250),random(247),random(182));
rect(650,220,40,40);
fill(random(1),random(24),random(144));
rect(610,260,40,40);
fill(random(110),random(125),random(206));
rect(610,220,40,40);
rect(570,300,40,40);
fill(random(245),random(27),random(96));
rect(570,260,40,40);
fill(random(247),random(239),random(145));
rect(570,220,40,40);
fill(random(54),random(67),random(90));
rect(570,180,40,40);
fill(random(245),random(149),random(47));
rect(610,180,40,40);
fill(random(54),random(67),random(90));
rect(650,180,40,40);
fill(random(233),random(240),random(148));
rect(530,300,40,40);
fill(random(245),random(247),random(217));
rect(530,260,40,40);
fill(random(18),random(4),random(108));
rect(530,220,40,40);
fill(random(45),random(173),random(250));
rect(530,180,40,40);

fill(255,153,0);

rect(490,300,40,40);
rect(470,300,40,40);

fill(255,108,228,50);
rect(510,220,20,40);

fill(250,84,58,40);
rect(510,180,20,40);

fill(2,15,62);
rect(490,220,20,40);

fill(239,240,121);
rect(490,180,20,40);

fill(252,172,10);
rect(490,140,20,40);

fill(247,143,30);
rect(470,220,20,40);
fill(189,30,247);
rect(460,180,30,40);
fill(14,5,103,40);
rect(650,80,40,100);



triangle(650,25,650,80,690,80);


fill(99,156,245,80);
ellipse(660,125,80,80);
ellipse(410,210,230,230);




fill(random(4),random(36),random(85),500);
ellipse(410,210,100,100);



frameRate(20);
fill(245,30,44);

//I wrote mouseX for moving horizontal

ellipse(mouseX,135,100,100);



strokeWeight(8); 
stroke(7,5,175);
line(0,135,730,135);
line(410,50,410,380);


strokeWeight(3); 
stroke(7,5,175);
line(290,50,290,250);

strokeWeight(3);
stroke(255);
line(530,180,530,380);






}


 

