
int max = 255;
int fillval= 200;
int count = 1;

int[] nums = new int[max];
int[] x = new int[max];
int[] y = new int[max];

void setup() {
  for (int i = 0; i < max; i++) {
    nums[i]=0;
    x[i]=0;
    y[i]=0;
    }
  background(255);
  stroke(0);
  fill(0);
  size(512, 512);
  nums[205]=100;
  frameRate(30);
  rectMode(CENTER);
  noFill();
  strokeWeight(50);
}

void draw() {
  background(255);
  for (int i = 0; i < max-1; i++) {
    nums[i]=nums[i+1];
    x[i]=x[i+1];
    y[i]=y[i+1];
  }

  for (int i = 0; i < max; i++) {
    if(nums[i]%2==0)
    {
      stroke(255);
    } else {
      stroke(0);
    }
    if (nums[i]>0)rect(width/2+x[i], height/2+y[i], i*2, i*2);
  }
  
  stroke(0);
  rect(mouseX,mouseY,fillval*2,fillval*2);
  
    nums[fillval]=count;
  x[fillval]=mouseX-255;
  y[fillval]=mouseY-255;
  count++;
}

void mousePressed() {
  nums[fillval]=count;
  x[fillval]=mouseX-255;
  y[fillval]=mouseY-255;
  count++;
}

