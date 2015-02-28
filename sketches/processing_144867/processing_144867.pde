
PImage face;
float counter = 0;

void setup(){
  size(960,960);
  face = loadImage("face.jpg");
  frameRate(25);
}

void draw(){
  int x = 0;
  int y = 0;
  int center = width / 2.0 ;
  int thickness = pow(counter,2);
if(counter <= 8){
  face.filter(BLUR,1.1);
  image(face,0,0);
  }
else{
     face.filter(THRESHOLD, .7);
     image(face,0,0);
   }
if(counter < 8){ 
    while(x < 960){
      strokeWeight(thickness);
      line(x,0,x,960);
      x += 50;
    } 
  }
if(counter < 8){
    while(y < 960){
      strokeWeight(thickness);
      line(0,y,960,y);
      y += 50;
    } 
  }
else{
     noStroke();
     fill(random(255),random(255),random(255));
     ellipse(center,center, 4000/pow(counter,counter/15) , 4000/pow(counter,counter/15));
     stroke();
   }
  counter += .4;   
}


