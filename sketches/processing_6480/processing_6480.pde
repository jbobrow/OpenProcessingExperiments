
HashMap font = new HashMap();


String endtext = "You have rescued your snowy field from the snowman menace!\n\nThanks for being part of the site and at least in that way part of my life --\n\nHope your holidays are great!";

  String afterendtext = "\n(Click to Retry)";
  

PImage sig;
String intotext;

long timestart;

int HOWMANY = 6;

HashSet snowmen = new HashSet();
float BALLSIZE = 8;
float GRAV = .2;
float tx,ty;
HashSet snowballs = new HashSet();

int PRE = 0;
int PLAY = 1;
int POST = 2;
int gamemode = PLAY;

void setup(){
  size(250,250); 
  frameRate(40);
setupFont();

  intotext = "A small fotilla of menacing snowmen are hovering menacingly over your fair snowy field in a menacing manner!\n\n";
  intotext += "Click to begin and use your trusty snow-slingshot to protect your skies from this icy menace!\n\n";


resetsnow();
//  sig = loadImage("sig.gif");
}

void resetsnow(){
  snowmen = new HashSet();
  snowballs = new HashSet();
  for(int i = 0; i < HOWMANY; i++){
    snowmen.add(new snowman());
  }
  ballsused = 0;
  timestart = millis(); 
}



int ballsused = 0;

long endtime;

void showscores(){
  fill(60,60,200);
  float showtime;
  if(gamemode == PLAY){
    endtime = millis();
  }
  showtime = round((endtime - timestart) / 100.0);
  showtime /= 10.0;
  String t = "time: "+showtime;
  stroke(0);
  strokeWeight(2);
  fontText(5, height-20,t,7);    
  String b = "snowballs used: "+ballsused;
 fontText(100, height-20,b,7); 
}


void introtext(){
  fill(60,60,200);
//!!  text(intotext,20,20,width-40,height-120);
}

void aftertext(){
  fill(60,60,200);
stroke(0);
  //!!text(afterendtext,170,height-100);
  //!!image(sig, width-109, height-200);  
}

void draw(){
  background(128,128,255);
  stroke(0);
  strokeWeight(2);




  fill(255);
  noStroke();
  rect(0,height-50,width,50);


  Iterator i; 
  snowman s;
  i = snowmen.iterator();
  int alive = 0;
  
  while(i.hasNext()){
    s = (snowman)i.next();
    s.move();
    s.draw(); 
    if(s.life != s.DEAD){
        alive++;
    }
  }

  drawslingsticks();
  drawsling();

  if(gamemode != PRE){
    showscores();
  }

  i = snowballs.iterator();
  while(i.hasNext()){
    snowball b = (snowball)i.next();
    b.move();
    b.draw();
    if(b.offscreenForGood()){
      i.remove(); 
    } 
    else {
      Iterator j = snowmen.iterator();
      boolean removed = false;
      while(j.hasNext()){
        snowman m = (snowman)j.next(); 
        if(m.hitBy(b)){
          if(! removed){
            i.remove();
            removed = true;
          }
          m.kill(b);
        }
      }
    }

  }
  if(gamemode == PRE){
    introtext();
  } 
  if(gamemode == PLAY){
     if(alive == 0){
       gamemode = POST;
     }  
  }
  if(gamemode == POST){
   aftertext();
  }
  

}

void drawslingsticks(){

  strokeWeight(5);
  stroke(150,131,68);
  line(width/2,height-50,width/2,height-70);
  line(width/2,height-70,(width/2)-20,height-90);
  line(width/2,height-70,(width/2)+20,height-90);
}

void mouseReleased(){
  if(gamemode == PLAY){
    snowballs.add(new snowball());
    ballsused++;
  }

}


void keyPressed(){
  if(key == ' '){
          resetsnow();
        gamemode = PLAY;    
  }
}


void drawsling(){
  strokeWeight(2);
  stroke(255,128,128);
  tx = mouseX;
  ty = mouseY; 
  if(ty < height - 50) ty = height-50;

  if(mousePressed){
    noFill();
    ellipse(tx,ty,BALLSIZE,BALLSIZE);
    line(tx,ty,(width/2)-20,height-90);
    line(tx,ty,(width/2)+20,height-90);

  } 
  else {
    line((width/2)-20,height-90,(width/2)+20,height-90);

  }

}

