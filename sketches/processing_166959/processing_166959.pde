
int c = 15;
int [] data = {25, 50, 75, 100, 125, 150, 175, 200, 225, 250, 275, 300};
int [] place = {25, 50, 75, 100, 125, 150, 175, 200, 225, 250, 275, 300};


void setup (){
  size (300, 300);
  background (255);
  smooth ();
  //noLoop ();
}

void draw (){
background (255);
  for (int i = 0; i < data.length; i ++){
    for (int d = 0; d < place.length; d ++){
      for (int c = 0; c < 10; c ++){
    strokeWeight (0.8);
    stroke (255, 255, 149, c);
    if( dist(mouseX,mouseY,data[i],place[d]) < 20 ){
        fill (106, 12, 96, 255);
    }else{
        fill (106, 12, 96, c);        
    }
    ellipse (data [i] , place [d], 100, 75);
  }
  
  }
  }
  }
  




