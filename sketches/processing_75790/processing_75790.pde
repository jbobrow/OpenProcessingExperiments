
float r = 2.4;

float x,y;
int maxMeasure = 5000;
int currMeasure = 0;

int pic[][] = new int[2000][2000];
int it = 0;

void setup() 
{
  size(1600, 900);
  frameRate(100);
  background(0);
  
}

void draw() {
  
  fill(0);
  stroke(0);
  
  rect(0,700,1600,900);

    r+=0.0005;
    
    stroke(255,255,255);
    float p = random(1000)/1000.0;
    
    float average = p;
    
    for(int i = 0; i < width;i++){
      point(i,height-(p*100));
      
      p = r * p * (1 - p);
      
      //pic[(int)(r-2.4)*700][(int)p*600] += 1;
      //point((int)((r-2.4)*700),(int)(p*600));
      if(p > 0 && r > 0){
        pic[(int)((r-2.4)*700)][(int)(p*600)] += 1;
      }
    }
    
  if(r > 4.5){r = 2.4;}
  
  loadPixels();
  
  for(int x = 0; x < 1200; x++){
    int highest = 0;
    
      for(int y = 0; y < 900; y++){
        if ((pic[x][y]) > highest){
          highest = pic[x][y];
        }
      }
        
      for(int y = 0; y < 700; y++){
        pixels[x+y*width] = color(((float)pic[x][y]/highest)*255*y);
      }
    
  }
  
  updatePixels();
  
}


