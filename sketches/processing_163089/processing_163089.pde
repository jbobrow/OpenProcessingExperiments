
float angle = 0;
int[] nums = {80, 100,150,200,300};

void setup(){
  size(1200, 600);
  smooth();
  noStroke();
  ellipseMode(CENTER);
}
 
void draw(){
  background(#211EFA);
  int r = int(random(5));
  fill(#FCF85E);
  ellipse(random(width), random(height), nums[r], nums[r]);
  
}
