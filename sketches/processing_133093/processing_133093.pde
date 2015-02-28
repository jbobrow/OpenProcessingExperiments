
/*@pjs preload="one.jpg, two.jpg, three.jpg, four.jpg, five.jpg,
six.jpg, seven.jpg, eight.jpg, nine.jpg, ten.jpg;*/
int imageIndex = 0;
PImage[] myimages = new PImage[10];
float timer = 0.0;
float speed = 10.0;
int plus = 1;
int minus = -1;

void setup(){
  size(600,600); 
  myimages[0] = loadImage("one.jpg");
  myimages[1] = loadImage("two.jpg");
  myimages[2] = loadImage("three.jpg");
  myimages[3] = loadImage("four.jpg");
  myimages[4] = loadImage("five.jpg");
  myimages[5] = loadImage("six.jpg");
  myimages[6] = loadImage("seven.jpg");
  myimages[7] = loadImage("eight.jpg");
  myimages[8] = loadImage("nine.jpg");
  myimages[9] = loadImage("ten.jpg");
  background(255);
}

void draw(){
  timer ++;
  if(speed < 0){
    speed = 3.0;  
  }
  
  if(timer > speed){
    imageIndex = imageIndex + plus;
    background(255);
    timer = 0; 
  }
  
  if(imageIndex >= myimages.length){
    imageIndex = 0; 
  }
  
  if(imageIndex < 0){
    imageIndex = 9; 
  }
  
  if(keyPressed){
    if(key == '1'){
      speed = speed + 10.0; 
    }
    if(key == '2'){
      speed = speed - 10.0; 
    }
  }
  
  imageMode(CENTER);
  image(myimages[imageIndex], width/2, height/2);
}

void keyReleased(){
  if(key == '3'){
    imageIndex = int(random(0,9));
    background(255);
  } 
  if(key == '4'){
    plus = minus;
  }
  if(key == '5'){
    
  }
}


