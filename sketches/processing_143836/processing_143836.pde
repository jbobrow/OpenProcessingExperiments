
float y;

void setup(){
  size(700,500);

frameRate(10);
}
  
  void draw(){

    background(250);
    //fill(0,10);
    noFill();
    stroke(0);
    for( x =30; x < width-30; x = x+30){
      for( y = 20; y < height-20; y = y+random(20)){
        strokeWeight(random(.5,1.5));
        rectMode(CENTER);
        rect(x,y,random(10,20),random(10));
        ellipse(x,y,random(20),random(10));
       rect(x,y,random(10,20),random(10));
        ellipse(x,y,random(20),random(10));
    }
    }
    if (mousePressed){
      saveFrame( " ####.png");
     // saveFrame("images/export-"+"-#####.png");
//if ( frameCount >= 900 ) {
     // exit();}

    }
  }
