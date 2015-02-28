
void setup(){
size (450,550);//set the size
background(250);//set the background color
smooth();
strokeWeight(2);
}


void draw(){
  //set the hair
  for(int x=15; x<=width;x=x+35){
    for(int y=8; y<=height/2-120;y=y+18){
      noFill();
      ellipse(x,y,25,10);
    }
  }

  noFill();
  line(200,290,200,350);//left nose
  arc(195,375, 50, 15, PI+QUARTER_PI, TWO_PI, OPEN);//left nostril
  line(250,290,250,350);//right nose
  arc(255,375, 50, 15, PI, TWO_PI-QUARTER_PI, OPEN);//right nostril
  ellipse(width/2,190,8,8);//nevus
  line(50,215,150,215);//left eyebrow
  line(400,215,300,215);//right eyebrow

  
  arc(108,240, 100, 10, 0, PI, OPEN);//left eye
  arc(110,246, 90, 10, 0, PI, OPEN);//left eyelid
  arc(342,240, 100, 10, 0, PI, OPEN);//right eye
  arc(340,246, 90, 10, 0, PI, OPEN);//right eyelid
  arc(190,450, 110, 30, PI+QUARTER_PI, TWO_PI-QUARTER_PI, OPEN);//leftuplip
  arc(260,450, 110, 30, PI+QUARTER_PI, TWO_PI-QUARTER_PI, OPEN);//rightuplip

if(mousePressed==true){
  int a = floor(random(255));
  int b = floor(random(255));
  int c = floor(random(255));
    fill(a,b,c);
    quad(155,440,100,550,350,550,290,440); 
  }else{
  arc(width/2,435, 140, 25, 0, PI, OPEN);//middlelip
  arc(width/2,442, 130, 32, 0, PI, OPEN);//lowlip
  }
}
