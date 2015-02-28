
void setup() {
    size(1000,1000);
    background(100);
    textSize(100);
    text("Click me!",width/2-textWidth("Click me!")/2,height/3);
}

void mouseClicked() {
  int seed = int(random(20000));
  randomSeed(seed);
  
  background(100);
  drawNode(width/2,height,500);  
  fill(255);  
  textSize(20);
  text("randomSeed: " + seed,0,height - 30);
}

void drawNode (float x,float y,float s) {//s controls the significance of the node
  if (s < 10) return;
  float tx, ty; //tx and ty are the coordinates of the branch end point
  tx = x + random(s*1.5) - s/2*1.5;//controls branch left/right
  ty = y - s/10 - random(s/3);//controls branch height
  strokeWeight(s/10);//controls branch thickness /significance
  stroke(88,53,28,2*s+30);//the more important, the more alpha
  line(x,y,tx,ty);//draw branch
  strokeWeight(1);
  stroke(50,100);
  line(x,y,tx,ty);//draw black support line
  fill(0,150);
  ellipse(tx,ty,s/10,s/10);//draw target node point
  for(int i = int(random(3.1)) + 1;i>0;i--)
    drawNode(tx,ty,s/(1+random(1)));//the power of recursion
}
