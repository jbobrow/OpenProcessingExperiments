

void setup(){
  size (1000,700);
  background(0);
  smooth();
  frameRate(10);

}


void draw(){


  if (mousePressed == true){
    fill(0);
    rect(0,0,width,height);
  }
  if (keyPressed == true){
    saveFrame("blot####.tif");

  }



  //background(255);
  int totalPoints = 10;
  int origin = width/2;

  float rand = random(6);
  float padding = random(height/4,3*height/4);
  float xpos = random(width/2-padding);
  float ypos = random(height/4,3*height/4);




  for (int i=100;i<200;i++){
    stroke(i/rand,i/rand,i,rand);

    for (int j=0;j<totalPoints;j++){



      strokeWeight(random(20));
      point(origin-xpos,ypos);
      point(origin+xpos,ypos);

      xpos+=random(-rand,rand);
      ypos+=random(-rand,rand);
    }


  }
}


