
// Loading an image when using setup() and draw()
int value = 0;
ArrayList knots;
int[] colors = {#EB9968,#7D955D,#688839,#F9B746,#BB6360,#B6B0B2,#BD8A51,#E5D4CB,#90AF13,#D3BB9A,#675E45,#35312E,#A0798C,#794E64,#ABC4DB,#687481,#62345A,#726864,#753F72,#A09703,#F2F2EE,#452C19,#B5AD9B,#202945};
float maxsize = 120;
float maxamount = 40;
float AA;
float BB;
int count = 0;

PImage imgA;
PImage imgB;

void setup() {
  size(1024, 724);
  smooth();
  noStroke();
  imgA = loadImage("border.jpg");  
  imgB = loadImage("map.jpg");
  imgB.filter(GRAY);
  image(imgA, 0, 0);
  knots = new ArrayList();
  frameRate(60);
}

void draw() {
   image(imgB, 0, 0);
  if (knots.size() > 0){
    for (int i = knots.size()-1; i >= 0; i--){
      Knot knot = (Knot) knots.get(i);
      knot.display();
      if (knots.size() > 1){
        for (int j = knots.size()-1; j >= 0; j--){
          Knot knot2 = (Knot) knots.get(j);
          if (i!=j && 2*dist(knot.x,knot.y,knot2.x,knot2.y)<(knot.w+knot2.w)){
            stroke(255);
            line(knot.x,knot.y,knot2.x,knot2.y);
            noStroke();

          }
        }  
      }
    if (knot.w > maxsize){
    AA = int(knot.x+random(-maxsize,maxsize));
    BB = int(knot.y+random(-maxsize,maxsize));
     
    for (int j = knots.size()-1; j >= 0; j--){
        Knot knot3 = (Knot) knots.get(j);
        
        if (2*dist(knot3.x,knot3.y,AA,BB)<(maxsize/2)){
          count++;
        }
    }
    if (count==0){
    knot.pops(AA,BB); 
    }else{
      count=0;
      knot.nopops();
    } 
    }
    if  (knot.w < 2){
      knot.wreset();
    }
  }
}
}

void mouseClicked() {
  if (value < 5){
    knots.add(new Knot(mouseX,mouseY,4,int(random(0,24))));
    value = +1;
  }
}

class Knot{
  
  float x;
  float y;
  float w;
  float w1 = random(-1,0);
  float w2 = random(0,1);
  int newX;
  int newY;
  float growth = 255;
  color cl;
  
  Knot(float tempX, float tempY, float tempW,int tempRGB){
  
    x = tempX;
    y = tempY;
    w = tempW;
    cl = colors [tempRGB];
  }
  
  void display(){
    w = w+random(w1,w2);
    fill(cl,120);  
    ellipse(x,y,w,w);
    fill(cl,240);  
    ellipse(x,y,w/4,w/4);  
  }
  
  void pops(float XX,float YY){
    w = maxsize/4;
    
    if (knots.size()<maxamount){
      this.newX = int(XX);
      this.newY = int(YY);
      if(imgA.get(newX,newY)>-10){
        knots.add(new Knot(newX,newY,1,int(random(0,24))));
      }
      w1 = random(-1,0);
      w2 = random(0,1); 
    }
  }
  
  void wreset(){
    w1 = random(-1,0);
    w2 = random(0,1); 
  }
    void nopops(){
    w = maxsize/4;
    w1 = random(-1,0);
    w2 = random(0,1); 
  }
}
  


