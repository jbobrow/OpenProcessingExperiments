

Maxim maxim;

AudioPlayer playerBird;
AudioPlayer playerCat;
AudioPlayer playerGoat;

PImage bird;
PImage cat;
PImage goat;
PImage rooster;
boolean buttonOnBird;

void setup()
{
  size(400, 400);
  background(255, 255, 255);

  maxim=new Maxim(this);
  
  playerBird=maxim.loadFile("bird.wav");
  playerCat=maxim.loadFile("cat.wav");
  playerGoat=maxim.loadFile("goat.wav");
  playerRooster=maxim.loadFile("rooster.wav");
  
  bird=loadImage("bird.jpg");
  cat=loadImage("cat.jpg");
  goat=loadImage("goat.jpg");
  rooster=loadImage("rooster.jpg");
  
  buttonOnBird=false;
  buttonOnCat=false;
  buttonOnGoat=false;
  buttonOnRooster=false;

}

void draw()
{
  image(bird, 0, 0, 200, 200);
  image(cat, 0, 200, 200, 200);
  image(goat, 200, 0, 200, 200);
  image(rooster, 200, 200, 200, 200);

  strokeWeight(2);
  line(0, 200, 400, 200);
  line(200, 0, 200, 400);
}


void mousePressed()
{
  playerBird.cue(0);
  if(mouseX<width/2){
    if(mouseY<height/2){
    buttonOnBird=!buttonOnBird;
    if(buttonOnBird){
      playerBird.play();
    }
    else{
      playerBird.stop();
    }
    }
  }
     
  playerCat.cue(0);
  if(mouseX<width/2){
    if(mouseY>height/2){
    buttonOnCat=!buttonOnCat;
    if(buttonOnCat){
      playerCat.play();
    }
    else{
      playerCat.stop();
    }
    }
  }
  
  playerGoat.cue(0);
  if(mouseX>width/2){
   if(mouseY<height/2){
    buttonOnGoat=!buttonOnGoat;
    if(buttonOnGoat){
      playerGoat.play();
    }
    else{
      playerGoat.stop();
    }
   }
  }
  
  playerRooster.cue(0);
  if(mouseX>width/2){
   if(mouseY>height/2){
    buttonOnRooster=!buttonOnRooster;
    if(buttonOnRooster){
      playerRooster.play();
    }
    else{
      playerRooster.stop();
    }
   }
  }
}

//Ornela Katsifi 2013 
//So happy to have finished my first assignment :)



