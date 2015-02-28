
PImage img;
Animation animation1;

float xpos = 100;
float ypos = 100;
float bx;
float by;
float speed = 3;

void setup(){
  size(1000,800);
  frameRate(24);
  img = loadImage ("level.png");
  animation1 = new Animation ("Eyes", 900);
}

void draw (){
  image(img, bx, by);
  character();
}

void character(){
  if(keyPressed){
    if(key=='s'){
      animation1.display(xpos, ypos);
      if(by <=-173){
        by -= speed;
      }
      else{
        by = by;
        ypos += speed;
      }
    }
  }
  if(keyPressed){
    if(key=='w'){
      animation1.display(xpos, ypos);
      if(by <=-3){
        by += speed;
      }
      else{
        by = by;
        ypos -= speed;
      }
    }
  }
  if(keyPressed){
    if(key=='a'){
      animation1.display(xpos, ypos);
      if(bx <=-3){
        bx += speed;
      }
      else{
        bx = bx;
        xpos -= speed;
      }
    }
  }
  if(keyPressed){
    if(key=='d'){
      animation1.display(xpos, ypos);
      if(bx <=-3){
        bx -= speed;
      }
      else{
        bx = by;
        xpos += speed;
      }
    }
  }
  else{
    animation1.display(xpos,ypos);
  }
}
class Animation {
  PImage [] images;
  int imageCount;
  int frame;
  
  Animation(String imagePrefix, int count){
    imageCount = count;
    images = new PImage [imageCount];
    
    for (int i = 0; i < imageCount; i++){
      String filename = imagePrefix + nf(i, 4) + ".png";
      images [i] = loadImage(filename);
    }
  }
  
  void display(float xpos, float ypos){
    frame = (frame+1) % imageCount;
    image(images[frame], xpos, ypos);
  }
  
  int getWidth(){
    return images[0].width;
  }
}
  


