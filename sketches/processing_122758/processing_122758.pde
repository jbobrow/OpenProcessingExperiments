
int x,y;
 
void setup() {
  size(600, 600);
  noStroke();
  smooth();
  background(0);
  x = width/2;
  y = height/2;
 }
 //setup
 
 void heart(float centerX, float centerY, float width, float height){
  final float WIDTH = width / 2 * 0.85;
  final float HEIGHT = height / 2;
  final float OFFSET = centerY - (HEIGHT / 6 * 5);
  beginShape();
  for(int i = 0; i < 30; i++){
    float tx = abs(sin(radians(i * 12))) * (1 + cos(radians(i * 12))) * sin(radians(i * 12)) * WIDTH + centerX;
    float ty = (0.8 + cos(radians(i * 12))) * cos(radians(i * 12)) * HEIGHT + OFFSET;
    vertex(tx, ty);
  }
  endShape(CLOSE);
}
//heart
 
 void draw(){
 if(key == '1') 
 fill(0);  //kesigomu
 else if (key == '2')
 fill(255,random(255),random(255),5); //pink
 else if (key =='3')
 fill(random(255),255,random(255),5); //green
 else if (key =='4')
 fill(random(255),random(255),255,5); //blue
 else if (key == '5')
 fill(150,random(255),random(255),5); //purple&yellowish
 else if (key == '6')
 fill(random(255),150,random(255),5); //yellowish
 else if (key == '7')
 fill(random(255),random(255),150,5); //blue&green&violet
 else if (key == '8')
 fill(random(255),random(255),random(255),5); //colorful
 else if (key == '9')
 background(0); //subetekesu
 
;}
 
 void mouseDragged(){
 if (mousePressed) {
    heart(mouseX, mouseY, 200, 200);  
  } //heart
}
 



