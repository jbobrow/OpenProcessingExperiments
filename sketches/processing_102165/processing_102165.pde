
Hex[] hex;
void setup() {
size(800, 350);
  smooth();
   int n=5;
  float radio=min(width,height)/1.5;
  hex = new Hex[n];
  colorMode(HSB);
 
  float radius = radio/n;
  for (int i=0;i<hex.length;i++) {
    //hex[i] = new Hex(new PVector (width,0), radio, 20/(i+1));
    hex[i] = new Hex(new PVector (width/2, height/2), radio, 20/(i+1));
    radio-=radius;
  }
}

void draw() {
  background(240);
  for(int i=0;i<hex.length;i++){
    float c = map(mouseX,0,width,0,255);
    float v = map(mouseY,0,height,0,255);
    float d= map(dist(hex[0].center.x,hex[0].center.y,mouseX,mouseY),0,min(width,height),0,255);
  hex[i].mostrar(c,v,d);
}
}
class Dot {
  float mayor = 0.006;
  float menor= 0.0004;
  PVector Possition;
  float posx;
  float posy;
  float x;
  float y;
  float xoff;
  float yoff;
  float radio;


  Dot(PVector pos, float rad) {
    posx = pos.x;
    posy = pos.y;
    radio = rad;
    x=random(5);
    y=random(5);
    xoff=random(menor, mayor);
    yoff=random(menor, mayor);
  }


  void update() {


    Possition = new PVector(   map(noise(x), 0, 1, posx-radio, posx+radio), map(noise(y), 0, 1, posy-radio, posy+radio)   );
    x+=xoff;
    y+=yoff;

    colorMode(RGB);
    noFill();
    noStroke();
    fill(200,200,200,40);
    ellipse(posx, posy, radio*2, radio*2);
    colorMode(HSB);
  }
}

class Hex {
  float radio;
  PVector center;
  Dot[] dots;

  Hex(PVector cent, float rad, int n ) {
    radio = rad;
    center = cent;
    dots= new Dot[n];
    float angle= 0;
    for (int i =0; i<dots.length;i++) {

      dots[i] =  new Dot(new PVector(((sin(angle))*radio)+center.x, ((cos(angle)*radio))+ center.y), radio*3/(n));
      angle+= (TWO_PI/dots.length);
      
    }
  }

  void mostrar(float c,float v,float d) {
    
    update();
    unir(c,v, d);
  }
  void update() {
    for (int i =0; i<dots.length;i++) {
      dots[i].update();
    }
  }

  void unir(float c,float v,float d) {
    noStroke();
    //fill(255);
    fill(d, c,v,70);
    beginShape(TRIANGLE_FAN);
    vertex(center.x, center.y);

    for (int i=0;i<dots.length;i++) {
      vertex(dots[i].Possition.x, dots[i].Possition.y);
    }
    vertex(dots[0].Possition.x, dots[0].Possition.y);
    vertex(center.x, center.y);
    endShape(CLOSE);
  }
}



