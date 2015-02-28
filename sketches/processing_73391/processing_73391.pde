

//homework 10/2

color fillColor;

void setup(){
  size(800,600);
  smooth();
  fillColor = 0;
}
  
  void draw(){
    background(fillColor);
    if(mouseX < 250){
      fillColor=color(#4F6190);
    }else if (mouseX > 250 && mouseX < 500){
      fillColor=color(#A6B4D8);
    }else{
      fillColor=color(#5872FF);
      noFill();
    }
  for(int i = 0; i < 250; i++){
    fill(#433C6C);
    text("blahblahblahblahblah",10,i*10);
  }
  for(int i = 0;i < 250; i++){
    //fill(#B5CEC0,200);
    noFill();
    ellipse(mouseX,mouseY,i*10,i*10);
  }
   for (int i = 0;i < 800; i++){      //<-----code not working
  fill(#955394);
  text("heyheyheyheyheyhey",500,i*10);
  }
  for(int x = 0; x < width; x+=10){
    stroke(255,10);
    line(x,0,x,height);
  }
  for(int y = 0; y < height; y+=10){
    stroke(255,10);
    line(0,y,width,y);
  }
  }

 



