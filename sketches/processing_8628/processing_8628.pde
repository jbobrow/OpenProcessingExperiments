

void setup () {
  size (300,300);
  frameRate (5);
  
}

void draw (){
  background (255);
 
    for (int x=0; x<width; x+=9){
    for (int y=0; y<height; y+=9){
        noStroke ();
        float radius1 = random(5,30);
        float radius2 = random(0,10);
        float radius3 = random(3,17);
        if (mousePressed){
          fill(random(200,255), random(50,175),0,random (0,100));
       }else{
        fill (0, random(100,220), 0, random(0,100));
        }
        
      //making columns  
      ellipseMode (CENTER);
      ellipse (x+1,y+1,radius1, radius1);
      ellipse (x+3,y+3,radius2,radius2);
      ellipse (x+5,y+5,radius3,radius3);

    }
  }
}




