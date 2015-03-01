
float counter = 0;

PFont font_marisa;

void setup()
{
  size(500,500);
  smooth();
  
  font_marisa = createFont("FiraSans-Regular.ttf", 100, true);
  
}

void draw()
{  
  background(0);
 translate(mouseX,0);
 
 pushMatrix(); 
 translate(0,height/2);
 colorMode(HSB,360,100,100);
 
   float helligkeit = map(sin(counter/80),-1,1,20,100);
   float farbe = map(sin(counter/80),-1,1,10,40);
float farbe2 = map(sin(counter/80),-1,1,200,350);
  
  for (int i=0; i<360; i+=15)
  {
    
    fill(farbe,100,helligkeit); 
    rotate(radians(i));
    
    float radius = 150+10*sin((millis()/10.0));
    //line(counter,0,radius,0);
      
  textFont(font_marisa);
  textSize(25);
  textAlign(CENTER, CENTER);
  text("Fire", counter, 0);
    
  }

for (int i=25; i<360; i+=15)
  {
    fill(farbe2,100,helligkeit); 
    rotate(radians(i));
    
    float radius = 150+10*cos((millis()/50.0));
    //line(radius,0,radius,0);
    
    textFont(font_marisa);
  textSize(35);
  textAlign(CENTER, CENTER);
  text("work", counter, 0);
  }
 popMatrix();
 
  pushMatrix();
  translate(-width/2,0);
  for (int i=0; i<20; i++)
  {
    noFill();
    stroke(255);
    ellipse(random(100,400),random(100,400),4,4);
  
  }
  popMatrix();
  
  if (counter<400)
  {
  counter += 5;
  }
  else
  {
    counter = 0;
  }
  stroke(360,10,100);
  line(0, height+10,0,height-counter+180);
}
