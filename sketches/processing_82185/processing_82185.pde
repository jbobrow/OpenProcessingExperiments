
PVector pos[];
PVector dir[];
PShape s;
int[] age;
PImage img;

void setup()
{
   size(600, 400);
  smooth();
  noStroke();
  pos = new PVector[30];
  dir = new PVector[30];
  age = new int[30];
  img = loadImage("pic6.jpg");
  s = loadShape("heart.svg");
  
  for( int i=0; i<30; i++) {
    pos[i]=new PVector(250,175);
    PVector v = new PVector( random(width)-250, random(height)-175);
    v.normalize();
    dir[i] = v;
    age[i] = -(int)random( 100 );
  
}
}

void draw() {
      background(img);
  noFill();
  
  for( int i=0; i<30; i++) {

    if ( age[i] > 0 ) {
     stroke(255,0,0, 255-age[i]*2); 
     fill(100,0,0, 255-age[i]*2);



      shape( s, pos[i].x, pos[i].y, sqrt(age[i])*2, sqrt(age[i])*2);
      pos[i].add(dir[i]);
    }
    
   
   
    age[i]++;
    if ( age[i] > 100 ) {
      age[i] = 0;
      pos[i] = new PVector(250,190);
      PVector v = new PVector( random(width)-250, random(height)-175);
      v.normalize();
      dir[i] = v;
     
    }
    
  }  

}


