


size(400,565);

background(255);

//usirono amisenn
for(int x=0; x<=400; x+=5) {
for(int y=0; y<=565; y+=5) {  
if(x >=200 && x <=250 && y <=340 || y >=200 && y <=250){ 
 fill(220); 
  stroke(10);
rect(x, y, 50, 50);
 }
}
}

//hidariue syasenn
stroke(130);
strokeWeight(180);     
line(-100, 210, 210,-100);

//migisita syasenn
stroke(130);
strokeWeight(180);     
line(-100, 775, 610,365);





//hidariue ennhutatu
noStroke();
fill(220);
ellipse(75, 75, 130, 130);
noStroke();
fill(10);
ellipse(85, 85, 80, 80); 

//tyuuouhidari akaseihoukei
rectMode(CENTER);
fill(255,20,20);
rect(140, 240, 150, 150);

//tyuuou syasenn 3bon
stroke(130);     
strokeWeight(80);     
line(100, 443, 300, 200);
stroke(250,120,120);     
strokeWeight(40);     
line(15, 443, 215, 200);
stroke(250,120,120);     
strokeWeight(40);     
line(185, 443, 385, 200);

//tyuouzyouge tyouhoukei
rectMode(CENTER);
stroke(220);
rect(80, 443, 350, 60);
rectMode(CENTER);
noStroke();
fill(220);
rect(275, 190, 300, 150);

//ue sikaku2tsu
noStroke();
rectMode(CENTER);
fill(255,20,20);
rect(245, 152, 150, 150);
rectMode(CENTER);
fill(255,20,20);
rect(320, 503, 350, 20);

//gizagizasenn 4honn
int eSize = 10;
int i=0;

while(i < 400) {  
fill(170,50,50);
rect(i,i+75,eSize,eSize);
rect(i,i+325,eSize,eSize);
rect(i,i+480,eSize,eSize);
fill(0);
rect(i,i+400,eSize,eSize);
 i = i + 5;
}


//hosoisenn 4honn
stroke(10);     
strokeWeight(3);     
line(0, 150, 290, 230);
stroke(10);     
strokeWeight(3);     
line(0, 360, 290, 270);
stroke(10);     
strokeWeight(3);     
line(300, 0, 180, 390);

//suityokusenn 4honn
stroke(10);     
strokeWeight(15);     
line(100, 565, 100, 65);
noStroke();
rectMode(CENTER);
fill(0);
rect(385, 280, 10, 600);
rectMode(CENTER);
fill(255);
rect(365, 280, 10, 600);
rectMode(CENTER);
fill(0);
rect(345, 280, 10, 600);








