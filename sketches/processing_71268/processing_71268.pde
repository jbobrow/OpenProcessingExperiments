
//arraylist of whirls
//one object in that list is myWhirl
//Whirl is the class

ArrayList whirls;

float circleSize;
float size=100;
float rad;
float oscillation;
float xPos,yPos;

void setup(){
  size(600,600);
  smooth();
  xPos = width/2;
  yPos = height/2;
  whirls = new ArrayList();
  whirls.add(new Whirl (width, height));
}

void draw(){
  
  background (0,133,199);
  
  for(int i=0; i<whirls.size(); i++){
    Whirl myWhirl = (Whirl) whirls.get(i);
   // myWhirl.move();
    myWhirl.draw(i*10);
  }

}


void mousePressed(){
whirls.add(new Whirl(mouseX, mouseY));
}



