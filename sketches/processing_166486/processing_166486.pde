
PImage img1, img2, img3, img4;



void setup (){

  size(720,500);
  
}
void draw() {
  smooth();
  if (key == 'a'|| key == 'A'){
  ellipse(100,100,50,50);
  }
   if (key == 's'|| key == 'S'){
  ellipse(300,200,200,200);
  
  }

if (key == 'q'|| key == 'Q'){
  background(199);
  fill(255);
  rect(55,120,270,200);
   rect(390,120,270,200);
   
    textSize (22);
  fill(0);
  text(" error///123587derp7",63,220);
   text("the password you",410,190);
   text("entered was incorrect", 410, 220);
   text("please try again",410,250);
   
   text("bad",60,350);
   text("good",400,350);
 
}
if (key == 'w'|| key =='W' ){
  img1 = loadImage("experience_learning_base-01-01-01.png");
  img2 = loadImage("experience_top.2-01.png");
  img3 = loadImage("experience_learning_middle-01-01.png");
  img4 = loadImage("experience_learning_bottom-01-01.png");
  image(img1, 0, 0);
  
  experience();
}

if (key == 'e' || key == 'E'){
  background(199);
  size(720,500);
  textSize(24);
  fill(0);
  text("press a then move your mouse to the circle",30,380);
  text("then press s and move your mouse to the circle",30,420);
  text("which did you travel to faster?",30,460);
  
  
}



}



void experience(){
  image(img1, 0, 0);
  float x =mouseX;
  float y = mouseY;
  float d = dist (181,50, mouseX, mouseY);
  println(d);
  if(d<=120){
    picturetwo();
    
  }
  float c = dist(181,260, mouseX, mouseY);
  println(d);
  if(c<=120){
    picturethree();
    
  }
  
   float f = dist(181,460, mouseX, mouseY);
  println(d);
  if(f<=120){
    picturefour();
    
  }
  
  
  
}

void picturetwo(){
  image(img2, 0, 0);
  }
  
void picturethree(){
  image(img3, 0, 0);
}
  
void picturefour(){
  image(img4, 0, 0);
}




