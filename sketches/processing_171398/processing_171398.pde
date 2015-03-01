
size(600,300);
background(255);

for (int y = 0; y <= 600; y += 20) { 

for (int x = 0; x <= 600; x += 20) { 


fill(y,x,200,100);
stroke(0);
strokeWeight(1);
rect(300,0,600,300);
strokeWeight(2);
rect(320,20,580,300);
strokeWeight(3);
rect(340,40,560,300);
strokeWeight(4);
rect(360,60,540,300);
strokeWeight(5);
rect(380,80,520,300);
strokeWeight(6);
rect(400,100,500,300);
strokeWeight(7);
rect(420,120,480,300);
strokeWeight(8);
rect(440,140,460,300);
strokeWeight(9);
rect(460,160,440,300);
strokeWeight(10);
rect(480,180,420,300);
strokeWeight(11);
rect(500,200,400,300);
strokeWeight(12);
rect(520,220,380,300);
strokeWeight(13);
rect(540,240,360,300);
strokeWeight(14);
rect(560,260,340,300);
strokeWeight(15);
rect(580,280,320,300);
strokeWeight(16);
rect(600,300,300,300);

}
}

//変動
strokeWeight(2);
rectMode( CENTER );
 
for( int i = 0; i < 9; i++ ) {
  for( int j = 0; j < 9; j++ ) {
     
    if( i % 2 == 0 ) {
      ellipse( 30 + j * 30, 30 + i * 50, 25, 25 );
    } else {
      rect( 30 + j * 30, 30 + i * 50, 25, 25 );
    }
 
  }
}
//安定




