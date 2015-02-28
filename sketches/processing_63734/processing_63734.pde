
int counter;
int t;
string[] phrases;
PFont font;
float BLADESPERPASS = 45;
int ox = 65;
int oy = 45;
int fontHeight;
int halffontHeight;

void setup() {  //setup function called initially, only once
  font = loadFont("FFScala-32.vlw"); 
  textFont(font, 32); 
  textSize(100);  
  phrases = new string[8] { "with", "your", "empty", "mind","long","living","breathing","revolution" };
  size(600, 600);
  fontHeight = 600/phrases.length;
  halffontHeight = fontHeight/2;
  background(255);  //set background white
  colorMode(RGB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
  t = 0;
  textAlign(CENTER,CENTER);
 
}

void draw() {  //draw function loops 
  counter++;
  
  strokeWeight(2);
  stroke(random(125,175),random(175,255),75,35);
  
  int x = random(width);
  int y = random(height);  
     
  for(float j=0;j<BLADESPERPASS ;j++)
  {
    ox = random(50,200) * cos((j/BLADESPERPASS ) * TWO_PI);
    oy = random(50,200) * sin((j/BLADESPERPASS ) * TWO_PI);    
    triangle(x,y,x+random(3,6),y+random(3,6),x+ox,y+oy);
  }
  
  if ((counter % 101) == 0) {
    noStroke();
    fill(255,255,255,255);

    text(
        phrases[t], 
        (width/2),
        (t * fontHeight) + halffontHeight);
    t = (t+1)%phrases.length;    
    
  }
}
