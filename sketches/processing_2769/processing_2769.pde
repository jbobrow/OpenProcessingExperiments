
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
      if(mousePressed==false){
noStroke();

        translate(mouseX*2,mouseY*2);
        rotate(10);  
        fill(#000B6C,60);
        triangle(width/2,height/2,30,5,20,17);
        fill(#575AFC,70);
        triangle(width/4,height/4,13,20,15,10);
 fill(#A5A7FF,80);
 triangle(width/8,height/8,10,15,7,6);
     fill(#B2FFF9,100);
     
    fill(#B2FFF9,100);
    rect(mouseX,width/2,5,5);
    fill(#B2FFF9,100);
    rect(mouseY,height/2,f,5);
  
      }
    }
  }
}



