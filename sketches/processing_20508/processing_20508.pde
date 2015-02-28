
PImage myPic;

void setup(){
  size(300,300);
  myPic = loadImage("Bret.jpg");
  background(200);
  noStroke();
  smooth();
}

float module = floor(random(15,30));

void draw(){
  for(int x = 0; x < width/10; x++){
    for(int y = 0; y < height/10; y++){
      
      int a = floor(random(0,myPic.width));
      int b = floor(random(0,myPic.height));
      
      color myColor = myPic.get(a,b);
      if(a > (myPic.width*1.5)){
        stroke(.05);
        fill(myColor,70);
        rect((x*module)-random(20),(y*module)-random(10),30,20);
      }
      else{
        fill(myColor,50);
        rect((x*module)-random(20),(y*module)-random(10),random(50,80),random(20,60));
      }
    }
  }
  noLoop();
}

void keyPressed(){
  if(key == 'c' || key == 'C'){
    loop();
  }
}

