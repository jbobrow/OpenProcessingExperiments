
 
 
void setup(){
  size (400,400);
}


void draw(){
 translate (200,200);
 whale(0,0,120, 0,255);
}





void whale(int whaleX, int whaleY, int whaleSize, int eyeColor, int whaleColor ){
 
 noStroke();
 smooth();
 
 fill(whaleColor);
 arc(whaleX,whaleY,whaleSize, whaleSize, PI, TWO_PI-PI/2);
 arc(whaleX,whaleY, whaleSize, whaleSize, TWO_PI-PI/2, TWO_PI);
 arc(whaleX+90, whaleY, whaleSize/2, whaleSize/2, PI, TWO_PI-PI/2);
 
 fill(eyeColor);
 ellipse (whaleX-30,whaleY-30,5,5);

}

