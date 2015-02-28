

float x,y;
void setup(){

size(600,600);
smooth();
strokeWeight(3);
textSize(35);   //sige pont size
x=width/2;
y=height/2;
}
  
void draw(){
background(125, 26, 26);
drawclock();
}

 
void drawclock(){
  fill(200,205,158);          //sige col.or   rgbx2.3
   ellipse(x,y,530,530);
  ellipse(x,y,500,500);
  ellipse(x,y,300,300);
 

  drawNumbers();
  
  



  if( mousePressed ){
    background( 0 );
  }


   
  float d = dist( pmouseX, pmouseY, mouseX, mouseY );
  if( d < 3 ){
    return;
  }
   
  float x1 = ( pmouseX + mouseX ) / 2;
  float y1 = ( pmouseY + mouseY ) / 2;
   
  d /= 2;
   
  for( int i = 0 ; i < int(d); i++ ){
    float xx = x1 + random( -d, d );
    float yy = y1 + random( -d, d );
    fill( random(0.95, 1 ), random( 0.5, 1 ), random(0.5, 1 ) );
    float s = random( 1, d/3 ) * 2;
     
    ellipse( xx, yy, s, s );



  }


   if (mousePressed) {
    fill(random(700), random(255), random(255), random(255)); 
    ellipse(X, Y, 2000, 2000);
  }
 
float s_angle=map(second(),0,60,0,TWO_PI);
pushMatrix();
translate(x,y);
rotate(s_angle);
stroke(3); //banel col.or
line(0,0,0,-200);
popMatrix();
float M_angle=map(minute(),0,60,0,TWO_PI);
pushMatrix();
translate(x,y);
rotate(M_angle);
stroke(100,61,61); //banel col.or
line(0,0,0,-100);
popMatrix();
float h_angle=map(hour(),0,60,0,TWO_PI);
pushMatrix();
translate(x,y);
rotate(h_angle);
stroke(255,30,100); // banel col.or (back)
line(0,0,0,-150);
popMatrix();
}
void drawNumbers(){
  float r=190;
  float inc=TWO_PI/12;
  for (int i=1; i<=12; i++){
    float xn=x+cos (i*inc-HALF_PI)*r;
    float yn= y+sin(i*inc-HALF_PI)*r;
    fill(0);
    text(i,xn,yn);
    

   
  }}

  
