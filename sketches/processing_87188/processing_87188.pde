
int si = 512;
int[] nums = new int[si];
float ri = 0;
void setup() {
  for (int i = 0; i < si; i++) {
    nums[i]=0;
  }
    background(0);
    stroke(#05CFFF);
    fill(0);
    size(512, 512);

  //frameRate(30);
}

void draw() {
    stroke(#05CFFF);
    fill(0);
background(0);
  translate(255,255);
  ellipse(0,0,100,100);

  for (int i = 0; i < si-1; i++) {
    nums[i]=nums[i+1];
  }
      

  for (int i = 0; i < si; i++) {
    if(nums[i]>1){
      rotate(0.1+ri/100);
   line(0,0,i,i); 
    }
  }
  ri++;
}

void mousePressed() {
  nums[si-10]=10;
}
