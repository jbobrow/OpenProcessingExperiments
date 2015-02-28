
int[] nums = {5,15,25,50,150,250};

void setup(){
size(700,500);
background(255);
//framerate(10);
}
void draw(){
//noStroke();

int r = int(random(6));

fill(nums[r], nums[r], nums[r]);
ellipse(random(width), random(height), nums[r], nums[r]);
}
