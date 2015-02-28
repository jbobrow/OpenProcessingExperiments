
int i,j;
int k;
Face[] faces = new Face[9*6];
//Face test;

void setup(){
//  background(20);
  size(900,600);
  for(j=0;j<6;j+=1){ //y
    for(i=0;i<9;i+=1){ //x
      k=i+j*9;
      faces[k]= new Face(i*100+50,j*100+50,100);
    }
  }
//  test = new Face(100,100,100);
}

void draw(){
  background(20);
  for(j=0;j<6;j+=1){ //y
    for(i=0;i<9;i+=1){ //x
      k=i+j*9;
      faces[k].cursorOn();
      faces[k].display();
    }
  }
//  test.cursorOn();
//  test.display();
}

class Face{
  int counter=0;
  int displaceX=0;
  int displaceY=0;
  float restX, restY;
  float x, y;
  float diameter;
  int on=0;
  
  Face(float initialX, float initialY, int initialDiameter){
    x=initialX;
    restX=initialX;
    y=initialX;
    restY=initialY;
    diameter=initialDiameter;
  }
  void display(){
    counter++;
    if(counter==3){
      counter=0;
    }
    if(on==1){
      if(counter==1){
        displaceX=2;
      }
      else if(counter==2){
        displaceY=2;
      }
      else{
        displaceX=displaceY=-1;
      }
    }
    noStroke();
    fill(255,255,100);
    ellipse(x+displaceX,y+displaceY,diameter,diameter);
    fill(20);
    ellipse(x-diameter/5+displaceX,y-diameter/6+displaceY,diameter/5,diameter/5);
    ellipse(x+diameter/5+displaceX,y-diameter/6+displaceY,diameter/5,diameter/5);
    stroke(20);
    strokeWeight(2);
    if(on==0){
      line(x-diameter/5,y+diameter/5,x+diameter/5,y+diameter/5);
    }
    else{
      line(x-diameter/5+displaceX,y+diameter/5+displaceY,x+displaceX,y+diameter/3+displaceY);
      line(x+diameter/5+displaceX,y+diameter/5+displaceY,x+displaceX,y+diameter/3+displaceY);
    }
    displaceX=0;
    displaceY=0;
    x=restX;
    y=restY;

  }
  void cursorOn(){
    if(mouseX>=x-diameter/2 && mouseX<=x+diameter/2 && mouseY>=y-diameter/2 && mouseY<=y+diameter/2){
      on=1;
    }
    else{
      on=0;
    }
  }
}