class snowball{
  float xs,ys,x,y;
  snowball(){
    x = tx;
    y = ty;
    float midx = width/2;
    float midy = height-90;
    xs = (midx - tx)/6;
    ys = (midy - ty)/6;

  }
  void   draw(){
    stroke(0);
    strokeWeight(3);
    fill(255);
    ellipse(x,y,BALLSIZE,BALLSIZE);
  } 
  void move(){
    x += xs;
    y += ys;
    ys += GRAV; 
  }
  boolean offscreenForGood(){
    if(x < -20 && xs < 0){
      return true;
    } 
    if(x > width+20 && xs > 0){
      return true;
    } 
    if(y < - 20 && ys < 0){
      return true; 
    }
    return false;
  }

}


class snowman{
  float ball3,ball2,ball1;
  float x1,y1;
  float x2,y2;
  float x3,y3;
  float s1,s2,s3,s4,s5,s6;
  float s1x, s1y,s2x,s2y;
  float hatx,haty;
  float hatsize;
  float nx,ny;
  float speedxmain, speedymain;
  int ALIVE = 0;
  int DEAD = 1;
  int life;
  float speedx1, speedy1;
  float speedx2, speedy2;
  float speedx3, speedy3;
  float speedxstick1, speedystick1;
  float speedxstick2, speedystick2;
  float speedxhat, speedyhat;

  snowman(){
    float x = random(20,width-20);
    float y = random(40,height-150);
    ball1 = 15 + (random(0,8)-4);
    ball2 = 22 + (random(0,7)-5);
    ball3 = 30 + (random(0,8)-6);

    x1 = x2 = x3 = x;
    y1 = y - (ball2*.4)-(ball1*.4);
    y2 = y;
    y3 = y  + (ball2*.4)+(ball3*.4);

    s1 = random(0,6) - 3;
    s2 = random(0,6) - 3;
    s3 = random(0,6) - 3;
    s4 = random(0,6) - 3;
    s5 = random(0,6) - 3;
    s6 = random(0,6) - 3;

    s1x = x - (ball2*.5);
    s1y = y;
    s2x = x + (ball2*.5);
    s2y = y;

    hatx = x;
    haty = y1 - (ball1/2);
    hatsize = ball1;

    nx = random(0,8) - 4;
    ny = random(0,8) - 4;

    life = ALIVE;
    speedxmain = random(0,10) - 5;


  }
  float plusorminus(float range){
    return random(range * 2) - range; 
  }

  void kill(snowball b){
    float  var = 3;
    if(life != DEAD){
      life = DEAD; 

      speedx1 = ((speedxmain + b.xs) / 2) + plusorminus(var);
      speedy1 = ((speedymain + b.xs) / 2) + plusorminus(var);
      speedx2 = ((speedxmain + b.xs) / 2) + plusorminus(var);
      speedy2 = ((speedymain + b.xs) / 2) + plusorminus(var);
      speedx3 = ((speedxmain + b.xs) / 2) + plusorminus(var);
      speedy3 = ((speedymain + b.xs) / 2) + plusorminus(var);
      speedxstick1 = ((speedxmain + b.xs) / 2) + plusorminus(var);
      speedystick1 = ((speedymain + b.xs) / 2) + plusorminus(var);
      speedxstick2 = ((speedxmain + b.xs) / 2) + plusorminus(var);
      speedystick2 = ((speedymain + b.xs) / 2) + plusorminus(var);
      speedxhat = ((speedymain + b.xs) / 2) + plusorminus(var);
      speedyhat = ((speedymain + b.xs) / 2) + plusorminus(var);
    } 
    else {
      if(whathit == 1){
        speedx1 = ((speedxmain + b.xs) / 2) + plusorminus(var);
        speedy1 = ((speedymain + b.xs) / 2) + plusorminus(var);

      }
      if(whathit == 2){
        speedx2 = ((speedxmain + b.xs) / 2) + plusorminus(var);
        speedy2 = ((speedymain + b.xs) / 2) + plusorminus(var);

      }
      if(whathit == 3){
        speedx3 = ((speedxmain + b.xs) / 2) + plusorminus(var);
        speedy3 = ((speedymain + b.xs) / 2) + plusorminus(var);

      }
    }
  }
  int whathit;

