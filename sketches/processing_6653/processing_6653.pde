
float TUBETOP = 10;
float TUBEWIDTH = 40;
float TUBEHEIGHT = 40;
float TRIHEIGHT = 15;
float TUBELEFT = (250 - TUBEWIDTH) / 2;
float STRIPEHEIGHT = 10;

int jokeptr = 0;


HashSet dots;
HashSet confetti ;
HashMap font = new HashMap(); 

boolean broken = false;
float offX, offY ;//how far it is from home
void reset(){
  pickColors();
  pickDots();
  broken = false;
  grabbed = false;
  confetti = new HashSet();  
}
void keyPressed(){
  if(key==' '){
    reset();
  } 
}

boolean grabbed = false;
float grabX,grabY;
float xspeed,yspeed;

void mousePressed(){
  if(! broken){
    float topGrab = TUBETOP + 4*TRIHEIGHT+2*TUBEHEIGHT;
    if(mouseY > topGrab && mouseY < topGrab+TUBEHEIGHT){
      if(mouseX > TUBELEFT && mouseX < TUBELEFT+TUBEWIDTH){
        grabbed = true;
        grabX = mouseX;
        grabY = mouseY;
      } 
    }
  } 
}

float dropX,dropY; //where the bottom part is dropped initially
float dropYSpeed = 0;



void mouseReleased(){
  grabbed = false; 
}
void mouseDragged(){
  if(!broken && grabbed){
    if(mag(mouseX-pmouseX,mouseY-pmouseY) > 20){
      broken = true;
      for(int i = 0; i < 30; i++){
        confetti.add(new Confetti()); 
      }
      confetti.add(new Crown());
      confetti.add(new Ball());
    }
        jokeptr = 2 * int(random(jokes.length / 2));
  } 
  if(grabbed && broken){
    dropX = mouseX;
    dropY = mouseY;
  }
}

void setup(){
  size(250,250); 
  frameRate(30);
  setupFont();
  reset();  
}
color c1;
color c2;
void pickColors(){
  c1 = randomColor();
  c2 = randomColor();
}
class Dot{
  float x,y,sz;
  Dot(float x,float y,float sz){
    this.x=x;
    this.y=y; 
    this.sz=sz; 
  }
  void draw(){
    noStroke();
    fill(c2);
    ellipse(x,y,sz,sz); 
  }
}




abstract class Thingy{
float   x = 125;
float   y = TUBETOP+TUBEHEIGHT*2 + TRIHEIGHT*2;
float   xspeed = random(-5,5);
float   yspeed = random(-5,5);
color   c = randomColor();
  void move(){
    x += xspeed;
    y += yspeed;
    yspeed += .1; 
  }
abstract void draw(); 
}

class Ball extends Thingy{
   void draw(){
     ellipse(x,y,30,30);
   } 
}

float CROWNWIDTH = 100;
float CROWNHEIGHT = 30;
int CROWNPOINTS = 7;

class Crown extends Thingy{
void draw(){
   strokeWeight(2);
  stroke(0);
 fill(c);
 beginShape();
 float left = x - CROWNWIDTH/2;
 
  vertex(left + CROWNWIDTH, y);
  vertex(left + CROWNWIDTH, y + CROWNHEIGHT);
  vertex(left, y + CROWNHEIGHT);
  vertex(left, y );

  for(int i = 1; i <= CROWNPOINTS;i++){

    float up = y;
    if(i % 2 == 1){
       up -= CROWNHEIGHT*2/3; 
    }
    vertex(left + (CROWNWIDTH * i/(CROWNPOINTS+1)),up);
  }
 vertex(left + CROWNWIDTH, y);
 
endShape(); 
}


}
class Confetti extends Thingy{
  void draw(){
    noStroke();
    fill(c);
    rect(x,y,5,5);
  }


}

