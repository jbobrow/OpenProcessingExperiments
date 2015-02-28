
color [] pal = {#939191,#000000,#FFFFFF,#FF0000,#00FF12,#0024FF};

int x = 0;
int y = 0;
int d = 10;
int c;
int k;

void setup(){
  size(600,600);
  smooth();
  background(pal[0]);
  ellipseMode(CENTER);
  
  }
  
void draw(){
  translate(300,300);
  
  stroke(pal[3]);
  strokeWeight(150);
  line(-300,300,300,300);
  
  stroke(pal[3]);
  strokeWeight(50);
  line(-300,-300,300,-300);
  line(-300,-300,-300,250);
  line(300,-300,300,250);
  
  noStroke();
  fill(pal[2]);
  ellipse(-250,275,50,50);
  ellipse(250,275,50,50);
  
  fill(pal[c]);
  ellipse(x,y,d,d);
  x = constrain(x,-267,267);
  y = constrain(y,-267,217);
  
  fill(pal[1]);
  text("Use i, k, l, and j to move s to Stop and r to refresh \n press 1 for black 2 for green and 3 for blue", -150, 270);
  //change color black
  if(c==1){
    fill(pal[1]);
  }
  
  if(c == 2){
    fill(pal[4]);
  }
   if(c == 3){
    fill(pal[5]);
  }
  //move up
  if(k == 1){
    fill(pal[c]);
    ellipse(x,y,d,d);
    y -= 2;
   }
//move down
   if(k == 2){
     fill(pal[c]);
    ellipse(x,y,d,d);
   y += 2; 
    }
//move right
    if(k == 3){
      fill(pal[c]);
      ellipse(x,y,d,d);
      x += 2;
    }
//move left
 if(k == 4){
      fill(pal[c]);
      ellipse(x,y,d,d);
      x-= 2;
    }
//refresh
if(k == 5){
  fill(pal[0]);
  rect(-275,-275,549,500);  
}
  }
  
   void keyPressed(){
//up
    if(key == 105) k = 1;
//down
    if(key == 107) k = 2;
//right
    if(key == 108) k = 3;
//left
    if(key == 106) k = 4;
//stop
  if(key == 115) k=0;
//refresh page
  if(key == 114) k= 5;
//change dot color
  if(key == '1') c = 1;
  if(key == '2') c = 4;
  if(key == '3') c = 5;
   }
