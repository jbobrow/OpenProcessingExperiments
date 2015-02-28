
void setup(){
size(700, 500);
bg = color(255);
  
  
}

color bg;
boolean trails=false;

 void draw(){
   
  if(!trails){
     background(bg);
  } 
 
  
  
  translate(width/2, height/2);
  float a = atan2(sin(frameCount / 40.0), cos(frameCount / 50.0));
  rotate(a);
  float shapeSize = sin(frameCount / 50.0) * 100;
  float px = sin(frameCount / 50.0) * 200;
  float py = cos(frameCount / 20.0) * 200;
  ellipse(px, py, shapeSize, shapeSize);
  
  
  
  
   translate (width/10, height/10 );
  float b = atan2(sin(frameCount / 40.0), cos(frameCount / 40.0));
  rotate(b);
  float shapeSize2 = sin(frameCount / 50.0) * 100;
  float qx = sin(frameCount / 40.0) * 200;
  float qy = cos(frameCount / 20.0) * 200;
  ellipse(qx, qy, shapeSize2, shapeSize2);
  
  
  
   translate (width/4, height/4);
  float c = atan2(sin(frameCount / 40.0), cos(frameCount / 40.0));
  rotate(c);
  float shapeSize3 = sin(frameCount / 50.0) * 100;
  float bx = sin(frameCount / 30.0) * 200;
  float by = cos(frameCount / 20.0) * 200;
  ellipse(bx, by, shapeSize3, shapeSize3);
  
  
   //translate (width/20, height/20);
  //float b = atan2(sin(frameCount / 50.0), cos(frameCount / 40.0));
 //rotate(b);
  //float shapeSize2 = sin(frameCount / 50.0) * 100;
 // float qx = sin(frameCount / 80.0) * 200;
 // float qy = cos(frameCount / 10.0) * 200;
 // ellipse(qx, qy, shapeSize2, shapeSize2);
  
  
}
   
void keyPressed(){

  // space changes bg
  if (key == ' '){
     bg = color(random(255), random(255), random(255));
   }
   
   // s key saves frame
   if (key == 's'){
     saveFrame("coolframe-####.png");
   }
   
   // t key toggles trails
   if(key == 't'){
     trails=!trails;
     
   }
   
}

