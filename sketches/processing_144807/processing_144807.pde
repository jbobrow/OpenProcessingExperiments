
float x;
float x2;
float x3;
float y;
color purple = color(117,13,131);
color orange = color(252, 143, 8);
color green = color (18, 227, 79);
float radius = 135;
int offset =30;
int interval = 25;

void setup() {
  size(700,600);
  smooth();
  x=width/5;
  y=height/2;
}

void draw() {
 background(52,208,224);
 smooth();
 bird(width/4/2,y,purple,radius);
 bird(width/4*2, y, orange, radius);
 bird(width/4*3.5, y, green, radius);

 
  if (keyPressed) { //fried eggs/flower
    if (key == 'f' || key =='F'){
    egg(mouseY); //fried eggs/flower move
  }
  }
  if(mousePressed){   // grow
  
    radius++;
  } else {
    radius=radius;
  }
  if(keyPressed){ 
 if (key == 'b' || key == 'B') {    //smaller but functions reverse instruction when bird is made too small
    radius--;             
  }
  }
  else {
    radius=radius;
  }
 } 

void egg(float tempX){ //draw fried egg
  for(int y=0;y<height;y+=180){
     for(float x=tempX;x<width;x+=150){
       println(tempX);
          for(int i=0; i<360; i+=interval){
              fill(250,250,250);
              ellipse(x, y,i/5,i/offset);
              fill(250,250,0);
              ellipse(x, y,i/15, i/offset);
              
        }
     }
    }
}




void bird(float tempX, float tempY, color clr, float tempRadius) {
  fill(clr);
  noStroke();
 
  //body
  ellipse(tempX, tempY, tempRadius, tempRadius+5);

  //eyes
  fill(255); //whites of the eye
  ellipse(tempX-tempRadius/5,tempY-tempRadius/6,tempRadius/4,tempRadius/4);
  ellipse(tempX-tempRadius/35,tempY-tempRadius/6,tempRadius/4,tempRadius/4);
  fill(0); //middle
  ellipse(tempX-tempRadius/6,tempY-tempRadius/6,tempRadius/8,tempRadius/8);
  ellipse(tempX-tempRadius/15,tempY-tempRadius/6,tempRadius/8,tempRadius/8);
  fill(255); //inner 
   ellipse(tempX-tempRadius/8,tempY-tempRadius/6,tempRadius/26,tempRadius/26);
    ellipse(tempX-tempRadius/11,tempY-tempRadius/6,tempRadius/26,tempRadius/26);

  //beak
  fill(255,232,15);
  triangle(tempX-tempRadius/10,tempY-tempRadius/10,tempX-tempRadius/10,tempY-tempRadius/35,tempX-tempRadius/4,tempY-tempRadius/35);//top
  triangle(tempX-tempRadius/10,tempY-tempRadius/40,tempX-tempRadius/10,tempY-tempRadius/190,tempX-tempRadius/4,tempY-tempRadius/35);//bottom
 //wing
 //noStroke();
  //fill(117,13,171);
 // triangle(300,220,360,220,340,265);

}



