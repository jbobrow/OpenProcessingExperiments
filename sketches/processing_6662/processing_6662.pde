
HashMap font = new HashMap();
santa s;

int OK = 0;
int CAUGHT = 1;
int MISSED = 2;


Stocking sock;

HashSet gifts = new HashSet(); 

HashSet splosions  = new HashSet();
float SANTACCEL;
float dropinterval ;
float dropcounter = 0;
float giftcounter;
float GIFTSPERTURN = 10;
boolean playing  = false;
boolean gameFinished = false;

  float GRAV;

int score, lives,gameround;

void setup(){
  size(250,250);
  frameRate(40);
  setupFont();
  s = new santa(125,38);
  sock = new Stocking(200);
  resetGame();
}
void draw(){
  background(200);
  
  
  
if(playing){
  s.move();
}
for(int c = 0; c < lives - 1; c++){
  drawStocking(200+20*c, 10, 10, true);
drawStocking(200+20*c, 10, 10, false);
}
stroke(0); strokeWeight(2);
fontText(10,4,"SCORE "+score,10);



  s.draw(); 

  noStroke();
  fill(100);
  rect(0,40,250,250);

strokeWeight(2);
stroke(0);



if(!playing){
if(!gameFinished){
  centerText(0,250,120,"click for round "+(gameround+1),10);
} else {
   centerText(0,250,120,"Game Over!  Score "+(score),10);
   centerText(0,250,140,"Click to Replay! ",10);
}
}


if(playing){
dropcounter --;

if(dropcounter < 0){
  dropcounter = dropinterval;
  
  if(giftcounter > 0) {
  gifts.add(new gift(s.x,40));
  giftcounter--;
  }
}

if(playing && giftcounter <= 0 && gifts.size() == 0){
     playing = false; 
}
  
}

boolean missed = false;
  Iterator i = gifts.iterator();
  while(i.hasNext()){
    gift g = (gift)i.next();
    int result = g.move();
    if(result == CAUGHT){
       i.remove(); 
               score++; 
    }
    if(result == MISSED){
       missed = true; 
    }
    g.draw(); 
  }

if(playing && missed){
   lives--;
   playing = false;
   gameround--;
  
  if(lives == 0){
     gameFinished = true; 
  }
  
   i = gifts.iterator();
   while(i.hasNext()){
     gift g = (gift)i.next();
      splosions.add(new Splosion(g)); 
      i.remove();
   }
  
}
i = splosions.iterator();
   while(i.hasNext()){
     Splosion boom = (Splosion)i.next();
    boom.draw();

   }



  sock.move();
  sock.draw();

}

void resetGame(){
 score = 0;
lives = 3; 
dropinterval = 30;
SANTACCEL = 3;
gameround =0 ;
gameFinished = false;
GRAV = .15;

}


void startRound(){
  gameround++;
  giftcounter = GIFTSPERTURN ;
  SANTACCEL+=1;
  GRAV += .05;
  dropinterval--;
  if(dropinterval < 5) {
    dropinterval = 5;
  }
  splosions = new HashSet();
  dropcounter = dropinterval;
  playing = true; 
}

void mousePressed(){
  if(!playing) {
    if(gameFinished){
      resetGame();
    }
    startRound();
  }
}

class santa {
  float x,y;
  float xs,ys;
  float SIZE = width/10;
  santa(float x, float y){
    this.x = x;
    this.y = y; 
  }




  void move(){
    xs += random(-SANTACCEL,SANTACCEL);
    x+=xs;
    if(x < SIZE){
       x = SIZE;
      xs = abs(xs)/2; 
    }
    if(x > width-SIZE){
       x = width-SIZE;
      xs = abs(xs)/-2; 
    }

  }


  void draw(){
    strokeWeight(2);
    stroke(0);
    fill(0);

    boolean front = true;
    if(ys < 0) {
      front = false; 
    }

    rect(x-SIZE*.5,y+SIZE*.4,SIZE/3,SIZE/5);
    rect(x+SIZE*.5,y+SIZE*.4,-SIZE/3,SIZE/5);
    fill(200);
    noStroke();
    rect(x-SIZE*.5,y+SIZE*.48,SIZE/3,SIZE/8);
    rect(x+SIZE*.5,y+SIZE*.48,-SIZE/3,SIZE/8);

    stroke(0);

    if(!front) {
      fill(255); 
      ellipse(x, y-SIZE/2, SIZE*2/3, SIZE*2/3);// back of head

    } 


    fill(MYRED);
    ellipse(x,y,SIZE,SIZE); //body
    fill(255); 
    rect(x-SIZE/2,y,SIZE,SIZE/8); //belt
    if(front) {
      fill(255,128,128); //skin
      ellipse(x, y-SIZE/2, SIZE*2/3, SIZE*2/3);//head

    } 
    if(front){
      fill(255);
      triangle(x - SIZE*.4,y-SIZE/2,x+SIZE*.4,y-SIZE/2,x,y); //beard
    }
    fill(MYRED);
    triangle(x - SIZE/3,y-SIZE*.75,x+SIZE/3,y-SIZE*.75,x,y-SIZE*1.2); //hat
    fill(255);
    ellipse(x,y-SIZE*1.2,SIZE/4,SIZE/4);
  }

}



