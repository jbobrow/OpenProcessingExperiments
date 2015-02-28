
float mapnum = 0;
float circlesize = 0;

void setup() {
  size(800, 800);
  smooth();
  colorMode(HSB,360,100,100);
}

void draw() {
  //background(mapnum, 100, 100);
  noStroke();
  
  if(mouseY < height/2 ){
    fill(200,mapnum,100);
  }
  else if(mouseY > height/2 && mouseY<height/2+100){
    fill(120,mapnum,100);
  }
  
  else{
    fill(50,mapnum,100);
  }
  mapnum = map(mouseX, 0, width, 0, 100);
  circlesize = map(mouseY,0,height,50,100);
  ellipse(mouseX,mouseY,circlesize,circlesize);
  println(mapnum);

}
