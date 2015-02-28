


void setup(){
  size(500, 500);
  background(255);
  smooth();
  color fc = color(52, 119, 224);
  color sc = color(241, 250, 8);
  
  fill(241, 250, 8);//outter ellipse
  stroke(241, 250, 8);
  ellipse(width/2, height/2, 405, 405);
  
  fill(240, 77, 205);//second ellipse
  stroke(240, 77, 205);
  ellipse(width/2, height/2, 355, 355);
  
  polyStar(width/2, height/2, 7, 100.0, 200.0, fc, sc, 3, 0.0);
  polyStar2(width/2, height/2, 7, 40.0, 80.0, color(52, 119, 224),
    color(240, 77, 205), 7, 0.0);
  polyStar2((width/2), (height/2), 7, 30.0, 60.0, color(52, 119, 224),
    color(241, 250, 8), 7, 0.0);
  
  fill(240, 77, 205);
  stroke(240, 77, 205);
  ellipse(160, 130, 20, 20);//top left
  ellipse(width-150, 130, 20, 20);//top right
  ellipse(160, height-140, 20, 20);//bottom left
  ellipse(width-160, height-140, 20, 20);//bottom right
}


