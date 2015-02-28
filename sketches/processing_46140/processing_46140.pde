
  float r,angle;

void setup(){
  size(600,600);
  smooth();
  background(0);
  fill(255);
  noStroke();
}

void draw(){
  float ellSize = 0;



    
  for(int x = 0;x < width; x +=10){
    for(int y = 0; y< height; y +=10){
      pushMatrix();
      translate(y+300,(sin((x*y)/2))+300);
      rotate(radians(frameCount * 2  % 360));
        ellSize = (sin(y*(x+10))* 10)/(cos(y*x));
        ellipse(x,((y/20)*4),(ellSize*2/((x*y)-30)),ellSize/3);
        fill(random(50,165),random(30,240),random(10,140));
    popMatrix();
    }
  }
   
}

