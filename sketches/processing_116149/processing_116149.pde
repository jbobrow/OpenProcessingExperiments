
size(200,200);

 float a = random(0,120);
 int b = int(a);

 if( b < 40 ) {
    //円を描く
   ellipse( 100, 100, 100, 100 );
 } else if( b >= 40 && b <= 80){
    //四角形を描く
   rect( 50, 50, 100, 100 );
 } else {
   //三角形を描く
   triangle( 100, 50, 50, 150, 150, 150 );
 }