void pickDots(){
  dots = new HashSet();
  for(int i = 0; i<3;i++){
    float sz = random(10,18);
    float x = random(TUBELEFT +sz/2, TUBELEFT + TUBEWIDTH - sz/2);
    float y = 10 + (TUBEHEIGHT*7/6) + TRIHEIGHT*2 +  i*((TUBEHEIGHT / 3));
    dots.add(new Dot(x,y,sz));
  }
}

float GRAV = 2;

void draw(){
  background(255);


  if(grabbed && !broken){
    offX = mouseX-grabX + random(offX/3);
    offY = mouseY-grabY + random(offY/3);
    offX = constrain(offX,-TUBEWIDTH,TUBEWIDTH);
    offY = constrain(offY,-TUBEWIDTH,TUBEWIDTH);
  } 

  if(offX < -3)        xspeed += GRAV;
  if(offX > 3)        xspeed -= GRAV;
  if(offY < -3)        yspeed += GRAV;
  if(offY > 3)        yspeed -= GRAV;

  xspeed *= .8;
  yspeed *= .8;

  offX += xspeed;
  offY += yspeed;
  pushMatrix();
  translate(offX,offY); 
  strokeWeight(6); 
  fill(0); 
  stroke(0);
  drawTop() ;
  strokeWeight(2); 
  fill(c1); 
  stroke(c1);
  drawTop() ;
  popMatrix();
if(broken){
stroke(0);strokeWeight(2);
fill(200);
  rect(5, 145, 240, 85);

  String joke = jokes[jokeptr];

  String punchline = jokes[jokeptr+1];
stroke(0,100,0);
  fontText(10,150,joke,8,12);
stroke(100,0,0);

  fontText(10,190,punchline,8,12);
}

  if(broken){
    if(!grabbed){
      dropYSpeed += .1;
      dropY += dropYSpeed;
    }
pushMatrix();
    translate(dropX-125,dropY-(3*TUBEHEIGHT+4*TRIHEIGHT));

    strokeWeight(6); 
    fill(0); 
    stroke(0);
    drawBottom() ;
    strokeWeight(2); 
    fill(c1); 
    stroke(c1);
    drawBottom() ;
popMatrix();
    Iterator I = confetti.iterator();
    while(I.hasNext()){
      Thingy c = (Thingy)I.next();
      c.move();
      c.draw(); 
//      print(c.x+" ");
    }
//    println("---");
  }

  // drawMiddle();
  // drawBottom();

}

void drawBottom(){
  beginShape();
  vertex(TUBELEFT,TUBETOP+2*TUBEHEIGHT+4*TRIHEIGHT);//g
  vertex(TUBELEFT,TUBETOP+3*TUBEHEIGHT+4*TRIHEIGHT);//h
  vertex(TUBELEFT+TUBEWIDTH,TUBETOP+3*TUBEHEIGHT+4*TRIHEIGHT);//i

  vertex(TUBELEFT+TUBEWIDTH,TUBETOP+2*TUBEHEIGHT+4*TRIHEIGHT);//j


  for(int i = 7; i >= 1; i--){
    float offset = 0;
    if(i % 2 == 1){
      offset = 5; 
    }
    vertex(TUBELEFT+(TUBEWIDTH*i/8),TUBETOP+2*TUBEHEIGHT+4*TRIHEIGHT + offset);//g
  }
  endShape(CLOSE); 
  doStripe(TUBETOP + 2*TUBEHEIGHT+4*TRIHEIGHT);

}


