
int theShape = 0;
int theColor = 0;
color[] colors = { color(255,0,0), color(255,17,0), color(0,200,0), color(0,0,255) };
void setup(){
  size(200,200);
  noStroke();
}

void draw(){
  background(0);
  fill( colors[theColor] );
  switch( theShape ){
    case 0:
    default:
      ellipse(100,100,160,160);
      fill(255);
      ellipse(100,100,50,50);
      break;
    case 1:
      rect(20,20,160,160);
      fill(0,200,0);
      rect(20,20,30,30);
      break;
    case 2:
      beginShape(TRIANGLES);
      vertex(100, 20);
      vertex(20, 180);
      vertex(180, 180);
      endShape();
      break;
    case 3:
      fill(255);
      rect(20,30,160,20);
      rect(90,20,20,160);
      rect(20,90,160,20);
       rect(20,150,160,20);
   
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



