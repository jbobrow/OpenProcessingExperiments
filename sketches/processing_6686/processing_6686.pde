
/*
TODO:
 legs move
 santa in sled
 cityscape
 
 */
HashSet stars = new HashSet();


HashSet buildings;



color brown = color(153,102,51);
color yellow = color( 238,221,130);

HashMap font = new HashMap();

float goalX=125, goalY=125;
//float headX =200,headY=200;


//ChainSnake happyHolidays;
ChainSnake merryChristmas;
//ChainSnake happyNewYear;

ChainSnakeSleigh santaDeer;

//ChainSnake simpleSnake;

void setup() {
  size(250, 250);
  setupFont(); 
  frameRate(40);


buildings = new HashSet();


addBuildings();

  for(int g = 0; g < 200; g++){
    stars.add(new Point(random(250),random(0, 250)));
  }



  //happyHolidays = new ChainSnakeText("HAPPY HOLIDAYS!", color(random(128,255),random(128,255),random(128,255)));
  merryChristmas = new ChainSnakeTextTwoColor("MERRY CHRISTMAS!", color(200,50,50),color(50,200,50));
  //happyNewYear = new ChainSnakeText("HAPPY NEW YEAR!", color(random(128,255),random(128,255),random(128,255)));
  santaDeer = new ChainSnakeSleigh();

  //simpleSnake = new ChainSnake();

}

void mouseMoved(){
  goalX = mouseX;
  goalY = mouseY ;
}


class Point{
  float x,y;
  Point(float x, float y){
    this.x = x;
    this.y = y;
  } 
}


boolean closeEnough(float x1,float y1,float x2,float y2){
  if(mag(x1-x2,y1-y2) < 5){
    return true; 
  }
  return false;
}

void draw() {
  background(0,0,50);

  Iterator i = stars.iterator();
  strokeWeight(1);
  while(i.hasNext()){
    stroke(random(130,250));
    Point p = (Point)i.next(); 
    line(p.x,p.y,p.x,p.y);
  }


  drawBuildings();
  ////  happyHolidays.moveAndDraw();
  ////  happyNewYear.moveAndDraw();
  strokeWeight(4);
  merryChristmas.moveAndDraw();
  santaDeer.moveAndDraw();
/*  pushMatrix();
  translate(125,125);
  santaDeer.drawSleigh();
  popMatrix();*/
  //simpleSnake.moveAndDraw();
}



//==========font stuff =================







void drawText(String s,float x, float y, float maxwidth ,float w, float h){
  float origx =x ;
  s = s.toUpperCase();
  String[] words = s.split(" ");
  for(int  wordptr = 0; wordptr < words.length; wordptr++){
    String word = words[wordptr];
    if(x + word.length()*w > origx+maxwidth){
      x = origx;
      y += h * 1.5;
    } 
    for(int i = 0; i < word.length();i++){
      drawChar(word.substring(i,i+1),x,y,w-3,h);
      x += w; 
    }
    x += w;
  }

}  

void setupFont(){
  font.put("0",new int[] {
    1,2,5,6,9,10,13,14          }
  );
  font.put("1",new int[] {
    4,11          } 
  );
  font.put("2",new int[] {
    1,6,8,7,9,14          } 
  );
  font.put("3",new int[] {
    1,6,8,7,13,14          } 
  );
  font.put("4",new int[] {
    2,7,8,6,13          } 
  );
  font.put("5",new int[] {
    1,2,7,8,13,14          } 
  );
  font.put("6",new int[] {
    1,2,7,8,13,14,9          } 
  );
  font.put("7",new int[] {
    1,6,13          } 
  );
  font.put("8",new int[] {
    1,2,6,7,8,9,13,14          } 
  );
  font.put("9",new int[] {
    1,2,6,7,8,13,14          } 
  );
  font.put("A",new int[] {
    9,2,1,6,13,7,8          } 
  );
  font.put("B",new int[] {
    1,14,4,6,11,13,8          } 
  );
  font.put("C",new int[] {
    1,2,9,14          } 
  );
  font.put("D",new int[] {
    1,14,4,11,6,13          } 
  );
  font.put("E",new int[] {
    1,2,7,9,14          } 
  );
  font.put("F",new int[] {
    1,2,7,9          } 
  );
  font.put("G",new int[] {
    1,2,9,14,13,8          } 
  );
  font.put("H",new int[] {
    2,9,6,13,7,8          } 
  );
  font.put("I",new int[] {
    1,4,11,14          } 
  );
  font.put("J",new int[] {
    9,14,13,6          } 
  );
  font.put("K",new int[] {
    2,9,7,5,12          } 
  );
  font.put("L",new int[] {
    2,9,14          } 
  );
  font.put("M",new int[] {
    9,2,3,5,6,13          } 
  );
  font.put("N",new int[] {
    9,2,3,12,13,6          } 
  );
  font.put("O",new int[] {
    1,2,9,14,13,6          } 
  );
  font.put("P",new int[] {
    1,2,6,7,8,9          } 
  );
  font.put("Q",new int[] {
    1,2,6,9,14,13,12          } 
  );
  font.put("R",new int[] {
    1,2,6,7,8,9,12          } 
  );
  font.put("S",new int[] {
    1,2,7,8,13,14          } 
  );
  font.put("T",new int[] {
    1,4,11          } 
  );
  font.put("U",new int[] {
    2,9,14,13,6          } 
  );
  font.put("V",new int[] {
    2,9,10,5          } 
  );
  font.put("W",new int[] {
    2,9,14,13,6,11          } 
  );
  font.put("X",new int[] {
    3,10,5,12          } 
  );
  font.put("Y",new int[] {
    3,5,11          } 
  );
  font.put("Z",new int[] {
    1,5,10,14          } 
  );

  font.put(" ",new int[] {
  } 
  );
  font.put(".",new int[] {
    0          } 
  );
  font.put(",",new int[] {
    10          } 
  );
  font.put("!",new int[] {
    4,11,0          } 
  );
  font.put("'",new int[] {
    4          } 
  );

  font.put("?",new int[] {
    1,2,6,8,11,0          } 
  ); 
  font.put("&",new int[] {
    1,3,6,8,9,12,14          } 
  ); 
  font.put("+",new int[] {
    4,7,8,11          } 
  ); 
  font.put("-",new int[] {
    7,8          } 
  );
}

