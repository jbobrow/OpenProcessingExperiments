
size(600,300);

background(0);

for( int i=0; i<=300; i+=10) {
  
  //安定
  stroke(20,50+i,200+i);
  strokeWeight(3);
  line(i,0,i,300);
  line(0,i,300,i);
  
  stroke(30,40,120,20);
  fill(30,50,120,25);
  
  rect(180,10,100,100);
  rect(24,33,60,60);
  rect(10,100,100,100);
  rect(157,149,90,90);
  rect(230,217,65,65);
  stroke(30,100,230,20);
  fill(30,80,230,20);
  rect(23,213,120,120);
  rect(60,0,100,100);
  rect(100,100,150,150);
  rect(0,10,50,50);
  }
  
  //流動
  
   for(int i = 0; i < 100; i++){
     strokeWeight(2);
  stroke(random(50), random(100), random(150));
  line(random(300,600), random(height), random(300,600), random(height));
}
  

    
  noStroke();  //水色
  fill(75,226,250,150); 
  ellipse(500, 240, 70, 70);
  ellipse(550, 35, 60, 60); 
  ellipse(600,0,50,50);
  ellipse(500, 140, 130, 130);
  ellipse(450,70,80,80);
  ellipse(420, 150, 130, 130);
  ellipse(500,270,90,90);
  ellipse(540,70,80,80);
  
  noStroke();  //青
  fill(9,79,255,150);
  ellipse(560,280,60,60);
  ellipse(400, 250, 180, 180); 
  ellipse(450,150,110,110);
  ellipse(550,150,60,60);
  ellipse(560,100,70,70);
  ellipse(580,0,40,40);
  
    noStroke(); //薄緑
  fill(134,255,188,120);
  ellipse(580, 30, 50, 50); 
  ellipse(370,130,120,120);
  ellipse(520, 220, 110, 110);
  ellipse(500, 50, 80, 80);
  
   for( int x=0; x<=300; x+=20) {
    for( int y=0; y<=300; y+=2) {
          
  stroke(20,y,200+x);
  strokeWeight(2);
  line(300,0+y,300+y,300);
  }}
  
  



 


  
      


