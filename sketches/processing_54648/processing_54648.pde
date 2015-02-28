
//3 compositions placing text aroudn the page, 
//some of the words from todays stuff
//pay attention to depth, color to push back texts and such

int x=50;        //interger (can only put whole #s)
float b=20;   //decimals allowed here
PFont bitchingestfont;

void setup(){
  size (600,600);
  background(195,198,30);
  bitchingestfont = loadFont("HurryUp-48.vlw");
}
//draw a new random sized circle
void draw (){
 
  
  fill(random(210),random(30),random(210),1);
  textFont(bitchingestfont);
  textSize(10+x);
  text("LAff Riot", 15-b ,100);
  fill(random(220),random(40),random(220),1);
  textFont(bitchingestfont);
  textSize(20+x);
 text("LAff Riot", 15-(b) ,200);
 fill(random(230),random(50),random(230),1);
  textFont(bitchingestfont);
  textSize(30+x);
 text("LAff Riot", 15-b ,300);
 fill(random(240),random(60),random(240),1);
  textFont(bitchingestfont);
  textSize(40+x);
 text("LAff Riot", 15-b ,400);
 fill(random(250),random(70),random(250),1);
  textFont(bitchingestfont);
  textSize(50+x);
 text("LAff Riot", 15-b ,500);
 fill(random(250),random(80),random(250),1);
  textFont(bitchingestfont);
  textSize(60+x);
 text("LAff Riot", 15-b ,600);
 fill((255),random(40),50);
 textFont(bitchingestfont);
 textSize(1+(x-45));
 text("LAFF Riot", 100-b, 700-(x+x));
 
  //draws text thats in ""
}

void mousePressed(){
  x = x + 10;
  b = b + 10;

}

void keyPressed(){
  fill(random(255),0,0);

}