void drawChar(String c, float x, float y, float w, float h){

  int[] segs = (int[])font.get(c);
  if(segs == null) return;
  for(int i = 0; i < segs.length; i++){

    switch(segs[i]){
    case 1:
      line(x,y,x+w,y); 
      break;
    case 2:
      line(x,y,x,y+(h/2));
      break;
    case 3:
      line(x,y,x+(w/2),y+(h/2));
      break;
    case 4:
      line(x+(w/2),y,x+(w/2),y+(h/2));
      break;
    case 5:
      line(x+w,y,x+(w/2),y+(h/2));  
      break;       
    case 6:
      line(x+w,y,x+w,y+(h/2));
      break;
    case 7:
      line(x,y+(h/2),x+(w/2),y+(h/2));
      break;
    case 8:
      line(x+(w/2),y+(h/2),x+w,y+(h/2));
      break;
    case 9:
      line(x,y+(h/2),x,y+h);
      break;
    case 10:
      line(x,y+h,x+w/2,y+h/2);
      break;
    case 11:
      line(x+w/2,y+h/2,x+w/2,y+h);
      break;
    case 12:
      line(x+w/2,y+h/2,x+w,y+h);
      break;
    case 13:
      line(x+w,y+h/2,x+w,y+h);
      break;
    case 14:
      line(x,y+h,x+w,y+h);
      break;
    case 0:
      line(x+w/2-w/6,y+h+h/4,x+w/2+w/6,y+h+h/4);
      break;

    default:
      break; 
    }


  }
}



//==================SNAKE STUFF=================
class ChainSnakeSleigh  extends ChainSnake{
  float legangle[];

  ChainSnakeSleigh(){
    initSegs(10);
    legangle = new float[9];
    for(int i = 0 ; i < 9; i++){
      legangle[i] = random(TWO_PI);
    }
  }
  void drawGuy(int i,float x, float y, float angle,float leadx,float leady){
    pushMatrix();
    translate(x,y);
    rotate(angle+PI);

    if(i < segCount-1){
      drawDeer(i == 0,legangle[i]);
      legangle[i] += .3;  
    } 
    else {
      drawSleigh(); 
    }
    popMatrix();
    strokeWeight(1);
    stroke(255);
    if(i != 0){
      line(x,y,leadx,leady);
    }
  }

  void drawDeer(boolean nose, float leg){
    fill(brown);
    noStroke();
    stroke(brown);
    strokeWeight(2);
    line(0,0,-4-2*cos(leg),8);//front leg
    line(0,0,4+2*cos(leg),8); //backleg
    noStroke();
    rect(-5,-4,10,8); //body
    rect(5,-3,2,2); //tail
    stroke(yellow);
    line(-4,-4,0,-12);
    line(-2,-8,-6,-12);
    noStroke();
    rect(-8,-8,7,7);    //head



    if(nose){
      fill(255,0,0);
    } 
    else {
      fill(128); 
    }
    rect(-10,-6,2,2); 

  }
  void drawSleigh(){
    color santared = color(255,50,50);
    noStroke();
    fill(santared);
    pushMatrix();    
    translate(2,-3);
    ellipse(0,0,15,15);
    fill(255,150,150);
    pushMatrix();
    translate(0,-8);
    ellipse(0,0,8,8);
    fill(santared);
    triangle(-1,-3,5,0,10,-10); //hat
    fill(255);
    ellipse(10,-10,3,3); //hatball

    triangle(-4,0,1,4,-10,5); //beard


    stroke(255);
    strokeWeight(2);
    line(-1,-3,4,0); //hatband
    popMatrix();
    popMatrix();
    noStroke();
    //bag
    fill(50,200,20);
    pushMatrix();    
    translate(15,-6);
    ellipse(0,0,20,20);
    triangle(0,0,12,-12,14,-6);
    popMatrix();



    fill(color(200,50,50));
    
    rect(-5,-5,30,10); 
     stroke(50,200,50);
     strokeWeight(2);
     line(-5, 10,25,10);
     line(5, 10,5,0);
     line(20, 10,20,0);
    

  }

}




