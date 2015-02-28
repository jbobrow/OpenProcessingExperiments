
//Will Crownover, EMS II, Order vs. Disorder

//Variables
int r, c, space;
float color1, color2, s, frame, strokeW, tranRand, lt;

void setup(){
  size(500, 500);
  smooth();
  r=10;
  c=10;
  space=width/r;
}

void draw(){
  background(0, 200, 200 );
  color1=map(mouseX, 0, width, 0, 255);
  color2=map(mouseY, 0, height, 50, 255);
  s=map(mouseX, 0, width, 1, 3);
  frame=map(mouseX, 0, width, 5, 20);
  strokeW=map(mouseY, 0, height, 0, 15);
  frameRate(frame);
  tranRand=map(mouseX, 0, width, 0, width/4);
  for( int i=0; i<r; i++){
    for( int j=0; j<c; j++){
      pushMatrix();
      translate(random(tranRand), random(tranRand));
      fill(random(color1), random(color1), color2);
      strokeWeight(random(strokeW));
      stroke(random(color1), random(color1), color2);
      ellipse( i*space+width/(r*2), j*space+height/(c*2), space*random(1,s), space*random(1,s));
      popMatrix();
    }
  }
  lt=map(mouseX, 0, width, 0, width/2);
  for( int i=0; i<r; i++){
    for( int j=0; j<c; j++){
      strokeWeight(random(strokeW));
      stroke(random(color1), color2, random(color1), 100);
      line( i*space+width/(r*2), j*space+height/(c*2), mouseX-random(lt), mouseY-random(lt));
    }
  }
}