class gift {
  float x,y,xs,ys,r,rs,xsz, ysz,ribwidth;
  color col, ribcol;

  float SPEEDRANGE = width / 50;
  float ROTRANGE = .3;
  float SIZEMIN = width / 20.0;
  float SIZEMAX = width / 10.0;

  gift(float x, float y){
    this.x = x;
    this.y = y;
    xsz = random(SIZEMIN,SIZEMAX);

    ysz = random(SIZEMIN,SIZEMAX);

  //  xs = random(-SPEEDRANGE,SPEEDRANGE);
  //  ys = -10 ;//random(0,-SPEEDRANGE*10);
    rs = random(-ROTRANGE,ROTRANGE);

    ribwidth = min(xsz,ysz)/4;
    col = color(random(128,255),random(128,255),random(128,255));
    ribcol = color(random(128,255),random(128,255),random(128,255));
  }
  int move(){
    ys = ys + GRAV;
    x = x + xs;
    y = y +ys;
    r = r + rs;
    
    if(  abs(x - (sock.x+sock.sz/2)) < (xsz+ysz)*1.4/2){
      if(y >= sock.y && y <= sock.y + (2*sock.sz)){

        return CAUGHT; //caught 
      }
      
    }
    
    if(y > height){
      return MISSED; //offscreen 
    } 
    else {
      return OK; 
    }
  }


  void draw(){
    rectMode(CENTER);
    ellipseMode(CENTER);
    fill(col);
    noStroke();
    pushMatrix();
    translate(x,y);
    rotate(r);
    rect(0,0,xsz,ysz);
    fill(ribcol);
    rect(0,0,ribwidth,ysz);
    rect(0,0,xsz,ribwidth);
    ellipse(0,-ysz/2-(ribwidth/2),ribwidth*2,ribwidth*2);

    popMatrix();
    rectMode(CORNER);

  }

}
static int POINTCOUNT = 6;
class Splosion{

  float x,y;
  float[] xpoint = new float[POINTCOUNT];
  float[] ypoint = new float[POINTCOUNT];

   Splosion(gift g){
      x = g.x;
      y = g.y;
      doPoints();
      
   } 
   int counter = int(random(10));
   void draw(){
     if(counter % 10 == 0){
      doPoints(); 
     }
     counter ++;
      strokeWeight(2);
      stroke(0);
      fill(200,200,0);
      beginShape();
            for(int i = 0; i <= POINTCOUNT;i++){
      vertex(  x+ xpoint[i%POINTCOUNT],y+ypoint[i%POINTCOUNT]);
      //vertex(  x+ random(-20,20),y+random(-20,20));
            }

      endShape();

   }
void doPoints(){
       for(int i = 0; i < POINTCOUNT;i++){
         xpoint[i] = random(-15,15);
         ypoint[i] = random(-15,15);
      }
 
}
}


class Stocking{
  float y,x;
float sz = 20;
  Stocking(float y){
    this.y = y; 
  }
  void move(){
    this.x = mouseX; 
  }
  void draw(){
    stroke(0);
    strokeWeight(2);


    drawStocking(x,y,sz,true);
    drawStocking(x,y,sz,false);

  }

}
color MYRED = color(200,0,0);
void drawStocking(float x, float y, float sz, boolean black){
  if(black){
    strokeWeight(6);   
  } 
  else {
    strokeWeight(0); 
  }

  if(black){
    stroke(0);
    fill(0); 
  } 
  else {
    stroke(MYRED); 
    fill(MYRED); 
  }
  rect(x,y,sz,sz*1.5);
  ellipse(x,y+sz,sz*1.5,sz);  

  if(!black){
    fill(255);
    stroke(255); 
  }
  rect(x,y-sz/2,sz,sz/2);

  //   triangle(x+3,y+sz*1.4,x+sz/2,y+sz/2,x+sz-1,y+sz+1);
}






