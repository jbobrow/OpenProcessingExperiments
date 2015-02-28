
// project by bernard for processing coursera class
// take 1 - processing improvisations

// idea - sounds by wineglasses


Maxim maxim;
AudioPlayer player1;
AudioPlayer player2;
AudioPlayer player3;
AudioPlayer player4;
AudioPlayer player5;


boolean glass1Playing = false;
boolean glass2Playing = false;
boolean glass3Playing = false;
boolean glass4Playing = false;
boolean pouringPlaying = false;

float margin = width/64;
int glass1x, glass1y;
int glass2x, glass2y;
int glass3x, glass3y;
int glass4x, glass4y;
//int circlesize = width/4;




void setup()
{
    size(640,960);
    
    background(255);
    maxim = new Maxim(this);
    player1 = maxim.loadFile("glass1_long_mono.wav");
    player2 = maxim.loadFile("glass2_short_mono.wav");
    player3 = maxim.loadFile("glass3_short_mono.wav");
    player4 = maxim.loadFile("glass1_short_mono.wav");
    player5 = maxim.loadFile("pouring_only.wav");
    player1.setLooping(false);
    player2.setLooping(false);
    player3.setLooping(false);
    player4.setLooping(false);
    player5.setLooping(false);

 
}

void draw()
{
  ellipseMode(RADIUS);
   
  //ellipse1
  noStroke(0);
  fill(255,0,0,70);
  glass1x=width*(1/4);
  glass1y=height*(1/4);
  ellipse(glass1x,glass1y, (width/4)-margin, (width/4)-margin);
  
  noStroke(0);
  fill(0,255,0,70);
  glass2x=width*(3/4);
  glass2y=height*(1/4);
  ellipse(glass2x,glass2y, (width/4)-margin, (width/4)-margin);
  
  //ellipse3
  noStroke(0);
  fill(0,0,255,70);
  glass3x=width*(1/4);
  glass3y=height*(3/4);
  ellipse(glass3x,glass3y,(width/4)-margin, (width/4)-margin);
  
  //ellipse4
  noStroke(0);
  fill(0,255,255,70);
  glass4x=width*(3/4);
  glass4y=height*(3/4);
  ellipse(glass4x,glass4y,(width/4)-margin, (width/4)-margin);

  //bottle
  rectMode(CENTER);
  noStroke(0);
  fill(230,100,50,50);
  rect(width/2,height/2,width/2,height/8);
  
  stroke(0);
  point(width - (width*(3/4)),height/2);
  point(width/2,height/2+(height/16));
  
  
}

void mousePressed()
{
  //pouring
  if((mouseX >= (width-(width*(3/4)))) && (mouseX <= (width-(width*(1/4))))
     && (mouseY <= (height/2+(height/16))) && (mouseY >= (height/2-(height/16)))
  ) {
   //player1.cue(0);

    pouringPlaying = !pouringPlaying;
    //player5.play();
  }
   if (pouringPlaying) {
    player5.play();
    }
    else {
      player5.stop();
    }
  
}



void mouseDragged()
{
  //glass1
  if(dist(mouseX,mouseY, glass1x, glass1y) < (width/4)-margin) {
   //player1.cue(0);
    glass1Playing = !glass1Playing;
    //player1.play();
  }  
  if (glass1Playing) {
    player1.play();
    }
    else {
      player1.stop();
    }

  
  //glass2
  if(dist(mouseX,mouseY, glass2x, glass2y) < (width/4)-margin) {
    glass2Playing = !glass2Playing;
    //player2.play();
  }
  
  if (glass2Playing) {
    player2.play();
  }
  else {
    player2.stop();
  }
  
  //glass3
  if(dist(mouseX,mouseY, glass3x, glass3y) < (width/4)-margin) {
    glass3Playing = !glass3Playing;
    //player3.play();
  }
  
  if (glass3Playing) {
    player3.play();
  }
  else {
    player3.stop();
  }
  
   //glass4
  if(dist(mouseX,mouseY, glass4x, glass4y) < (width/4)-margin) {
    glass4Playing = !glass4Playing;
    //player4.play();
  }
  
  if (glass4Playing) {
    player4.play();
  }
  else {
    player4.stop();
   }
  
}




