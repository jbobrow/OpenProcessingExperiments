
void setup (){
  size(600,600);
  smooth();
  frameRate(10);
 
}

void draw (){
  background(255);
  for (int x = 30; x < width -80; x += 30){
    for ( int y = 10; y < height - 80; y += 30){
      stroke(random(0,255));
    fill(random (0,255),200);
    star ( x, y );
  }
  }
}
  
void star (int x, int y){
pushMatrix(); 
translate(x,y);
beginShape ();
vertex (30,30);
vertex (35,50);
vertex(55,55);
vertex (35,60);
vertex (30,80);
vertex(25,60);
vertex (5,55);
vertex(25,50);
endShape (CLOSE);
popMatrix();

}



