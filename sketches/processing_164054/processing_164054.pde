
// bouncing ball variables
PImage bkphoto;
int posx = 0;
int posy = 0;
int xd = 10;
int yd = 10;
int w = 10;
int h = 10;
int b = 8;


int x1 = 0;
int paddle_size = 50;
int y1 = 0;
int y2 = 0;
int x2 = width;
int x3 = width-(b/2);
int y3 = height-50;
int x4 = width-4;
int y4 = height;
int speed = 10;
int score1 = 0;
int score2 = 0;


void setup(){
  size(600, 400);
  bkphoto = loadImage("field.png");
  frameRate(50);
  }

void draw(){
  // if statements bouncing of the ball
  //image(bkphoto, 0, 0);
  background(0);
  stroke(255);
  ball(posx, posy, w, h);
  posx = posx + xd;
  posy = posy + yd;
  
  if (posx>width) {
     xd = -xd;}
  if (posy>height) {
     yd = -yd;}
  if (posx<0) {
     xd = -xd;}
  if (posy<0) {
     yd = -yd;}
     
 
 // ball bouncing
  //PADDLE LEFT
  stroke(255);
  strokeWeight(3);
  line(x1, y1, x1, y1+paddle_size);
  
  if(keyPressed){
    if((key =='w') && (y1>0)){
      y1= y1 - speed;}
      else{
        y1 = y1;} 
  
   if((key =='s') && (y1 < height - paddle_size)){
      y1 = y1 + speed;
    }else{
      y1 = y1;
    }
  }
//paddle RIGHT

line(600-2, y2, 600-3, y2+ paddle_size);

  if(keyPressed){
    if((keyCode== UP)&& (y2 > paddle_size)){
      y2= y2 - speed;
    }else{
        y2 = y2;} 
   
   if((keyCode == DOWN)&&(y2<height)){
      y2 = y2 + speed;
    }else{
      y2 = y2;}
  }


      
  // text displaying live results 
  PFont scoresFont;
  scoresFont = loadFont ("DialogInput-18.vlw");
  fill(255);
  textFont(scoresFont);
  textAlign(CENTER);
  text("X", width/2, 40);
  text(score1, width/2-50, 40);
  text(score2, width/2+50, 40);
  

  if(posx <= 0){
    score1 = score1 + 1;}
    
  if (posx >= width) {
    score2 = score2 + 1;}
    
  if(score1 >= 10){
    noLoop();
    text("Team a Wins", width/2, height/2);
    //reset();}
  
  if(score2 >= 10){
    noLoop();
    text("Team B Wins", width/2, height/2);
    //reset();}
}
}}
void ball(int x,int y,int w,int h){
   //noStroke();
   ellipseMode(CORNER);
   fill(255); 
   ellipse(x, y, w, h); 
}

  



