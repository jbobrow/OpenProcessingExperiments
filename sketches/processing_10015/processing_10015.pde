
int x, y;
int cIndex;
char[] arr;


void setup () {
  size (400, 400);
  background (0);
  frameRate (30);  
  textFont (loadFont("font.vlw"));
    
  arr = new String("I am being productive.   ").toCharArray();
  x = 0;
  y = 20;
  cIndex = 0;
}

void draw () {
  if (frameCount % 2 == 0) {
     if (cIndex >= arr.length) {
       y += 25;
       if (y > height) {
         background (0);
         y = 20;
       }
       x = 0;
       cIndex = 0; 
     }
    
     text (arr[cIndex++], x, y);
     x += 15;     
  }
}

void mousePressed() 
{
  save("line.tif");
}



