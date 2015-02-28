
float sep, nn;

void setup(){
 sep = 5;
  nn = 30;
  size(400, 400);
  smooth();
}

void draw(){

  background(0);
  for(float y =sep; y <= width-2*sep; y += nn/2){
    for(float x = sep+10; x <= height-sep/2; x += 1.5*nn){

    float f;
      f = dist(mouseX, mouseY, x, y);
      float diam;
      diam = map(f, f, width, height, 14); 
      


     
        translate(mouseX*2,mouseY*2);
        rotate(5);
        fill(150,220,10,50);
        rectMode(CENTER);
        rect(x,f,30,20);
        fill(40,120,30,60);
        rectMode(CENTER);
        rect(f,y,60,40);
        noStroke();
        fill(60,140,50,130);
        rectMode(CENTER);
        rect(f,f,15,15);
       fill(#93FF86,170);
       rectMode(CENTER);
       rect(f,mouseY,5,5);
      ellipse(width/2,height/2,mouseX,5);
    }  
    }
  }








