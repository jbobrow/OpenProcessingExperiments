
size(500,500);
background(236, 0, 140);

for ( int i =0; i<=500; i=i+2)
{
  line (i , 50, i, 480 ); 
}

for ( int i =0; i<=500; i=i+3)
{
  line (i , 50, -i, -500 ); 
}
// position  10 ellipse in 800 by 200// 800 devided bt 10//



noFill();
stroke(1);
for ( int d = 150; d> 0; d -= 10){
  ellipse( 50,50, d, d );
} 

noFill();
stroke(150);
for ( int d = 250; d> 0; d -= 10){
  ellipse( 100,100, d, d );
} 



noFill();
stroke(0);
for ( int d = 500; d> 100; d -= 10){
  ellipse( 400, -60, d, d );
} 


noFill();
stroke(210);
for ( int d = 450; d> 0; d -= 12){
  ellipse( 200, 200, d, d );
} 


noFill();
stroke(0);
for ( int d = 150; d> 0; d -= 9){
  ellipse( 280, 280, d, d );
}
noFill();
stroke(0);
for ( int d = 500; d> 100; d -= 10){
  ellipse( 400, 400, d, d );
} 

noFill();
stroke(210);
for ( int d = 600; d> 0; d -= 12){
  ellipse( 300, 300, d, d );
} 

noFill();
stroke(4);
for ( int d = 150; d> 0; d -= 10){
  ellipse( 80,80, d, d );
}


noFill();
stroke(210);
for ( int d = 400; d> 0; d -= 12){
  ellipse( 300, 300, d, d );
} 

noFill();
stroke(236, 0, 140, 210);
for ( int d = 300; d> 0; d -= 12){
  ellipse( 300, 300, d, d );
} 

noFill();
stroke(255);
for ( int d = 300; d> 0; d -= 10){
  ellipse( 200, 200, d, d );
} 


noFill();
stroke(236, 0, 140, 210);
for ( int d = 300; d> 0; d -= 10){
  ellipse( 100, 100, d, d );
} 
noFill();
stroke(236, 0, 140, 210);
for ( int d = 400; d> 100; d -= 10){
  ellipse( -0, 400, d, d );
} 

