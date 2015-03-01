
int dim;
float angle = 0;
float px = 0, py = 0;
float amplitude = 2;
float frequency = 0;
float fillGap = 5;
color c;

void setup() {
  size(300, 300);
  dim = width/4;
  background(0);
  frameRate(7);
}
void draw() {
    background(0);
    for (int i =- 15; i < height+15; i++){
    angle = 0;
    frequency+=.01;
    for (float j = 0; j < width+15; j++){
      py = i + sin(2*radians(angle)) * 2;
      px = i + 0.8*cos(radians(angle));
      angle += frequency;
      c =  color(abs(px-2*i)*60/amplitude, 255-abs(px-i)*180/amplitude, 255-abs(py-i)*180/amplitude);
      for (int filler = 0; filler < fillGap; filler++){
        //set(int(j+px-filler), int(py)-filler, c/80);
        set(int(j), int(px)-filler, c);
        //set(int(j+px)-filler, int(j+px-filler),c/80);
      }
    }
  }
      for (int x = dim/8; x <= width+dim/8; x+=dim*3/4) {
          int rad=dim/4;
          int spike=int(random(4,8));
          float h = random(0, 360);
          float g = random(0,360);
          float k=random(0,360);
          for (int r=rad;r>0;--r){
              for (int i=0;i<=3;i++){
                  drawStar(r,2,spike,h,g,k,x,height*(i)*5/16+(dim+2)/8);
                  h = (h + 1) % 360;
                  g = (g + 1) % 360;
                  k = (k + 15) % 360;
              }
          }
      }
}

void drawStar(int outerRadius,int ratio,int numSpikes,float h, float g, float k, int xpos, int ypos){
    PVector[] points=new PVector[numSpikes*2];
    float angle = TWO_PI / points.length; 
    int innerRadius=outerRadius/ratio;
    for ( int i = 0; i < points.length; i++ ) { 
        float x, y;    
        if ( i % 2 == 0 ) {
            x = cos( angle * i ) * outerRadius;
            y = sin( angle * i ) * outerRadius;
        } else {
            x = cos( angle * i ) * innerRadius;
            y = sin( angle * i ) * innerRadius;
        }  
        points[i] = new PVector( x, y );
    }
    smooth();
    fill(h,g,k);
    specular(255, 100, 255);
    ambient(51, 26, 0);
    shininess(80.0);
    noStroke();
    beginShape();
    for (int i = 0; i < points.length; i++) {
        vertex( points[i].x+xpos, points[i].y+ypos );
    }
    endShape(CLOSE);        
}





