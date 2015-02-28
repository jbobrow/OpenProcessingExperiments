
PImage a;
PImage b;
PImage c;
PImage d;
PImage e;



void setup(){
  size(600,600);

  
  a=loadImage("001.jpg");
   b=loadImage("002.jpg");
   c=loadImage("003.jpg");
   d=loadImage("004.jpg");
   e=loadImage("005.jpg");
  imageMode(CENTER);
  noCursor();
  
}

void draw(){
    background(200);
    
   if(mouseX<100){
  image(a, 300, 300,a.width/4,a.height/4);
}
  else if(mouseX<200){
  image(b,300,300,a.width/4,a.height/4);
   }
  else if(mouseX<300){
  image(c,300,300,a.width/4,a.height/4);
   }
  else if(mouseX<400){
  image(d,300,300,a.width/4,a.height/4);
   }
   else if(mouseX<600){
  image(e,300,300,a.width/4,a.height/4);
   }
   
  
}


