
int mode = 1;
PImage brain;
PImage oldbrain;
float x,y,dX,dY,easing;
 
void setup(){
  size(600,600);
    easing = .02;
      
}
 void draw(){
     dX =mouseX -x;
  dY = mouseY -y;
  x = x + dX*easing;
  y = y + dY*easing;
  
     if(mode == 1){
    background(0);
    oldbrain = loadImage( "oldbrain.gif");
     image(oldbrain,300,300);
  imageMode(CENTER);
   float speedX = abs(mouseX-pmouseX);
  fill(252,28,186,50);
  ellipse(x,y,mouseX/2,mouseY/3);
 ellipse(x,y,mouseX+2,mouseY+3);

      fill(random(255),random(255),random(255), 50);
  translate(width/2,height/2);
    for (int i=0; i < mouseX; i ++){
      rotate(radians(5));
      ellipse(mouseX,mouseY ,30, 45);
    }
       stroke(45,25,200,20);
    fill(94,252,28,60);
  translate(width/3,height/2);
    for (int i=0; i < mouseX; i ++){
      rotate(radians(2));
      ellipse(mouseX+1,mouseY+1 ,34, 50);
 
 }
 stroke(45,25,200,20);
    fill(166,28,252,60);
  translate(width/2,height/3);
    for (int i=0; i < mouseX; i ++){
      rotate(radians(2));
      ellipse(mouseX/2,mouseY/2 ,48, 53);
 
  } 
     }else if(mode ==2){
    background(0);
    mode = 2;
           brain = loadImage( "brain.jpeg");
  oldbrain = loadImage( "oldbrain.gif");
  image(brain,300,300);
  translate(width/2,height/2);
    for (int i=0; i < mouseX; i ++){
      rotate(radians(2));
      float speedX = abs(mouseX-pmouseX);
      image(oldbrain,mouseX,mouseY);
  imageMode(CENTER);
  easing = .5;
  }
 }
  else if(mode ==3){
      fill(243,123,201.40);
      translate(150,50);
       brain = loadImage( "brain.jpeg",10);
              image(brain,mouseX,mouseY);
                imageMode(CENTER);
  translate(width/4,height/2);
    for (int i=0; i < mouseX; i ++){
      rotate(radians(5));
      ellipse(mouseX-4,mouseY-6 ,30, 55);
 }
   stroke(45,25,200,60);
    fill(55,34,200,60);
  translate(width/4,height/3);
    for (int i=0; i < mouseY; i ++){
      rotate(radians(4));
      ellipse(mouseX+2,mouseY-4 ,34, 18);
       ellipse(x,y,mouseX/2,mouseY/3);
 
 }
    
  }
 }void keyPressed(){
  if(key == 'q'){
    mode = 1;
    }
   else if(key == 'w'){
           mode = 2;
           }

 else if(key == 'e'){
           mode = 3;
           
  }
   }



