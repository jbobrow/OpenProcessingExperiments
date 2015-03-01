
PImage a;
PImage b;
PImage c;
PImage d;
PImage e;


void setup(){
 background(255);
 size(750, 850);
 a = loadImage("map-01.jpg");
 b = loadImage("map-02.jpg");
 c = loadImage("map-03.jpg");
 d = loadImage("map-04.jpg");
 e = loadImage("map-05.jpg");

}

void draw (){

  if(mouseX > 200){
   imageMode(CENTER);
    image(b,width/2,height/2);
  }
  else if (mouseX < 251 ){
    imageMode(CENTER);
    image(a,width/2,height/2);

  }


 

  if(mouseX > 300){
   imageMode(CENTER);
    image(c,width/2,height/2);
  }
  else if (mouseX > 301 ){
    imageMode(CENTER);
    image(d,width/2,height/2);

  }
 


  if(mouseX > 400){
   imageMode(CENTER);
    image(d,width/2,height/2);
  }
  else if (mouseX > 401 ){
    imageMode(CENTER);
    image(e,width/2,height/2);

  }
 if(mouseX > 500){
   imageMode(CENTER);
    image(e,width/2,height/2);
  }
  else if (mouseX > 501 ){
    imageMode(CENTER);
    image(e,width/2,height/2);

  }

}