void drawTop(){
  if(!broken){
    beginShape(); 
    vertex(TUBELEFT,TUBETOP);//a
    vertex(TUBELEFT,TUBETOP+TUBEHEIGHT);//b
    vertex(TUBELEFT+(TUBEWIDTH/2),TUBETOP+TUBEHEIGHT+TRIHEIGHT);//c
    vertex(TUBELEFT,TUBETOP+TUBEHEIGHT+2*TRIHEIGHT);//d
    vertex(TUBELEFT,TUBETOP+2*TUBEHEIGHT+2*TRIHEIGHT);//e

    vertex(TUBELEFT+(TUBEWIDTH/2),TUBETOP+2*TUBEHEIGHT+3*TRIHEIGHT);//f

    vertex(TUBELEFT,TUBETOP+2*TUBEHEIGHT+4*TRIHEIGHT);//g
    vertex(TUBELEFT,TUBETOP+3*TUBEHEIGHT+4*TRIHEIGHT);//h
    vertex(TUBELEFT+TUBEWIDTH,TUBETOP+3*TUBEHEIGHT+4*TRIHEIGHT);//i

    vertex(TUBELEFT+TUBEWIDTH,TUBETOP+2*TUBEHEIGHT+4*TRIHEIGHT);//j

    vertex(TUBELEFT+(TUBEWIDTH/2),TUBETOP+2*TUBEHEIGHT+3*TRIHEIGHT);//k

    vertex(TUBELEFT+TUBEWIDTH,TUBETOP+2*TUBEHEIGHT+2*TRIHEIGHT);//l

    vertex(TUBELEFT+TUBEWIDTH,TUBETOP+TUBEHEIGHT+2*TRIHEIGHT);//m
    vertex(TUBELEFT+(TUBEWIDTH/2),TUBETOP+TUBEHEIGHT+TRIHEIGHT);//n
    vertex(TUBELEFT+TUBEWIDTH,TUBETOP+TUBEHEIGHT);//o
    vertex(TUBELEFT+TUBEWIDTH,TUBETOP);//p  
    endShape(CLOSE);
  } 
  else {

    beginShape(); 
    vertex(TUBELEFT,TUBETOP);//a
    vertex(TUBELEFT,TUBETOP+TUBEHEIGHT);//b
    vertex(TUBELEFT+(TUBEWIDTH/2),TUBETOP+TUBEHEIGHT+TRIHEIGHT);//c
    vertex(TUBELEFT,TUBETOP+TUBEHEIGHT+2*TRIHEIGHT);//d
    vertex(TUBELEFT,TUBETOP+2*TUBEHEIGHT+2*TRIHEIGHT);//e

    for(int i = 1; i <= 7; i++){
      float offset = 0;
      if(i % 2 == 1){
        offset = 5; 
      }
      vertex(TUBELEFT + (TUBEWIDTH*i/8),(TUBETOP+2*TUBEHEIGHT+2*TRIHEIGHT)+offset);//e

    }

    vertex(TUBELEFT+TUBEWIDTH,TUBETOP+2*TUBEHEIGHT+2*TRIHEIGHT);//l

    vertex(TUBELEFT+TUBEWIDTH,TUBETOP+TUBEHEIGHT+2*TRIHEIGHT);//m
    vertex(TUBELEFT+(TUBEWIDTH/2),TUBETOP+TUBEHEIGHT+TRIHEIGHT);//n
    vertex(TUBELEFT+TUBEWIDTH,TUBETOP+TUBEHEIGHT);//o
    vertex(TUBELEFT+TUBEWIDTH,TUBETOP);//p  
    endShape(CLOSE);

  }




  doStripe(TUBETOP);
  if(!broken){
    doStripe(TUBETOP + 2*TUBEHEIGHT+4*TRIHEIGHT);
  }
  Iterator i = dots.iterator();
  while(i.hasNext()){
    Dot d = (Dot)i.next(); 
    d.draw();
  }

}



void doStripe(float top){
  fill(c2);
  noStroke();

  beginShape();
  vertex(TUBELEFT,top + ((TUBEHEIGHT - STRIPEHEIGHT) /2));
  vertex(TUBELEFT,top + ((TUBEHEIGHT - STRIPEHEIGHT) /2)+STRIPEHEIGHT);
  vertex(TUBELEFT+TUBEWIDTH,top + ((TUBEHEIGHT - STRIPEHEIGHT) /2)+STRIPEHEIGHT);
  vertex(TUBELEFT+TUBEWIDTH,top + ((TUBEHEIGHT - STRIPEHEIGHT) /2));

  endShape(CLOSE);

}


