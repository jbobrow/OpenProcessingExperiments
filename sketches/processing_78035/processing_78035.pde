
List<MetaBall> pts=new ArrayList<MetaBall>();

List<MetaBall> pts2=new ArrayList<MetaBall>();


int cAmount = 75;
color[] palette = new color[cAmount];

void setup() {
  size(900, 600);
  pts.add(new MetaBall(new PVector(450, 300)));
  pts2.add(new MetaBall(new PVector(100, 300)));
  
  for(int i=0; i<cAmount;i++){
   palette[i]=color(sin(noise(500))*100,cos(noise(1000))/100,random(0,100));
  }
}

void draw() {  

  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      
      float intensity= 0;
      for (MetaBall b:pts) {
        // Increase this number to make your blobs bigger
        intensity+= 50000/(b.intensY[y] + b.intensX[x]+.1);
      }  
      float intensity2 = 0;
  for (MetaBall b:pts2) {
        // Increase this number to make your blobs bigger
        intensity2+= 500/(b.intensY[y] + b.intensX[x]+.1);
      }      
      
      set(x, y, palette[int(constrain(intensity*intensity2,0,cAmount-1))]);//manipulting 'intensity' variable here with sin or other functions will generate interesting results for sure..
    }
  }
}

class MetaBall {//basic metaball class

  PVector pos;//it needs to be somewhere [check PVector in help]

  int[] intensX;//intensity gradient in x direction
  int[] intensY;//intensity gradient in y direction

  MetaBall(PVector _pos) {
    pos=_pos; 
    intensX=new int[width];//we want to calculate the intensity across the screen
    intensY=new int[height];//-||-

    for (int x = 0; x < width; x++) {
      intensX[x]= int(sq(pos.x-x));
    }
    for (int y = 0; y < height; y++) {
      intensY[y]= int(sq(pos.y-y));
    }
   
    }
  }

void mousePressed() {//click somewhere on the screen to add another point
  pts.add(new MetaBall(new PVector(mouseX, mouseY)));
}



