
PFont font;
float hourX;
float minuteX;
float secondX;
PImage cookie;
PImage cookies;

void setup() {
  size(800,600);

 font = loadFont("aa.vlw");
 cookie= loadImage("cookie.png");
 cookies= loadImage("cookies.png");
}

void draw() {
  
 
 
  background(120); 
  fill(240);
  textFont(font);


 

  hourX = map(hour(),0,46,0,(height-10)); 
  minuteX = map(minute(),0,118,0,(width-10)); 
  secondX = map(second(),0,118,0,(width-10));


  imageMode(CENTER);
tint(255,255,255,200);
  image(cookie,width/2,height/2,hourX,hourX);
   
   
  

  imageMode(CENTER);
  tint(255,255,255,100);
  image(cookies,(width/2)-5,height/2,secondX,secondX);
  
  
 fill(123,104,238,0);
 strokeWeight(2);
 stroke(238, 130 ,238);
 ellipse(width/2,height/2,minuteX,minuteX);
 
 
  fill(64 ,224, 208);
 text(hour()+"hrs",width/2-hourX/2-55 ,(height/2)+10);  

 fill(238, 130 ,238);
 text(minute()+"mins",(width/2)-30,(height/2)+(minuteX/2)+55); 
  fill(240,230, 140);
 text(second()+"secs",width/2+secondX/2 ,(height/2)+10);  
 

}



