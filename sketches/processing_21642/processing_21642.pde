
int num=6;
float rectSize= random(100);

rectangle [] myRectangle = new rectangle[num];
color[] myColors = new color[3];

void setup() {

  size(300,300);

  
  myColors[0] = color(255,0,0,50);
  myColors[1] = color(0,255,0,50);
  myColors[2] = color(0,0,255,50);

  
  for(int i=0;i<myRectangle.length;i++){
    myRectangle[i] = new rectangle();
   
  }

  noStroke();
  smooth();
  rectMode(CENTER);
}

void draw() {
  background(255);

  for(int i=0; i < myRectangle.length; i++) {
    myRectangle[i].update();
    myRectangle[i].draw();
  }
}

class rectangle {
  
  float xpos = random(20,width-20);
  float ypos = random(20,height-20);
  float rectSize = random(100);
  color col = myColors[floor(random(0,3))];
  
   rectangle() {
  }

  void update() {

    //this.ypos = this.ypos + this.speed;
      //speed++;
     // xpos++;
     // ypos++;
      rectSize++;
   if(this.rectSize > height) {
      this.rectSize = 0;
      xpos = random(0,width);
      ypos = random(0,height);
  }
  }
  void draw() {
    fill(col);
    rect( xpos,ypos,rectSize,rectSize);
  }
}


