
ArrayList<Flake> flakes;
color bg;
float step;
color c1;
color c2;
int swatchIndex;
int counter;
color[] colors = {color(247, 27, 1), color(234, 229, 0), color(123, 205, 49), color(46, 140, 194)}; 


void setup(){
  counter = 0;
  swatchIndex = 0;

  size(800,600);
  flakes = new ArrayList<Flake>();
}

void draw(){
  float y = 0;
  float x = random(0,width);
  float sizeX = 10;
  float sizeY = 10;
  color fillColor = color(255,255,255,50);
 
  flakes.add(new Flake(x, y, sizeX, sizeY, fillColor));

  if(counter > 255){
    counter = 0;
    swatchIndex = (swatchIndex+1)%(colors.length);
  }
  counter++;

  step = map(counter,0,255,0,1);
  c1 = colors[swatchIndex];
  c2 = colors[(swatchIndex+1)%(colors.length)];
  bg = lerpColor(c1,c2,step);
  background(bg);

  for(int i=0; i<flakes.size(); i+=1){
    flakes.get(i).display();
    flakes.get(i).update();
  }


}

class Flake {
  float x, y, sizeX, sizeY;
  color fillColor;
  
  Flake(float x, float y, float sizeX, float sizeY, color fillColor){
    this.x = x;
    this.y = y;
    this.sizeX = sizeX;
    this.sizeY = sizeY;
    this.fillColor = fillColor;
  }

  void display(){
    noStroke();
    fill(this.fillColor);
    ellipse(this.x, this.y, this.sizeX, this.sizeY);
  }

  void update(){
    if(this.y<height-5){
      this.x += random(-2, 2);
      this.y += random(-1, 3);
    }
  }
}



