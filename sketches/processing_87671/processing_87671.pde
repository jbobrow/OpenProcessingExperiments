
size(400,400);
background(188);
 
for ( int w =132; w<=120; w=w+9)
{
  line (w , 150, w, 480 );
}
 
for ( int w =0; w<=43; w=w+3)
{
  line (w , 120, -w, -32 );
}
 
noFill();
stroke(3);
for ( int f = 78; f> 0; f -= 123){
  ellipse( 90,65, f, f );
}
 
noFill();
stroke(22);
for ( int f = 250; f> 0; f -= 10){
  ellipse( 43,62, f, f );
}
 
 
noFill();
stroke(210);
for ( int f = 450; f> 0; f -= 12){
  ellipse( 200, 200, f, f );
}
 
 
noFill();
stroke(0);
for ( int f = 150; f> 0; f -= 9){
  ellipse( 280, 280, f, f );
}
noFill();
stroke(0);
for ( int f = 43; f> 3; f -=90){
  ellipse( 12, 1, f, f );
}
 
noFill();
stroke(210);
for ( int f = 54; f> 0; f -= 123){
  ellipse( 300, 300, f, f );
}
 
noFill();
stroke(4);
for ( int f = 150;f> 0; f -= 10){
  ellipse( 80,80, f, f );
}
 
 
noFill();
stroke(210);
for ( int f = 400; f> 0; f -= 12){
  ellipse( 300, 300,f, f );
}
 
noFill();
stroke(214,189,0);
for ( int f = 21; f> 0; f -= 173){
  ellipse( 400, 30, f, f );
}
 
noFill();
stroke(150);
for ( int f = 300; f> 0; f -= 10){
  ellipse( 200, 200, f, f );
}
 
 
noFill();
stroke(255);
for ( int f = 300; f> 0; f -= 10){
  ellipse( 100, 100, f, f );
}
noFill();
stroke(0);
for ( int f = 400; f> 100; f -= 10){
  ellipse( -0, 400, f, f );
}
noFill();
stroke(0);
for ( int f = 20; f> 1; f -= 40){
  ellipse( -12, 32, f, f );
}




