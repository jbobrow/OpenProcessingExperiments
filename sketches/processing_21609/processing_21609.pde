
int num = 40;

Walker[] myWalker = new Walker[num];
color[] Colors = new color[4];

void setup(){
  size(500,500);
  background(0);
  smooth();
  frameRate(100);
  
  Colors[0] = color(255,50);
  Colors[1] = color(120,0,0,50);
  Colors[2] = color(0,50);
  
  for(int i=0; i<num; i++){
    myWalker[i] = new Walker();
  }
}

void draw(){
  for (int i=0; i<num; i++){
    myWalker[i] .display();
    myWalker[i] .update();
    //translate(sin(10*i),0);
  }
}

class Walker {
  
  color colorPicker = Colors[floor(random(0,3))];
  float x = random(50,width-50);
  float y = random(50,height-50);
  
  Walker(){
  }
  
  void update(){
    
    x = x + random(-5,5);
    y = y + random(-5,5);
  }
  
  void display(){
    
    fill(colorPicker);
    //if(colorPicker == Colors[2]){
      //stroke(255);
      //ellipse(x,y,60,60);
    //}
    //else{
      stroke(0);
      ellipse(x,y,40,40);
    //}
  }
}

