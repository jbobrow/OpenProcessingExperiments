
// Processing sketch by Erim Kocatepe // 
// www.erimkocatepe.com //

float shape = TWO_PI;  
int count = 15;
int forms = 24;
float f;


FloatList posx;
FloatList posy;

void setup() { 
  size(600, 600);
  smooth(8);
  noFill();
  strokeWeight(0.5);
  posx = new FloatList();
  posy = new FloatList();
}

void draw() {  
  background(255);
  f = frameCount;
  pushMatrix();
  translate(width/2, height/2);

  float radn = 250 ;
  for (int i = 0; i < forms; i++) {    
    float speed = map(i, 0, forms, 0.005, 0.02);
    for (int n = 0; n < count; n++) {
      float rad = radn ;
      float x = sin(map(n, 0, count, 0, shape)+(i*55)+(f*speed)) * rad ;
      float y = cos(map(n, 0, count, 0, shape)+(i*55)+(f*speed)) * rad ;      
      posx.append(x);
      posy.append(y);
    }
    radn = radn-10;
  }    


  for (int i = 0; i < count *forms; i++) {
    float x =  posx.get(i);
    float y =  posy.get(i);     
    //ellipse(x, y,1,1);

    for (int n = 1; n < count *forms; n++) {
      float nx =  posx.get(n);
      float ny =  posy.get(n); 
      float dist = dist(x, y, nx, ny);
      stroke(20, map(dist, 50, 0, 0, 250))  ;
      if (dist < 50) {
        line(x, y, nx, ny);
      }
    }
  }

  popMatrix(); 
  //saveFrame("screen-######.png");
  posx.clear();
  posy.clear();
}



