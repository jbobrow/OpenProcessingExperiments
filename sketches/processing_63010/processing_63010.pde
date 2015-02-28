
int frame = 0;

void setup() {
  size(920,500);
  background(255);
  drawVignettingEffect();
  smooth();
  fill(255,0,0,10);
  stroke(104,70);
  strokeWeight(1);
}

void draw() {
  frame++;
  //background(255,255,255,10);
  // Draw points
  for( int i = 0; i < 100; i++ ) {
    //float distance = 450.0 - random(0,width) * 30;
    //float angle = random(0,2*PI);
    int x = int(random(0,width));
    int y = int(random(0,height));
    stroke(204,27,200,10);
    //ellipse(width/112+x,height/112+y,4,4);

    line(x,y,x+110.0*sin(x/50.0),y+110.0*sin(y/50.0));  
  }

}



void drawVignettingEffect(){
  smooth();
  background(255);
  strokeWeight(180);
  noFill();
  stroke(180,180,180,5);
  translate(width/2,height/2);
  for (int i = 0; i < 300; i+=10){
    ellipse(0,0,max(width+i,height+i),max(width+i,height+i));
  }
  resetMatrix();
}//===========SaveImage
void keyReleased() {
  if (key=='s' || key=='S') saveFrame(timestamp()+".png"); }
  String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}
 
//==============
