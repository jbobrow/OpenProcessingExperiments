
int num = 100;
float mx[] = new float[num];
float my[] = new float[num];
float tx;
float ty;

void setup() 
{

  size(750, 200);
    fill(255,80); 
  noStroke();
    smooth();
    //background(0);

}

void draw() 
{
    background(51); 
    for(int i=1; i<num; i++) {
    mx[i-1] = mx[i];
    my[i-1] = my[i];
  } 
  
  mx[num-1] = mouseX;
  my[num-1] = mouseY;

  
  for(int i=0; i<num; i++) {
    ellipse(mx[i], my[i], i/3, i/3);
  }
  
}
