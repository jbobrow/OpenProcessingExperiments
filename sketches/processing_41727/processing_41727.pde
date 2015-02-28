
//dan 03.58 10/10/2011
int extraction,prevExtraction=1;
int widthC=400;
int heightC=400;
float posX1,posY1,
    posX2,posY2,
    posX3,posY3,    
    posX4,posY4,
    posX5,posY5,
    posX6,posY6;
int speed = 10;

void setup(){
  size(widthC,heightC);
  smooth();
  posX1=posY1=posX2=posY2=posX3=posY3=posX4=posY4=posX5=posY5=posX6=posY6=widthC/2;
}

void draw(){
  background(50,120,50);
  fill(255);
  roundrect(int(width*.1),int(height*.1),int(width*.8),int(height*.8),width/10);
  noStroke();
  fill(0);
  switch(extraction) {
    case 1:
            posX1= (posX1> width/2) ? (posX1-(posX1-width/2)/speed) : (posX1+(width/2-posX1)/speed);
            posY1= (posY1> height/2) ? (posY1-(posY1-height/2)/speed) : (posY1+(height/2-posY1)/speed);
            posX2= (posX2> width/2) ? (posX2-(posX2-width/2)/speed) : (posX2+(width/2-posX2)/speed);
            posY2= (posY2> height/2) ? (posY2-(posY2-height/2)/speed) : (posY2+(height/2-posY2)/speed);
            posX3= (posX3> width/2) ? (posX3-(posX3-width/2)/speed) : (posX3+(width/2-posX3)/speed);
            posY3= (posY3> height/2) ? (posY3-(posY3-height/2)/speed) : (posY3+(height/2-posY3)/speed);
            posX4= (posX4> width/2) ? (posX4-(posX4-width/2)/speed) : (posX4+(width/2-posX4)/speed);
            posY4= (posY4> height/2) ? (posY4-(posY4-height/2)/speed) : (posY4+(height/2-posY4)/speed);
            posX5= (posX5> width/2) ? (posX5-(posX5-width/2)/speed) : (posX5+(width/2-posX5)/speed);
            posY5= (posY5> height/2) ? (posY5-(posY5-height/2)/speed) : (posY5+(height/2-posY5)/speed);
            posX6= (posX6> width/2) ? (posX6-(posX6-width/2)/speed) : (posX6+(width/2-posX6)/speed);
            posY6= (posY6> height/2) ? (posY6-(posY6-height/2)/speed) : (posY6+(height/2-posY6)/speed);
            break;
    case 2: 
            posX1= (posX1>= width/4) ? (posX1-(posX1-width/4)/speed) : (posX1+(width/4-posX1)/speed);
            posY1= (posY1>= height/4) ? (posY1-(posY1-height/4)/speed) : (posY1+(height/4-posY1)/speed);
            posX2= (posX2>= width/4*3) ? (posX2-(posX2-width/4*3)/speed) : (posX2+(width/4*3-posX2)/speed);
            posY2= (posY2>= height/4*3) ? (posY2-(posY2-height/4*3)/speed) : (posY2+(height/4*3-posY2)/speed);
            posX3= (posX3>= width/4) ? (posX3-(posX3-width/4)/speed) : (posX3+(width/4-posX3)/speed);
            posY3= (posY3>= height/4) ? (posY3-(posY3-height/4)/speed) : (posY3+(height/4-posY3)/speed);
            posX4= (posX4>= width/4*3) ? (posX4-(posX4-width/4*3)/speed) : (posX4+(width/4*3-posX4)/speed);
            posY4= (posY4>= height/4*3) ? (posY4-(posY4-height/4*3)/speed) : (posY4+(height/4*3-posY4)/speed);
            posX5= (posX5>= width/4) ? (posX5-(posX5-width/4)/speed) : (posX5+(width/4-posX5)/speed);
            posY5= (posY5>= height/4) ? (posY5-(posY5-height/4)/speed) : (posY5+(height/4-posY5)/speed);
            posX6= (posX6>= width/4*3) ? (posX6-(posX6-width/4*3)/speed) : (posX6+(width/4*3-posX6)/speed);
            posY6= (posY6>= height/4*3) ? (posY6-(posY6-height/4*3)/speed) : (posY6+(height/4*3-posY6)/speed);
            break;                
    case 3: 
            posX1= (posX1>= width/4) ? (posX1-(posX1-width/4)/speed) : (posX1+(width/4-posX1)/speed);
            posY1= (posY1>= height/4) ? (posY1-(posY1-height/4)/speed) : (posY1+(height/4-posY1)/speed);
            posX2= (posX2>= width/4*3) ? (posX2-(posX2-width/4*3)/speed) : (posX2+(width/4*3-posX2)/speed);
            posY2= (posY2>= height/4*3) ? (posY2-(posY2-height/4*3)/speed) : (posY2+(height/4*3-posY2)/speed);
            posX3= (posX3>= width/4) ? (posX3-(posX3-width/4)/speed) : (posX3+(width/4-posX3)/speed);
            posY3= (posY3>= height/4) ? (posY3-(posY3-height/4)/speed) : (posY3+(height/4-posY3)/speed);
            posX4= (posX4>= width/4*3) ? (posX4-(posX4-width/4*3)/speed) : (posX4+(width/4*3-posX4)/speed);
            posY4= (posY4>= height/4*3) ? (posY4-(posY4-height/4*3)/speed) : (posY4+(height/4*3-posY4)/speed);
            posX5= (posX5>= width/2) ? (posX5-(posX5-width/2)/speed) : (posX5+(width/2-posX5)/speed);
            posY5= (posY5>= height/2) ? (posY5-(posY5-height/2)/speed) : (posY5+(height/2-posY5)/speed);
            posX6= (posX6>= width/2) ? (posX6-(posX6-width/2)/speed) : (posX6+(width/2-posX6)/speed);
            posY6= (posY6>= height/2) ? (posY6-(posY6-height/2)/speed) : (posY6+(height/2-posY6)/speed);     
            break;            
    case 4: 
            posX1= (posX1>= width/4) ? (posX1-(posX1-width/4)/speed) : (posX1+(width/4-posX1)/speed);
            posY1= (posY1>= height/4) ? (posY1-(posY1-height/4)/speed) : (posY1+(height/4-posY1)/speed);
            posX2= (posX2>= width/4*3) ? (posX2-(posX2-width/4*3)/speed) : (posX2+(width/4*3-posX2)/speed);
            posY2= (posY2>= height/4) ? (posY2-(posY2-height/4)/speed) : (posY2+(height/4-posY2)/speed);
            posX3= (posX3>= width/4) ? (posX3-(posX3-width/4)/speed) : (posX3+(width/4-posX3)/speed);
            posY3= (posY3>= height/4*3) ? (posY3-(posY3-height/4*3)/speed) : (posY3+(height/4*3-posY3)/speed);
            posX4= (posX4>= width/4*3) ? (posX4-(posX4-width/4*3)/speed) : (posX4+(width/4*3-posX4)/speed);
            posY4= (posY4>= height/4*3) ? (posY4-(posY4-height/4*3)/speed) : (posY4+(height/4*3-posY4)/speed);
            posX5= (posX5>= width/4) ? (posX5-(posX5-width/4)/speed) : (posX5+(width/4-posX5)/speed);
            posY5= (posY5>= height/4) ? (posY5-(posY5-height/4)/speed) : (posY5+(height/4-posY5)/speed);
            posX6= (posX6>= width/4*3) ? (posX6-(posX6-width/4*3)/speed) : (posX6+(width/4*3-posX6)/speed);
            posY6= (posY6>= height/4*3) ? (posY6-(posY6-height/4*3)/speed) : (posY6+(height/4*3-posY6)/speed);         
            break;   
    case 5: 
            posX1= (posX1>= width/4) ? (posX1-(posX1-width/4)/speed) : (posX1+(width/4-posX1)/speed);
            posY1= (posY1>= height/4) ? (posY1-(posY1-height/4)/speed) : (posY1+(height/4-posY1)/speed);
            posX2= (posX2>= width/4*3) ? (posX2-(posX2-width/4*3)/speed) : (posX2+(width/4*3-posX2)/speed);
            posY2= (posY2>= height/4) ? (posY2-(posY2-height/4)/speed) : (posY2+(height/4-posY2)/speed);
            posX3= (posX3>= width/4) ? (posX3-(posX3-width/4)/speed) : (posX3+(width/4-posX3)/speed);
            posY3= (posY3>= height/4*3) ? (posY3-(posY3-height/4*3)/speed) : (posY3+(height/4*3-posY3)/speed);
            posX4= (posX4>= width/4*3) ? (posX4-(posX4-width/4*3)/speed) : (posX4+(width/4*3-posX4)/speed);
            posY4= (posY4>= height/4*3) ? (posY4-(posY4-height/4*3)/speed) : (posY4+(height/4*3-posY4)/speed);
            posX5= (posX5>= width/2) ? (posX5-(posX5-width/2)/speed) : (posX5+(width/2-posX5)/speed);
            posY5= (posY5>= height/2) ? (posY5-(posY5-height/2)/speed) : (posY5+(height/2-posY5)/speed);
            posX6= (posX6>= width/2) ? (posX6-(posX6-width/2)/speed) : (posX6+(width/2-posX6)/speed);
            posY6= (posY6>= height/2) ? (posY6-(posY6-height/2)/speed) : (posY6+(height/2-posY6)/speed);
            break;      
    case 6: 
            posX1= (posX1>= width/4) ? (posX1-(posX1-width/4)/speed) : (posX1+(width/4-posX1)/speed);
            posY1= (posY1>= height/4) ? (posY1-(posY1-height/4)/speed) : (posY1+(height/4-posY1)/speed);
            posX2= (posX2>= width/4*3) ? (posX2-(posX2-width/4*3)/speed) : (posX2+(width/4*3-posX2)/speed);
            posY2= (posY2>= height/4) ? (posY2-(posY2-height/4)/speed) : (posY2+(height/4-posY2)/speed);
            posX3= (posX3>= width/4) ? (posX3-(posX3-width/4)/speed) : (posX3+(width/4-posX3)/speed);
            posY3= (posY3>= height/4*3) ? (posY3-(posY3-height/4*3)/speed) : (posY3+(height/4*3-posY3)/speed);
            posX4= (posX4>= width/4*3) ? (posX4-(posX4-width/4*3)/speed) : (posX4+(width/4*3-posX4)/speed);
            posY4= (posY4>= height/4*3) ? (posY4-(posY4-height/4*3)/speed) : (posY4+(height/4*3-posY4)/speed);
            posX5= (posX5>= width/4) ? (posX5-(posX5-width/4)/speed) : (posX5+(width/4-posX5)/speed);
            posY5= (posY5>= height/2) ? (posY5-(posY5-height/2)/speed) : (posY5+(height/2-posY5)/speed);
            posX6= (posX6>= width/4*3) ? (posX6-(posX6-width/4*3)/speed) : (posX6+(width/4*3-posX6)/speed);
            posY6= (posY6>= height/2) ? (posY6-(posY6-height/2)/speed) : (posY6+(height/2-posY6)/speed);
            break;            
            
  }
            
            ellipse(posX1,posY1,60,60);
            ellipse(posX2,posY2,60,60);
            ellipse(posX3,posY3,60,60);
            ellipse(posX4,posY4,60,60);
            ellipse(posX5,posY5,60,60);
            ellipse(posX6,posY6,60,60);
}

void mouseReleased() {
  prevExtraction=extraction;
  extraction=int(random(1,7));
  if(extraction==prevExtraction){
    posX1+= random(-25,25);
    posY1+= random(-25,25);
    posX2+= random(-25,25);
    posY2+= random(-25,25);
    posX3+= random(-25,25);
    posY3+= random(-25,25);
    posX4+= random(-25,25);
    posY4+= random(-25,25);
    posX5+= random(-25,25);
    posY5+= random(-25,25);
    posX6+= random(-25,25);
    posY6+= random(-25,25);
  }
}

void roundrect(int x, int y, int w, int h, int r) {
 noStroke();
 rectMode(CORNER);

 int  ax, ay, hr;

 ax=x+w-1;
 ay=y+h-1;
 hr = r/2;

 rect(x, y, w, h);
 arc(x, y, r, r, radians(180.0), radians(270.0));
 arc(ax, y, r,r, radians(270.0), radians(360.0));
 arc(x, ay, r,r, radians(90.0), radians(180.0));
 arc(ax, ay, r,r, radians(0.0), radians(90.0));
 rect(x, y-hr, w, hr);
 rect(x-hr, y, hr, h);
 rect(x, y+h, w, hr);
 rect(x+w,y,hr, h);

}