void centerText(float x, float wid, float y, String s,float w){
  float len = w * s.length();
  float newx = x +  ( (wid-len)/2);
  fontText(newx,y,s,w);
}

void fontText(float x, float y, String s,float w){
  s = s.toUpperCase();
    for(int i = 0; i < s.length();i++){
       drawChar(s.substring(i,i+1),x,y,w-3,12);
      x += w; 
    }
}  

void setupFont(){
 font.put("0",new int[] {1,2,5,6,9,10,13,14});
font.put("1",new int[] {4,11} );
font.put("2",new int[] {1,6,8,7,9,14} );
font.put("3",new int[] {1,6,8,7,13,14} );
font.put("4",new int[] {2,7,8,6,13} );
font.put("5",new int[] {1,2,7,8,13,14} );
font.put("6",new int[] {1,2,7,8,13,14,9} );
font.put("7",new int[] {1,6,13} );
font.put("8",new int[] {1,2,6,7,8,9,13,14} );
font.put("9",new int[] {1,2,6,7,8,13,14} );
font.put("A",new int[] {9,2,1,6,13,7,8} );
font.put("B",new int[] {1,14,4,6,11,13,8} );
font.put("C",new int[] {1,2,9,14} );
font.put("D",new int[] {1,14,4,11,6,13} );
font.put("E",new int[] {1,2,7,9,14} );
font.put("F",new int[] {1,2,7,9} );
font.put("G",new int[] {1,2,9,14,13,8} );
font.put("H",new int[] {2,9,6,13,7,8} );
font.put("I",new int[] {1,4,11,14} );
font.put("J",new int[] {9,14,13,6} );
font.put("K",new int[] {2,9,7,5,12} );
font.put("L",new int[] {2,9,14} );
font.put("M",new int[] {9,2,3,5,6,13} );
font.put("N",new int[] {9,2,3,12,13,6} );
font.put("O",new int[] {1,2,9,14,13,6} );
font.put("P",new int[] {1,2,6,7,8,9} );
font.put("Q",new int[] {1,2,6,9,14,13,12} );
font.put("R",new int[] {1,2,6,7,8,9,12} );
font.put("S",new int[] {1,2,7,8,13,14} );
font.put("T",new int[] {1,4,11} );
font.put("U",new int[] {2,9,14,13,6} );
font.put("V",new int[] {2,9,10,5} );
font.put("W",new int[] {2,9,14,13,6,11} );
font.put("X",new int[] {3,10,5,12} );
font.put("Y",new int[] {3,5,11} );
font.put("Z",new int[] {1,5,10,14} );

font.put(" ",new int[] {} );
font.put(".",new int[] {0} );
font.put(",",new int[] {10} );
font.put("!",new int[] {4,11,0} );

font.put("?",new int[] {1,2,6,8,11,0} ); 
font.put("&",new int[] {1,3,6,8,9,12,14} ); 
font.put("+",new int[] {4,7,8,11} ); 
}

void drawChar(String c, float x, float y, float w, float h){

   int[] segs = (int[])font.get(c);
   if(segs == null) return;
   for(int i = 0; i < segs.length; i++){

      switch(segs[i]){
         case 1:
         line(x,y,x+w,y); break;
         case 2:
         line(x,y,x,y+(h/2));break;
         case 3:
         line(x,y,x+(w/2),y+(h/2));break;
         case 4:
         line(x+(w/2),y,x+(w/2),y+(h/2));break;
         case 5:
        line(x+w,y,x+(w/2),y+(h/2));  break;       
        case 6:
        line(x+w,y,x+w,y+(h/2));break;
         case 7:
          line(x,y+(h/2),x+(w/2),y+(h/2));break;
          case 8:
          line(x+(w/2),y+(h/2),x+w,y+(h/2));break;
          case 9:
          line(x,y+(h/2),x,y+h);break;
          case 10:
          line(x,y+h,x+w/2,y+h/2);break;
          case 11:
          line(x+w/2,y+h/2,x+w/2,y+h);break;
          case 12:
          line(x+w/2,y+h/2,x+w,y+h);break;
          case 13:
          line(x+w,y+h/2,x+w,y+h);break;
          case 14:
          line(x,y+h,x+w,y+h);break;
          case 0:
          line(x+w/2-w/6,y+h+h/4,x+w/2+w/6,y+h+h/4);break;
          
        default:
       break; 
      }
     
     
   }
}




