
int x = 255;
int y = 512; 
int z = 0;
float angle1 = HALF_PI;
int angle2 = 10;
int angle3 = 10;
int w = 200;
int h = 200;
int count;
int max = 300;
int[] nums = new int[max];

void setup() {
  size(512,512, OPENGL);
  background(0);
  noFill();
  stroke(255);

for (int i = 0; i < max; i++) {
    nums[i]=0;
  }
  
}
void draw() {
 
  if(count>max-2)count=0;

 background(0);

    nums[count]=nums[count+1];

  
translate(x,y,z);
rotateX(angle1);
//rotateY(angle2);
//rotateZ(angle3);
nums[count]=-mouseX/2;

for (int i = 0; i < max; i++) {
  translate(0,0,(i/50));
  ellipse(0,0, nums[i], nums[i]);
 
}

count++;

}

void keyPressed() {
  if(key == 'r') {
    background(0);
    count = 0; 
    for (int i = 0; i < max; i++) {
    nums[i]=0;
  }
  }
}
