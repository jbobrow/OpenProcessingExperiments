
//Tapestry 4
// just type here
// and click "submit" when done

int frame = 0;

void setup() {
  size(1920,1080);
  background(255);
  drawVignettingEffect();
  smooth();
  fill(255,0,0,10);
  stroke(104,70);
  strokeWeight(1);
}

void draw() {
  frame++;
  for( int i = 0; i < 1100; i++ ) {
    int x = int(random(0,width));
    int y = int(random(0,height));
    
  stroke(104,70,5,50);
    line(x+10.0*cos(x/20.0),y,x+10.0*cos((x+y)/10.0),y+10.0*sin((x+y)/10.0));  
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
}
//===========SaveImage
void keyReleased() {
  if (key=='s' || key=='S') saveFrame(timestamp()+".png"); }
  String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}
 
//==============
