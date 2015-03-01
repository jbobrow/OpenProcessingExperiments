
PFont font;
void setup()
{
  size(700, 700);
  font= loadFont("AmericanTypewriter-100.vlw");
  textFont(font);
}

void draw()
{ 
  colorMode(HSB,360,100,100);
  String c[]={"red","orange","yellow","green","blue","indigo","purple"};
   
  if (mousePressed) {
    background(0);
    for (int i=0; i<200; i++) {
      textSize(random(0, 50));
      int n= (int)random(0, 7);
      if(n<3){
      fill(n*30,100,100);}
      else{fill(n*50,100,100);}
      text(c[n], random(0, 700), random(n*100, (n+1)*100));
    }
  }
  }
