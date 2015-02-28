
float dim;
void setup() {
  size(500,400);
  background(255,255,255);
  fill(0,255,255);
  dim= 1;
}
  
void draw() {
    noStroke();
    translate(width/2,height/2);
    rotate(radians(frameCount%360));
    //rotate(radians(30));
    //translate(frameCount%30,frameCount%30);
    scale(dim);
    dim = dim *0.9999;
    if (dim<.01) dim=1;
    fill((frameCount/25+254)%255,((frameCount/10)+55%200),(frameCount/5%255));
    ellipse(99-(frameCount/750),0,(100-(frameCount/10000)),(100-(frameCount/10000)));
  
}


