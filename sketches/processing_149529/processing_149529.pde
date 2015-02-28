
int theShape = 0;
int theColor = 0;
color[] colors = { color(255,0,0), color(255,255,0), color(0,255,0), color(0,0,255) };


float R=125; 
float centerR=125; 
float a=PI/2; 
float a1=PI; 
float a2=3*PI/2; 
float pathR=125; 
float pathG=125; 
float G=125; 
float centerG=125; 
float pathB=125; 
float B=125; 
float centerB=125; 

void setup(){
  size(800,800);
  noStroke();
}

void draw(){
  background(0);
  fill( colors[theColor] );
  switch( theShape ){
    case 0:
    default:
     fill(0, 26, 51);
ellipse(400, 400, 500, 400);
//ears
ellipse(250, 200, 100, 100);
ellipse(550, 200, 100, 100);
fill (255);
ellipse(400, 400, 150, 130);
fill (0);
ellipse(400, 400, 50, 50); 
fill(0, 26, 51);
ellipse(300, 600, 50, 100);
ellipse(500, 600, 50, 100);
      break;
    case 1:
    fill(0, 26, 51);
ellipse(400, 400, 500, 400);
//ears
ellipse(250, 200, 100, 100);
ellipse(550, 200, 100, 100);
fill (255);
ellipse(400, 400, 150, 130);
fill (pathR,pathG,pathB);
pathR=centerR+R*sin(a); 
a=a+.03; 
pathG=centerG+G*sin(a1); 
a1=a1+.03; 
pathB=centerB+B*sin(a2); 
a2=a2+.03; 
ellipse(400, 400, 50, 50); 
fill(0, 26, 51);
ellipse(300, 600, 50, 100);
ellipse(500, 600, 50, 100);  
      break;
    case 2:
      beginShape();
//face
noStroke();
fill(0, 26, 51);
ellipse(400, 400, 500, 400);
//ears
ellipse(250, 200, 100, 100);
ellipse(550, 200, 100, 100);
fill (255);
ellipse(400, 400, 150, 130);
fill (0);
ellipse(400, 400, 50, 50); 
fill(255,2,0);
ellipse(250, 420, 90, 90);
ellipse(549, 420, 90, 90);
fill(0, 26, 51);
ellipse(300, 600, 50, 100);
ellipse(500, 600, 50, 100);

      endShape();
      break;
    case 3:
      beginShape();
//face
noStroke();
fill(0, 26, 51);
ellipse(400, 400, 500, 400);
//ears
ellipse(250, 200, 100, 100);
ellipse(550, 200, 100, 100);
fill (255);
ellipse(400, 400, 150, 130);
fill (0);
ellipse(400, 400, 50, 50); 
fill(0, 26, 51);
ellipse(300, 600, 50, 100);
ellipse(500, 600, 50, 100);
stroke(255);
arc(400, 550, 60, 60, -PI, 0); 
      break;
  }
}  
  
  void keyPressed(){
    if( key==CODED ){
     if( keyCode == UP ){ theShape=(theShape+1)%4; }
     if( keyCode == DOWN ){ theShape=(theShape+3)%4; }
     if( keyCode == LEFT ){ theColor=(theColor+1)%4; }
     if( keyCode == RIGHT ){ theColor=(theColor+3)%4; }
    }
  }



