
  color back= color(255);
  color c= color(random(255), random(255), random(255), random(255));
  color brake=color(250,0,0);
  color windows=color(0); 
  float xpos=25;
  float ypos=63;
  float cx = 250;
  float cy = 250;
  float r = 100;//Distance from cx/cy


    void setup()
{
  size(500, 500);
  strokeWeight(2);
  
  
}

void draw()
{
  background(back);
  fill(80);
  ellipse(250,250,460,460);
  fill(back);
  ellipse(250,250,150,150);
  rectMode(CENTER);
 
  float t = millis()/1000.0f;
  int x = (int)(cx+r*cos(t));
  int y = (int)(cy+r*sin(t));
  
  pushMatrix();
  translate(x, y);
  rotate(t);
  
   fill(c); 
rect(xpos,ypos,50,125,5,5,20,20);
rect(xpos,ypos-13,40,50);
ellipse(xpos+30,ypos+35,10,5);//RIGHT MIRROR
ellipse(xpos-30,ypos+35,10,5);//LEFT MIRROR

fill(windows);
quad(xpos-23,ypos+37,xpos-20,ypos+12,xpos+20,ypos+12,xpos+23,ypos+37);//FRONT WINDOW BL,TL,TR,BR
quad(xpos-20,ypos-33,xpos-23,ypos-48,xpos+23,ypos-48,xpos+20,ypos-33);//BACK WINDOW BL,TL,TR,BR
fill(brake);
rect(xpos-18,3,8,3);//LEFT BRAKELIGHT
rect(xpos+17,3,8,3);//RIGHT BRAKELIGHT
  popMatrix();
  if(mousePressed==true){
      c=color(random(255), random(255), random(255), random(255));
 }
}



    