color randomColor(){
return  color(random(128,255),random(128,255),random(128,255));
}

// via  http://www.whychristmas.com/fun/cracker_jokes.shtml 
static String[] jokes = {
"Why does Santa have three gardens?",
"So he can 'ho ho ho'!",
"Why did Santa's helper see the doctor?",
"Because he had a low 'elf' esteem!",
"What kind of motorbike does Santa ride?",
"A Holly Davidson!",
"What do you call a cat in the desert?",
"Sandy Claws!",
"What does Santa do with fat elves?",
"He sends them to an Elf Farm!",
"What do you get if you cross Santa with a duck?",
"A Christmas Quacker!",
"Who delivers presents to baby sharks at Christmas?",
"Santa Jaws",
"What do you call Santa's little helpers?",
"Subordinate clauses!",
"How long do a reindeers legs have to be?",
"Long enough so they can touch the ground!",
"What do reindeer hang on their Christmas trees?",
"Horn-aments!",
"Did Rudolph go to school?",
"No. He was Elf-taught!",
"What's worse than Rudolph with a runny nose?",
"Frosty the snowman with a hot flush!",
"Why did the Rudolph cross the road?",
"Because he was tied to the chicken!",
"Why did the turkey cross the road?",
"Because he wasn't chicken!",
"Why did the turkey cross the road?",
"Because it was the chicken's day off!",
"What happened to the turkey at Christmas?",
"It got gobbled!",
"What do snowmen wear on their heads?",
"Ice caps!",
"How do snowmen get around?",
"They ride an icicle",
"How does Good King Wenceslas like his pizzas?",
"One that's deep pan, crisp and even!",
"Who hides in the bakery at Christmas?",
"A mince spy!",
"What did Adam say on the day before Christmas?",
"It's Christmas, Eve!",
"How many letters are in the angelic alphabet?",
"The Christmas alphabet has 'no EL'!",
"What carol is heard in the desert?",
"O camel ye faithful!",
"What is the best xmas present in the world?",
"A broken drum, you just can't beat it!",
"How do sheep in Mexico say Merry Christmas?",
"Fleece Navidad!",
"How did Scrooge with the football game?",
"The ghost of christmas passed!",
"What athlete is warmest in winter?",
"A long jumper!",
"What do you get if you eat Christmas decorations?",
"Tinsilitis!",
"What's the most popular Christmas wine?",
"'I don't like Brussels sprouts!'",
"Why do ghosts live in the fridge?",
"Because it's cool!",
"What did the beaver say to the Christmas Tree?",
"Nice gnawing you!",
"What do crackers, fruitcake and nuts remind me of?",
"You!",
"What do you get if you cross a bell with a skunk?",
"Jingle Smells!",
"Where would you find chili beans?",
"At the north pole!",
"Why don't penguins fly?",
"Because they're not tall enough to be pilots!",
"What do sheep say at Christmas?",
"Wool-tide Bleatings!"
  
};





void fontText(float x, float y, String s,float w, float h){
  float origx =x ;
  s = s.toUpperCase();
  String[] words = s.split(" ");
    for(int  wordptr = 0; wordptr < words.length; wordptr++){
       String word = words[wordptr];
       if(x + word.length()*w > 240){
          x = origx;
          y += h * 1.4;
       } 
      for(int i = 0; i < word.length();i++){
        drawChar(word.substring(i,i+1),x,y,w-3,h);
        x += w; 
    }
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
font.put("'",new int[] {4} );

font.put("?",new int[] {1,2,6,8,11,0} ); 
font.put("&",new int[] {1,3,6,8,9,12,14} ); 
font.put("+",new int[] {4,7,8,11} ); 
font.put("-",new int[] {7,8} );
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




