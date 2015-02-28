
int x, y;
int R, G, B;
void setup() { 
  size(250, 250);
  background(255); 
  colorMode(RGB);
  x=width/2;
  y=height/2;
  R=random(255);
  G=random(255);
  B=random(255);
   
  
}

void draw() {
  R=R+random(-1,1);
  G=G+random(-1,1);
  B=B+random(-1,1);
  constrain(R,0,255);
  constrain(G,0,255);
  constrain(B,0,255);
  constrain(x,0,width);
  constrain(y,0,height);
  stroke(R,G,B);
  fill(R,G,B);
  
  if(mousePressed == true) {
    point(mouseX+random(-20,20), mouseY+random(-20,20));
  }
  else{
  
  x=x+random(-5,5);
  y=y+random(-5,5);
  ellipse(x,y,20,20); //ellipse that moves around the screen, eventually the color changing will be affected to be more subtle
                
  }
}
                
           
