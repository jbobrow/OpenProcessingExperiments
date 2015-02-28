
float counter = 24;
float colorb;
float colorh;

boolean rotation = false;

void setup()
{
size(500,500);
noStroke();

}
void draw(){
 translate(width/2, height/2);
 
 colorh= map(hour(),0,23,60,0);
   
 
 if(hour()>18){
 
   colorb = map(hour(),17,23,100,0);
 
 }
  if(hour()<6){
 
   colorb = map(hour(),0,6,0,100);
 }
 if(hour()>=6 && hour() <=18){
 
   colorb = 100;
 }
 
 colorMode(HSB, 360, 100, 100);
  background(colorh, 100, colorb);
 if (mousePressed == true)
{
 
  
  colorMode(RGB, 255);
  float h = map(hour(),0,12,0,200);
  pushMatrix();
  //translate(width/2, height/2);
  fill(255,255,255,70);
  ellipse(0,0,h,h);
  popMatrix();
   
  float min = map(minute(),0,60,0,200);
  pushMatrix();
  //translate(width/2, height/2);
  fill(255,255,255,70); 
  ellipse(0,0,min, min);
  popMatrix();
   
  float sec = map(second(),0, 60, 0, 200);
  pushMatrix();
  //translate(width/2, height/2);
  fill(255,255,255,70);
  ellipse(0,0,sec, sec);
  popMatrix();
}
  
  else
  {
  
      if(hour()<6){
     
      if(rotation =false){rotate(radians(180))
      rotation=true;
      }
    
    if(rotation =false){rotate(radians(180));
       println("hallo1");}
      rotation=true;
      }
      
    if(hour()>18 && hour()<23){
    if(rotation =true){rotate(radians(180)); }
      rotation=false;
      
  }
    if(hour()>=12 && hour() <=18){
    if(rotation =false){rotate(radians(180)); }
      rotation=true;
      
  }
  
  
  colorMode(RGB, 255);
  
  float h = map(hour(),0,23,0,200);
  pushMatrix();
  fill(255,255,255,80);
  ellipse(0,h-125,h,h);
  popMatrix();
   
  float min = map(minute(),0,60,0,200);
  pushMatrix();
  fill(255,255,255,80);
  ellipse(0,min-125,min, min);
  popMatrix();
   
  float sec = map(second(),0, 60, 0, 200);
  pushMatrix();
  fill(255,255,255,80);
  ellipse(0,sec-125,sec, sec);
  popMatrix();
  }
}
