
size( 400, 565 );
background( 220, 190, 110 );
colorMode( RGB, 256 );


int eSize = 3; //背景 黄土 点の連続
smooth( 10 );         
 
fill( 226, 199, 130 );
strokeWeight( 50 );
stroke( 219, 187, 110 );

for(int y = 1; y <= height; y +=10 ){
  for(int x = 1; x <= width; x += 10 ){
    ellipse( x, y, eSize, eSize );
  }
}


int box_size = 20;

for(int i = box_size;i < 1680 - box_size;i += box_size*2 ) {
  for(int j = box_size;j < 1050- box_size; j += box_size*2 ) {
  } 
} 

stroke( 255, 0, 0 );　//上部線赤
strokeWeight( 1 );
line( 200, 0, 900, 400 );

stroke( 255 );　//上部線白
strokeWeight( 3 );
line( 0, 0, 600, 500 );


stroke( 0 );　　//白丸大
strokeWeight( 3 );
fill( 255, 255, 255 );
ellipse( 200, 600, 1100, 750);


fill( 255, 0, 0 );　　//赤丸大
strokeWeight( 1 );
stroke( 0 );
ellipse( 200, 600, 1000, 600 );


stroke( 0 );　　//下部白丸
fill( 255, 255, 255 );
ellipse(124, 484, 100, 100 );


stroke( 255 );　　//下部白丸　枠線のみ
noFill(); 
ellipse( 230, 600, 250, 400 );


fill( 0 );　　//下部黒丸
strokeWeight( 5 );
ellipse( 350, 580, 200, 200 );


fill( 255, 255, 0 );　　//下部黄丸
ellipse( 350, 580, 140, 140 );


stroke( 0 );　　//黒三角長
fill( 0 );
triangle( 90, 484, 300, 50, 150, 500 );


fill( 0 );　　//黒三角短
triangle( 90, 484, 250, 350, 150, 500 );


fill( 200,200,200 );　　//灰丸
strokeWeight( 10 );
ellipse( 124,484,70,70 );


fill( 255, 255, 255 );　　//中央白楕円
strokeWeight( 1 );
rotate( PI/8 ); 
ellipse( 300, 400, 20,35 );


fill( 255 );　　//白三角小
triangle( 180, 50, 180, 20, 200, 20 );


fill( 255, 0, 0 );　　//赤三角小
triangle( 200, 20, 180, 80, 180, 50 );


fill( 200 );　　//灰三角小
rotate( PI/15 ); 
triangle( 120, 50, 120, 80, 130, 50 );




