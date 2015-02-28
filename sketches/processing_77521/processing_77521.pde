
int stages =1;
int bin [] = new int[stages];

int bar_size;

void setup()
{
  bar_size = height/10;
  background(211);
}

void draw() {

  int n = int(map(mouseX, 0, width, 0, stages));

if (keyPressed){
  if (key == ENTER){
    
  if (bin[n] < width) {
    bin[n]++;
    for (int i=0 ; i<stages ; i++)
    {
      rect(i*bar_size, width/2, bin[i], bar_size);
      fill (122,250,10);
    } 
  }
  else { 
    bin[n]=0;
    background(211);
    
  }
  }}
}


