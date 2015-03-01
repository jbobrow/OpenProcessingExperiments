
//respiro//
float num = 0;
float bi = random(-1, 1);
float theta;

void setup(){
 size(940, 640);
 background(0);
 stroke(255,50);
 fill(255, 50);

}


void draw(){
  translate(width/2.1, height/2.1);
  translate( cos(num/99)*width/2, sin(num/97)*height/2); 
  rotate(radians(num));
  fill( 0, 5 ); rect( 0,0, width,height ); fill( 255, 50 );
  for(int i = 0; i < 150; i+=20){

 float x = sin(radians(i+frameCount))*num;
 float y =sin(radians(num)) /frameCount+num;
    
 ellipse(x, y, 1, 1);
 ellipse(y, x, 1, 1);
 ellipse(x, y, 1, 5);
 line(y, x, 1, 2);
 
}
 
  num +=bi;

}

void mouseReleased() {
num = random(360);
bi = random(-1, 1);
background(0);
}

