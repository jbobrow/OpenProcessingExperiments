
int crazyBetty;
int dir;

void setup(){
  size(600,800);
  smooth();
  colorMode(HSB,360,100,100,100);
  crazyBetty = 0;
  dir = 10;
  strokeWeight(11);
}

void draw(){
  if(mousePressed){
    stroke(crazyBetty,56,145);
    crazyBetty++;
    background(crazyBetty++, 75, 100, 50);
      line(crazyBetty*3+crazyBetty,crazyBetty*2,34,crazyBetty);
      rect(crazyBetty*2,crazyBetty,34,40);
      ellipse(crazyBetty*20, crazyBetty*15, 300,400);
      crazyBetty+=dir;
       if(crazyBetty > 600){
         dir = -10;
       }
       if (crazyBetty <=0){  
         dir = 10;
         

  }

}
}
    

