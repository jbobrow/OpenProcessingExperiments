
PImage cover ;
PImage feet ;
PImage body ;
PImage head ;
PImage details ;
int myState = 0 ;

float y1 = 0;
float y2 = 0;
float y3 = 0;
float y4 = 0;


void setup() {
  size(500, 500) ;
  cover = loadImage("snowman.png") ;
  feet = loadImage("feet.png") ;
  body = loadImage("body.png") ;
  head = loadImage("head.png") ;
  details = loadImage("final2.png") ;
  
}

void draw() {
  background(100) ;
  noStroke();
  
  switch(myState) {
    
    case 0:
    image(cover, 0, 0, width, height);
    break ;
    
    case 1:
    image(feet, 0, 0, width, height);
        fill(250);
  ellipse(75, y2+20, 10, 10);
  ellipse(120, y1+30, 10, 10);
  ellipse(180, y4-50, 10, 10);
  ellipse(230, y3-10, 5, 5);
  ellipse(245, y4+50, 10, 10);
  ellipse(300, y3+80, 5, 5);
  ellipse(340, y2+75, 10, 10);
  ellipse(400, y1, 15, 15);
    ellipse(445, y1+20, 10, 10);
  ellipse(485, y2+30, 10, 10);
  ellipse(50, y3-50, 10, 10);
  ellipse(140, y4-10, 5, 5);
  ellipse(280, y1+50, 10, 10);
  ellipse(375, y2+80, 5, 5);
  ellipse(430, y3+75, 10, 10);
  ellipse(100, y4, 15, 15);
    y1+=1;
  if(y1 > height) {
    y1 = 0;
  }
  y2+=2;
  if(y2 > height) {
    y2 = 0;
  }
  y3+=2.5;
  if(y3 > height) {
    y3 = 0;
  }
  y4+=3;
  if(y4 > height) {
    y4 = 0;
  }
    break ;
    
    case 2:
    image(body, 0, 0, width, height);
        fill(250);
  ellipse(75, y2+20, 10, 10);
  ellipse(120, y1+30, 10, 10);
  ellipse(180, y4-50, 10, 10);
  ellipse(230, y3-10, 5, 5);
  ellipse(245, y4+50, 10, 10);
  ellipse(300, y3+80, 5, 5);
  ellipse(340, y2+75, 10, 10);
  ellipse(400, y1, 15, 15);
    ellipse(445, y1+20, 10, 10);
  ellipse(485, y2+30, 10, 10);
  ellipse(50, y3-50, 10, 10);
  ellipse(140, y4-10, 5, 5);
  ellipse(280, y1+50, 10, 10);
  ellipse(375, y2+80, 5, 5);
  ellipse(430, y3+75, 10, 10);
  ellipse(100, y4, 15, 15);
    y1+=1;
  if(y1 > height) {
    y1 = 0;
  }
  y2+=2;
  if(y2 > height) {
    y2 = 0;
  }
  y3+=2.5;
  if(y3 > height) {
    y3 = 0;
  }
  y4+=3;
  if(y4 > height) {
    y4 = 0;
  }
    break ;
    
    case 3:
    image(head, 0, 0, width, height);
        fill(250);
  ellipse(75, y2+20, 10, 10);
  ellipse(120, y1+30, 10, 10);
  ellipse(180, y4-50, 10, 10);
  ellipse(230, y3-10, 5, 5);
  ellipse(245, y4+50, 10, 10);
  ellipse(300, y3+80, 5, 5);
  ellipse(340, y2+75, 10, 10);
  ellipse(400, y1, 15, 15);
    ellipse(445, y1+20, 10, 10);
  ellipse(485, y2+30, 10, 10);
  ellipse(50, y3-50, 10, 10);
  ellipse(140, y4-10, 5, 5);
  ellipse(280, y1+50, 10, 10);
  ellipse(375, y2+80, 5, 5);
  ellipse(430, y3+75, 10, 10);
  ellipse(100, y4, 15, 15);
    y1+=1;
  if(y1 > height) {
    y1 = 0;
  }
  y2+=2;
  if(y2 > height) {
    y2 = 0;
  }
  y3+=2.5;
  if(y3 > height) {
    y3 = 0;
  }
  y4+=3;
  if(y4 > height) {
    y4 = 0;
  }
    break ;
    
    case 4:
    image(details, 0, 0, width, height);
        fill(250);
  ellipse(75, y2+20, 10, 10);
  ellipse(120, y1+30, 10, 10);
  ellipse(180, y4-50, 10, 10);
  ellipse(230, y3-10, 5, 5);
  ellipse(245, y4+50, 10, 10);
  ellipse(300, y3+80, 5, 5);
  ellipse(340, y2+75, 10, 10);
  ellipse(400, y1, 15, 15);
    ellipse(445, y1+20, 10, 10);
  ellipse(485, y2+30, 10, 10);
  ellipse(50, y3-50, 10, 10);
  ellipse(140, y4-10, 5, 5);
  ellipse(280, y1+50, 10, 10);
  ellipse(375, y2+80, 5, 5);
  ellipse(430, y3+75, 10, 10);
  ellipse(100, y4, 15, 15);
    y1+=1;
  if(y1 > height) {
    y1 = 0;
  }
  y2+=2;
  if(y2 > height) {
    y2 = 0;
  }
  y3+=2.5;
  if(y3 > height) {
    y3 = 0;
  }
  y4+=3;
  if(y4 > height) {
    y4 = 0;
  }
    break ;
    
  }
}
  
  void mousePressed() {
    myState = myState + 1 ;
    
    myState = myState % 5 ;
    
  }


