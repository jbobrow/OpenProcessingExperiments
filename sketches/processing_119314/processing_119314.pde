
void setup() {
  size(500,500);
  textSize(100);
  text("Click me!",width/2-textWidth("Click me!")/2,height/3);
  textSize(40);
  text("(Where you click matters)",width/2-textWidth("(Where you click matters)")/2,height/2);
}
void draw() {}

  float threshold = 0.5;//how small can branches get, gets smaller when you click higher
  float spread = 60;//how much branches can spread outside from parent branches, gets smaller if you click more to the left
  float branchlessHeight = 0.2;//branchless height determines how long a branch blocks branching
  float branchHeight = 1;//default height for branch
  float branchChance = 0.5; //1 = guranteed 2 branches, 0 = carry on main branch forever (do not attempt 0, its infinite recursion!)
  float startPower = 50; //determines how much "energy" the first branch gets, only branching consumes power
  
void mouseClicked() {
  int seed = int(random(20000));
  randomSeed(seed); 
  spread = 5 + (mouseX*1.0/width) * 180;//*1.0 forces float
  branchChance = 0.05 + (mouseY * 1.0/height) * 1;
  startPower = branchChance *180;
  background(200,210,230);
  drawNode(width/2,height, startPower + random(startPower/2),random(50)-25); 
  fill(50); 
  textSize(10); 
  text("randomSeed: " + seed,0,height - 40);
  text("branchChance: " + branchChance,0,height - 30);
  text("startPower: " + startPower + " (influenced by branchChance)",0,height - 20);
  text("spread: " + spread,0,height - 10);
  textSize(20);
  text("Where to click:",0,20);
  textSize(15);
  text("→more spread(less straight)", 0,35);
  text("↓more branchChance(less flimsy)",0,50);
  
}

void mouseMoved() {
 
}


void drawNode(float x, float y,float s, float ang) {
  if (s < threshold) return;//prevents micro-branches
  ang = ang + 270;
  ang = ang*3.14159265359/180;
  float tx = x + s * cos(ang);
  float ty = y + s * sin(ang); 
  float powerLeft = s;//power gets split up between child branches
  float branchPower;

  if (random(1) < branchChance) {    //chance to generate this branch, else keep the power
    branchHeight = branchlessHeight + random(1-branchlessHeight);
    branchPower = s/(1+random(3));
    drawNode(lerp(x,tx,branchHeight),lerp(y,ty,branchHeight),branchPower, ang + random(spread)); //branch 1,right
    
    powerLeft -= branchPower;
  }
  if (random(1) < branchChance) {    //chance to generate this branch, else keep the power
    branchHeight = branchlessHeight + random(1-branchlessHeight);
    branchPower = min(s/(1+random(3)), powerLeft);//ensures we don't create power
    drawNode(lerp(x,tx,branchHeight),lerp(y,ty,branchHeight),s/(1+random(1)), ang - random(spread)); //branch 2, left
    
    powerLeft -= branchPower;
  }
  //if we have power left, we continue the branch with a bit of a curve to it
  if (powerLeft > threshold) {
    drawNode(tx,ty,powerLeft,ang + random(spread/2) - spread/4);//less of an angle change than a seperate branch  
  }
  
  if (s > threshold * 1.5) {
    stroke(color(50*s/255,25*s/255,15*s/255));
    strokeWeight(s/10);
  }
  else 
  {
    stroke(color(15+random(15),40+random(40),10+random(5)));
    strokeWeight(s*5);
  }
  line(x,y,tx,ty);
}
