
size(400,400);
smooth();
  
  
float x = width * 0.5;
float y = height * 0.5;
 
noStroke();

float d = width;
float difference = 20;

while ( d > 5 ) {
   fill ( d / width * 255 );
   ellipse( x , y , d , d );
   d = d - difference;
}



