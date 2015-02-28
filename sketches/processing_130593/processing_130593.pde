


color topColor;
color bottomColor;


void setup(){
  size(200,200);
   smooth();

  background(0);
  stroke(0);
  strokeWeight(2);
}


void draw(){
  fill ( 0,0,0, 20);
  rect (-1, -1, width + 1 , height + 1);

  float mY = mouseY;
  float bottom = ((mY/200) * 200 ) / 2;
  
  if(mouseY > 100){
    bottomColor = color(170,154,239);
    topColor = color(240,  248,  255  );
  }else{
     bottomColor = color(240,  248,  255  );
    topColor =color(170,154,239) ;
    
  }
  
 stroke(topColor);

  line( 100 - (100 - bottom),0,100, mouseY);
  line( 100 + (100 - bottom),0,100, mouseY);
  
  stroke(bottomColor);

  line(100 - bottom,200, 100, mouseY);
  line(100 + bottom,200, 100, mouseY);

}
