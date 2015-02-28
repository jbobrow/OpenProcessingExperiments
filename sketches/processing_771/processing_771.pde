
//universals
float angle = 0;
float x = 0;
float y = 150;
float z;
int increment = 0;
boolean wave = true;
int wavetype = 0;
float fadeout = 255;
float radius = 20;
int ball = 10;
color bck = color(0);


void setup(){
  size(1280, 710);
  smooth();
}

void draw(){

  x+=increment;

  //transparency
  fill(bck, fadeout);
  rect(20, 0, width-20, height);
  //different faders for rects over speed meter to fade it even when 'fadeout' variable is 0 and not allowing for any fades
  fill(bck, 255);
  rect(0, 0, 20, height);
  rect(width- 20, 0, 20, height);
  

  //right to left refresh
  if (x > width){
    x = 0;
  }

  //blinker
  
  if( ((x > (width/2)-20) && (x < (width/2 + 25)))  ||  (x > (width - 40)) ){

   fill(255, 200, 200, 100);

    ellipse((width/2), 10, 10, 10);
  }

  //meter
  //speed
  fill(255, 200, 200);
  rect(0, (height-(increment*4)), 10, height);
  //fadeout rate
  float fade = map(fadeout, 255, 0, 0, (height));
  fill(100, 255, 100);
  rect(width-10, height-(fade), 10, height);
  //ball size
  float ballsize = map(ball, 1, 700, 0, height);
  fill(255, 255, 100);
  rect(10, height - ballsize, 10, height);
  //amplitude
  float amplitude = map(radius, 1, (height/2.2), 0, height);
  fill(255, 0, 100);
  rect(width - 20, height - amplitude, 10, height);

  //buttons
  
  
  fill(255, 100, 100, 50);
  //speed up
  stroke(255, 100, 100);
  rect((width/2 - 10), (height - 10), 20, height);
  //slow down
rect((width/2 + 30), (height - 10), 20, height);
  //disappear
    fill(225, 225, 225, 50);
  stroke(225, 225, 225);
  rect((width/2 + 70), (height - 10), 20, height);
  //more tracer
    fill(100, 255, 100, 50);
  stroke(100, 255, 100);
  rect((width/2 + 110), (height - 10), 20, height);
  //less tracer
  rect((width/2 + 150), (height - 10), 20, height);
  //amplitude down
    fill(255, 0, 100, 50);
  stroke(255, 0, 100);
  rect((width/2 -50), height - 10, 20, height);
  
//amplitude up
   rect((width/2 - 90), height - 10, 20, height);
   //ball size down
     fill(255, 255, 100, 50);
  stroke(255, 255, 100);
    rect((width/2 - 130), height - 10, 20, height);
  //ball size up
  rect((width/2 - 170), height -10, 20, height);
  
  noStroke();

//amplitude up
        if(mousePressed && ((mouseX> (width/2) -90) && (mouseX < ((width/2) - 50)) && (mouseY > (height - 10)))){
      radius+=3;
      if(radius > (height/2.2)){
        radius = height/2.2;
      }
    }
    //amplitude down
     if(mousePressed && ((mouseX> (width/2) -50) && (mouseX < ((width/2) - 30)) && (mouseY > (height - 10)))){
      radius-=3;
      if(radius < (0)){
        radius = 0;
      }
    }

//speed up
  if(mousePressed && ((mouseX > (width/2 - 10)) && mouseX < ((width/2) + 10))&& (mouseY > (height-20))){
 increment++;
      if(increment > (height/4)){
        increment = (height/4);
      }
    }
  
    //speed down
     if(mousePressed && ((mouseX > (width/2 + 30)) && mouseX < ((width/2) + 50))&& (mouseY > (height-20))){
 increment--;
      if(increment < (0)){
        increment = 0;
      }
    }
    
    
    //less tracers
    if(mousePressed && ((mouseX> ((width/2) + 150)) && (mouseX < ((width/2) + 170)) && (mouseY > (height - 10)))){
      fadeout+=5;
      if(fadeout > (255)){
        fadeout = 255;
      }
    }
    
    //more tracers
    if(mousePressed && ((mouseX> ((width/2) + 110)) && (mouseX < ((width/2) + 130)) && (mouseY > (height - 10)))){
      fadeout-=5;
      if(fadeout < (0)){
        fadeout = 0;
      }
    }
  //ball increase
  if(mousePressed && ((mouseX> ((width/2) -130)) && (mouseX < ((width/2) -110)) && (mouseY > (height - 10)))){
       ball-=3;
      if(ball < 1){
        ball = 1;
      }
    }
    //ball decrease
if(mousePressed && ((mouseX> ((width/2) - 170)) && (mouseX < ((width/2) -150)) && (mouseY > (height - 10)))){ 
      ball+=3;
      if(ball > 700){
        ball = 700;
      }
    }


  //sine wave
  if(wavetype < 5){
    angle++;
    z = (height/2) + sin(angle)*radius;
    fill(200, 200, 200);
    ellipse(x, z, ball, ball);

  }



}

void mouseReleased(){ 
  if((mouseX > (width/2 + 70)) && mouseX < ((width/2) + 90)){
    if((mouseY > (height-20))){
    wavetype += 10;
    if(wavetype > 10){
      wavetype = 0;
    }
  }
}
}

