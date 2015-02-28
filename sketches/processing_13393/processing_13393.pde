
PImage img;
Shape myShape;


void setup(){
  size(300,201);
  img = loadImage("testIMG.jpg");
  //background(0);
  smooth();
  myShape = new Shape();
}

void draw(){
  myShape.display();
  myShape.move();
  myShape.bounce();
}

class Shape{
  float xOffset;
  //float yOffset;
  float speed;
  float grav = 0.1;
  int loc1;
  Shape(){
    xOffset = 0;
    //yOffset = 0;
    speed = 0;
  }

  void display(){
    for(float x = 0; x<width; x+=5){
      for(float y = 0; y<height; y+=10){
        float loc = x+y*img.width;
        //stroke(255);
        noStroke();
        int loc1 = int(loc);
        //println(loc1);
        fill(img.pixels[loc1]);
        if(x%10 ==0){
          triangle(x+xOffset-5,y,x+xOffset,y+10,x+5+xOffset,y);
        } 
        else {
          triangle(x-5-xOffset,y+10,x-xOffset,y,x+5-xOffset,y+10);
        }
      }
    }

  }

  void move(){
    if(mousePressed){
      //yOffset += speed;
      xOffset += speed;
      speed = speed+grav;
    }
  }

  void bounce(){
    if((xOffset > width) || (xOffset < 0)){
      speed = speed*-1;
    }
  }
}






//regeneratePixels

//classDifferentShape
//
















