
int loopc=0;
void setup(){
  size(500, 500);
  smooth();
  frameRate(15);
}

//need to get background to go from 
//    black(0, 0, 0) 
// to pink (190, 50, 204)
// to blue (0, 4, 204)
// to orange(237, 97, 0)
// to black (0, 0, 0)
  float re=2 ; //red change for background
  float g=2; //green change for background
  float b=0; //blue change for background
void draw(){
  int ro=(loopc+=10)/20; //rotation speed

//rotate matrix
  pushMatrix();
  translate(250,250);
  rotate(radians(ro));

  if(loopc<350){
    re=round(re+=4);
    g=round(g+=1);
    b=round(b+=4);
  } else if(loopc>350 &&loopc<1200){
      re=round(re-1);
      g=round(g-=1);
      b=round(204);
  }else if (loopc>1200 &&loopc<1800){
    re=round(re+=2.3);
    g=round(g+=2);
    b=round(b-=1);
} else if (loopc>1800){
    re=round(re-=1);
    g=round(g-=1);
    b=round(b-=1);
}
  background(re, g, b);
  //sun with rays
  noStroke();
  fill(255, 243, 24);
  rect(0, 0, -10, 200);
  rect(0, 0, 200, 10);
  rect(0, 0, -200, -10);
  rect(0, 0, 10, -200);
  ellipse(0, 0, 100, 100);
  
  
  popMatrix();

}

                
                