class ChainSnakeText extends ChainSnake{
  String msg;
  color c;
  ChainSnakeText(String msg, color c){
    this.msg = msg; 
    this.c = c;
    initSegs(msg.length());

  }

  void drawGuy(int i,float x, float y, float angle,float leadx,float leady){
    stroke(getLetterColor(i));
    pushMatrix();
    translate(x,y);
    rotate(angle+PI);
    drawChar(msg.substring(i,i+1),0,0,10,20);
    popMatrix();
  }

  color getLetterColor(int i){
    return c;
  }


}

class ChainSnakeTextTwoColor extends ChainSnakeText {
  color c2;
  ChainSnakeTextTwoColor(String msg, color c1,color c2){
    super(msg,c1);
    this.c2 = c2;
  }
  color getLetterColor(int i){
    if(i%2 == 0){
      return c;
    } 
    return c2;
  }

}








class ChainSnake {
  float[] segx ;
  float[] segy ;
  float segLength = 20;
  float angle;

  float SPEED = 4;

  float TURNSPEED = .05;

  int segCount;

  float headX = random(250);
  float headY = random(250);

  void initSegs(int count){
    segCount = count;
    segx = new float[segCount];
    segy = new float[segCount];

    float angle = random(TWO_PI);
    float yoff = sin(angle) * segLength;
    float xoff = cos(angle) * segLength;
    for(int s=0; s<segCount-1; s++) {
      segx[s] = headX + ((s+1)*xoff);
      segy[s] = headY + ((s+1)*yoff);
    } 
  }


  ChainSnake(){
    initSegs(int(random(10,20)));
  }
  void moveAndDraw(){
    float dx = (goalX - headX );
    float dy = ( goalY-headY);
    float wantangle = atan2(dy, dx);
    float anglediff = (angle - wantangle);  

    anglediff /= PI;
    //this next bit catches the "runaround"


    if(anglediff > 1){
      anglediff -= 2;
    }
    if(anglediff < -1){
      anglediff += 2;
    }


    if(anglediff > 0){
      //  println(" <-\\");
      angle -= TURNSPEED; 
    } 
    else {
      //  println(" /->");

      angle += TURNSPEED; 
    }
    headX += cos(angle)* SPEED; 
    headY += sin(angle) * SPEED; 

    dragSegment(0, headX,headY);

    for(int s=0; s<segCount-1; s++) {
      dragSegment(s+1, segx[s], segy[s]);
    }

  }
  void dragSegment(int i, float xin, float yin) {
    float dx = xin - segx[i];
    float dy = yin - segy[i];
    float angle = atan2(dy, dx);  
    segx[i] = xin - cos(angle) * segLength;
    segy[i] = yin - sin(angle) * segLength;
    drawGuy(i,segx[i],segy[i],angle,xin,yin);
  }
  void drawGuy(int i,float x, float y, float angle,float leadx,float leady){
    stroke(255,128);
    strokeWeight(10);
    line(x,y,leadx,leady);
  }

}


//================ BUILDINGS ===================


void addBuildings(){
 float x = -25;
 float w = random(10,30);
 while(x + w < 325){
  Building b = new Building();  
  b.x = x;

   b.w = w;
   b.h = random (10,30);
   b.c = color(random(128,200));
   b.initWindows();
   buildings.add(b);
   x += w + random(2,7);
   w = random(10,20);
 }
 
}


void drawBuildings(){
  Iterator i = buildings.iterator();
  while(i.hasNext()){
Building b = (Building) i.next();
b.draw();
  }
  }

class Building{
   float w;
  float h;
color c;
float x;
void draw(){
      noStroke();
    fill(c);
    rect(x,250-h,w,h);
  

    float winwidth = w / ((wincount *2)+1);
    int num = 0;
    for(float start = 250 - h + 6;  start < 250; start+= (winheight*2)){
    for(int i = 0; i < wincount; i++){
      if(lit[num]){
           fill(128,128,0); 
      } else {
        
           fill(50); 
      }
      rect( x + (winwidth * (1+(2* i))),start,winwidth,winheight);
      num++;
     }
    }
}
int wincount;
boolean lit[];
float winheight = 6;

void initWindows(){
 wincount  = 3;
  if(w < 16) {
    wincount = 2; 
 }
 if(w > 24){
    wincount = 4; 
 }
 int floorcount = ceil(h / (winheight*2));
 lit = new boolean[floorcount * wincount];
 for(int i = 0; i < floorcount * wincount; i++){
    if(random(1) < .25){
       lit[i] = true;
    } 
 }
 
 
}

}







