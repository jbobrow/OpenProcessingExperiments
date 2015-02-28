
//liamallman@ucla.edu
Circle r1;

int numDrops = 1;
Circle[] drops = new Circle[numDrops];

int[] randxpos = new int[4];

int x = 85;

//SHAPES

void setup(){
  background(255);
  size(640,480);
  noStroke();
  
   for (int i = 0; i < drops.length; i++) {

    drops[i] = new Circle();
    r1 = new Circle();
  }

randxpos[0] = x;
randxpos[1] = x + 90;
randxpos[2] = x + 180;
randxpos[3] = x + 270;
}
  
class Circle {
  float r;
  float y = height+100;

  void fall() {
    y = y + 5;
    fill(0,10,200,180);
    ellipse(r, y, 50, 50);

   if(y>height){
   r = randxpos[int(random(0,randxpos.length))];
   y = random(-200);
   }
  
  }
}

void draw(){
 smooth();
 background(255);

 fill(255);
  rect(0,0,600,600);

  for (int i = 0; i < drops.length; i++) {
    drops[i].fall();
  }

  


 //neck
 fill(150);
 quad(557,175, 605,175, 605,height, 557, height);
 
 //lowerjaw
 fill(150);
 quad(461,255, 461,297, 605,297, 605,255 );
 
 //head
 fill(150);
 quad(461,109, 461,175, 605,175, 605,109);
 ellipse(532,110, 143, 55);
 
 //eyes
 fill(0);
 ellipse(488,145, 10,10);
 ellipse(580,130, 10,10);

  
  beginShape();
  vertex(40,480);
  vertex(460,480);
  vertex(480,460);
  vertex(480, 450);
  vertex(460, 460);
  vertex(40, 460);
  vertex(20, 450);
  vertex(20,460);
  endShape();
  fill(40);
  beginShape();
  vertex (x-5, 360);
  vertex (x-5, 480);
  vertex (x+5, 480);
  vertex (x+5, 360);
  vertex (x+35, 350);
  vertex (x+35, 340);
  vertex (x+5, 350);
  vertex (x-5, 350);
  vertex (x-35, 340);
  vertex (x-35, 320);
  vertex (x-45, 320);
  vertex (x-45, 340);
  vertex (x-35, 350);
  endShape();

 // if (millis()-timeStamp>1000,
  //function triggers now
//millis()=timeStamp

//if (abs(x-drops[0].r) < 10  && (y+5)>340 && (y+5)<360 ) {
  
  if (drops[0].r > x-45 && drops[0].r < x+35 && drops[0].y > 320 && drops[0].y < 330) {
  
println("hit");  
drops[0].y=height + 900;
}


}




void keyPressed(){
  if(keyCode==LEFT){x=x-90;}
  else if (keyCode==RIGHT){
    x=x+90;}
    if (x<85){x=85;}
    if (x>355){x=355;}
    
    
}



