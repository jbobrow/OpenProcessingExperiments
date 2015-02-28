
//Mariana Moreno
//Math, Programming & Art:
//2/21/12
//HW: WK 6

float x,y,angle;
float ellSize = 0;
float rectSize = 0;

void setup (){
  size (600,600);
  x= 0;
  y= 0;
  angle= 0;
  smooth ();
}

void draw (){
  background (0);

//swirly pattern  
  float rectSize = 0;
  for (int x = 0; x < width; x+=10){
    for (int y = 0; y < height; y+=10){
      pushMatrix ();
      fill (31,0,137);
      stroke (18,0,80);
      strokeWeight (1.5);
      rectSize = sin (x*y) * 5;
      rect (x,y,rectSize+4,rectSize+4);
      popMatrix ();
    }
  }
  
  //diagonal circles shower
  float ellSize = 0;
  for (int x = 0; x < width; x+=15){
    for (int y = 0; y < height; y +=15){
      pushMatrix ();
      stroke (255);
      fill (16,2,64);
      strokeWeight (.75);
      ellSize = tan (x+y);
      ellipse (x,y,random(ellSize),random(ellSize));
      popMatrix ();
    }
  }
  for (int x = 0; x < width; x+=15){
    for (int y = 0; y < height; y +=15){
      pushMatrix ();
      stroke (16,2,64);
      fill (255);
      strokeWeight (.75);
      ellSize = tan (x-y);
      ellipse (x,y,random(ellSize),random(ellSize));
      popMatrix ();
    }
  }

}

