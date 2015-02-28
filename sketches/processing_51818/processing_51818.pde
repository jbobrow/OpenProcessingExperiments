
int app=0;
float gradient=400;
float generate = 0;
float verticalShift[] = {4, 4, 5, 5, 5, 6, 6, 6, 7, 7};


String letters[] = {"e", "v", "a", "p", "o", "r", "a", "t", "e"};
int count = 0;

LinkedList<SmallWord> words = new LinkedList<SmallWord>();

void setup(){
 size(400,600);
 background(255);
 frameRate(30);
 fill(0,126,255);
 textSize(85);
 text("evaporate",0,495);
 text("evaporate",0,540);
 text("evaporate",0,585);
 noCursor();
}

void draw(){ 
   background(255);
   //evaporate text
   fill(0,126,255);
   textSize(85);
   text("evaporate",0,495);
   text("evaporate",0,540);
   text("evaporate",0,585);
   fill(255,255,255);
   //cover up the part that should have disappeared
   quad(0,399,400,399,400,gradient,0,gradient);
   if (gradient < 600) {
     //mouse closer, evaporate faster
     drawGradient(gradient);
     float y = map(mouseY,0,600,0.05,0.8);
     gradient += y;
     generate += y;
     if (generate >= 1) {
       generate -= 1;
       words.add(new SmallWord(gradient));
       count++;
     }
   }
   for (SmallWord word : words) {
     word.draw();
   }
   
   for (Iterator<SmallWord> iter = words.iterator(); iter.hasNext(); ) {
     SmallWord word = iter.next();
     if (word.alpha == 0)
       iter.remove();
   }
   float appcos=50+25*cos(radians(app*4));
   mouseSun(appcos);
   app++;
}

//the sun
void mouseSun(float app1){
 pushMatrix();
 translate(mouseX,mouseY);
 
 float aparency=240;
 //halo
 for(float r=50+app1;r>50;r=r-1){
   noStroke();
   fill(255,255,aparency,240-aparency);
   ellipse(0,0,r,r);
   aparency-=3;
 }
 //core sun
 noStroke();
 fill(255,255,0);  
 ellipse(0,0,50,50);  
 popMatrix();
}
   
 
//evaporate  
void drawGradient(float gradientY){
 noStroke();
 float cor=255;
 for(int i=0;i<=70;i++){
   float gY=gradientY+i;
   cor=cor-3.5;
   fill(255,255,255,cor);
   quad(0,gY,400,gY,400,gY+1,0,gY+1);
 }
}

float deltaRotate = TWO_PI * 3 / 150;

class SmallWord {
  int x;
  int y;
  float alpha = 0;
  float rotate = random(TWO_PI);
  int t = 0;
  String text;
  
  public SmallWord(float line) {
    x = (int)random(width);
    y = (int)line + 2;
    text = letters[count % 9];
  }
  
  float getDAlpha() {
    float distance = sqrt((x - mouseX) * (x - mouseX) + (y - mouseY) * (y - mouseY));
    return (distance > 200) ? -0.8 : (-30 + map(distance, 0, 200, 0, 30));
  }
  
  void draw() {
    alpha += (t < 10) ? 25 : getDAlpha();

    int newx = x + (int)(10 * sin(rotate));
    int index = int(random(verticalShift.length));
    y -= verticalShift[index];
    if (y < 0) {
      y = 0;
      alpha = 0;
    }

    textSize(25 - t / 10);
    fill(0,128,255,alpha);
    rotate += deltaRotate;
    pushMatrix();
    translate(newx,y);

    rotate(rotate);
    text(text, 0, 0);
    popMatrix();
    t++;
  }
}