  boolean hitBy(snowball b){
    float dist1 = sqrt( pow((x1 - b.x),2) + pow( (y1 - b.y),2));
    if(dist1 * 2 < BALLSIZE+ball1) { 
      whathit = 1; 
      return true;
    }
    float dist2 = sqrt( pow((x2 - b.x),2) + pow( (y2 - b.y),2));
    if(dist2 * 2 < BALLSIZE+ball2) { 
      whathit = 2; 
      return true;
    }

    float dist3 = sqrt( pow((x3 - b.x),2) + pow( (y3 - b.y),2));
    if(dist3 * 2 < BALLSIZE+ball3) { 
      whathit = 3; 
      return true;
    }



    return false; 
  }



  void move(){
    if(life == ALIVE){
      if(x3 < width / 2){
        speedxmain += .3; 
      } 
      else {
        speedxmain -= .3; 
      }
      //      speedxmain += (random(2)-1);
      x1 += speedxmain;
      x2 += speedxmain;
      x3 += speedxmain;
      s1x += speedxmain;
      s2x += speedxmain;
      hatx += speedxmain;

      if(x3 < ball3 ){
        speedxmain = abs(speedxmain) * .75;
      }
      if(x3 > width-ball3){
        speedxmain = abs(speedxmain) * -.75;

      } 

    }   
    else { //DEAD

      x1 += speedx1;
      y1 += speedy1;
      x2 += speedx2;
      y2 += speedy2;
      x3 += speedx3;
      y3 += speedy3;
      s1x += speedxstick1;
      s1y += speedystick1;
      s2x += speedxstick2;
      s2y += speedystick2;
      hatx += speedxhat;
      haty += speedyhat;
      speedy1 += GRAV;
      speedy2 += GRAV;
      speedy3 += GRAV;
      speedystick1 += GRAV;
      speedystick2 += GRAV;
      speedyhat += GRAV;



    }

  }

  void draw(){
    stroke(0);
    strokeWeight(4);
    fill(255);
    ellipse(x1,y1,ball1,ball1);
    ellipse(x2,y2,ball2,ball2);
    ellipse(x3,y3,ball3,ball3);
    noStroke();
    ellipse(x1,y1,ball1,ball1-1);
    ellipse(x2,y2,ball2,ball2-1);
    ellipse(x3,y3,ball3,ball3-1);
    //  ellipse(x1,y1,ball1*.66,ball1*.66);
    //ellipse(x2,y2,ball2*.75,ball2*.75);
    //ellipse(x3,y3,ball3*.75,ball3*.75);

    strokeWeight(3);
    stroke(150,131,68);
    line(s1x,s1y, s1x-(ball2*.5),s1y+s1);
    line( s1x-(ball2*.5),s1y+s1,s1x-ball2,s1y+s2);
    line( s1x-(ball2*.5),s1y+s1,s1x-ball2,s1y+s3);

    line(s2x,s2y, s2x+(ball2*.5),s2y+s4);
    line( s2x+(ball2*.5),s2y+s4,s2x+ball2,s2y+s5);
    line( s2x+(ball2*.5),s2y+s4,s2x+ball2,s2y+s6);

    fill(0);
    stroke(0);

    rect(hatx - (hatsize/4), haty - hatsize*.75, hatsize/2, hatsize*.75);
    rect(hatx - (hatsize/2), haty, hatsize,hatsize/8);

    ellipse(x1-(ball1/4),y1-(ball1/6),2,2);
    ellipse(x1+(ball1/4),y1-(ball1/6),2,2);

    stroke(247,179,33);
    line(x1,y1,x1+nx,y1+ny);



  } 


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
          line(x+w/2-w/6,y+h+h/6,x+w/2+w/6,y+h+h/6);break;
          
        default:
       break; 
      }
     
     
   }
}



