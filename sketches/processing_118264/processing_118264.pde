
float angle = 0;
int[] nums = {5,15,25,50,150,250};

void setup(){
  size(720, 480);
  smooth();
  noStroke();
  rectMode(CENTER);
}
 
void draw(){
  background(0);
  int r = int(random(6));
  
  float scalar= sin(angle)+2;
  translate(mouseX, mouseY);
  rotate(angle/2);
  scale(scalar);
  float gray = map(sin(angle), -1, 1, 50, 232);
  fill(nums[r], nums[r], nums[r]);
  rect(random(width), random(height), nums[r], nums[r]);
  angle += PI/12;
}



