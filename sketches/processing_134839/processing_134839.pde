
int y = 0;
int speed = 10;



void setup() {
  int s1 = 400;
  size(s1,s1);
  background(255);
  smooth();
  }
  
/*
void smiley(){
  
  fill(random(300),random(300),random(300));
  ellipse(smileCordx,smileCordy,100,100);
  fill(0);
  ellipse(smileCordx-20,smileCordy-15,16,32);
  ellipse(smileCordx+20,smileCordy-15,16,32);
  fill(0);
  arc(smileCordx, smileCordy+20,50, 30, 0, PI);
  }
 */
void draw() {
  checkEdges();
  
  /*
  smiley(){
    smileCordx = mouseX;
    smileCordy = y;
  }
  */
    float smileCordx = mouseX;
    float smileCordy = y;
  fill(random(300),random(300),random(300));
  ellipse(smileCordx,smileCordy,100,100);
  fill(0);
  ellipse(smileCordx-20,smileCordy-15,16,32);
  ellipse(smileCordx+20,smileCordy-15,16,32);
  fill(0);
  arc(smileCordx, smileCordy+20,50, 30, 0, PI);

float r = 0;
float g = 0;
float b = 0;
float as= random(3);
float w = random(3);
float maxs = random(100,200);
  
if (mousePressed){
    r=random(100);
    g=random(100);
    b=random(100);
    background(r,g,b);
    as= random(3);
    w = random(3);
    maxs = random(100,200);
    int i=0;
 
 for (i=0; i<6; i++){
  fill(255);
  rect(random(400),random(400),20,20);
   }

  fill(random(300),random(300),random(300));
  ellipse(200,200,100,100);
  fill(0);
  ellipse(200-20,200-15,16,32);
  ellipse(200+20,200-15,16,32);
  fill(0);
  arc(200, 200+20,50, 30, 0, PI);
  }

}

void checkEdges() {
    y = y + speed; 
    if ((y > width-50) || (y < 10)) {
      speed = speed * -1;
    }
}

