
String fType = "Copperplate";
PFont largeFont = createFont(fType, 34, true), normalFont;
PImage bg;
int steelBlue = 0xff1f77b4;
String minutes, seconds;

public void setup(){
  size(170,150);
  //largeFont = Font("Copperplate-24.vlw");
  normalFont = createFont("Courier",12,true);
  bg = loadImage("texture-noise.png");
  bg.resize(width+10,height+10);
  frameRate(50);
  textAlign(CENTER,CENTER);
}


public void draw(){
  image(bg,0,0);
  fill(steelBlue);
  int time = floor(millis()/1000);
  minutes = str(floor(time/60)); seconds = str(time%60); 
  if(seconds.length()==1) seconds = "0"+seconds; 
  String elapsed = "[Elapsed Time:" +  minutes + ":" + seconds +"]";
  textFont(normalFont);
  text(elapsed,width/2,10);
  
  translate(width/2,height/2+10);
  stroke(50); strokeWeight(4); noFill();
  ellipse(0,0,100,100);
  float theta = TWO_PI*millis()/1000-HALF_PI;
  stroke(50);
  line(0,0,50*cos(theta),50*sin(theta));
 
  fill(steelBlue); textAlign(CENTER,CENTER); textFont(largeFont);
  
  text(time,0,-2);//random(-2,2),-2+random(-2,2));
}



