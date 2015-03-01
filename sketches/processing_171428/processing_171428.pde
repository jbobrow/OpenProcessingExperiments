
size(600,300);
fill(#CCFFFF);
noStroke();
stroke( #CCFFFF );
fill(#CCFFFF);


rect(0,0,300,300);

strokeWeight( 3 );
noStroke();
stroke( #CCCCCC );
rect(1,1,298,298);
rect(1,1,280,280);
rect(1,1,260,260);
rect(1,1,240,240);
rect(1,1,220,220);
rect(1,1,200,200);
rect(1,1,180,180);
rect(1,1,145,145);
rect(1,1,100,100);//ひたすら四角
line(1,1,300,300);//ど真ん中の線


rect(100,100,150,150);

rect(50,50,100,20);


stroke( #CCFFFF );
noFill();
  
strokeWeight( 6 ); 
beginShape();
vertex( 450, 150 );  //(X,Y)
bezierVertex(550,50, 150, 250, 550, 250 );
bezierVertex( 400,290,590,290,460,30 );
//上の塊はベジエ曲線を描いています。最初の数字二つですたーと指定、二行目で
//カーブの曲がり具合、三行目で曲がる場所

endShape();

stroke( #008080 );
strokeWeight( 6 );
line(500,0,400,150);
line(400,150,550,100);//ジグザグ
line(550,100,600,267);
line(600,267,496,192);
line(496,192,496,300);

stroke( #FFFFFF );
strokeWeight( 4 );
line(300,150,470,280);
line(450,300,570,110);
line(600,120,320,100);
line(300,300,610,10);//ジグザグの２
line(310,0,400,310);
line(600,300,500,0);  



