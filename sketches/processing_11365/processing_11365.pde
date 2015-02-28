


float GAMESIZE = 500;
float MIDX = GAMESIZE/2;
float MIDY = GAMESIZE/2;
Guy guy = new Guy();
Bullet b = null;
HashSet centipedes;// = new HashSet();
HashSet shrooms;// = new HashSet();


void setup(){
  frameRate(60);


   size(500,500); 
noCursor();   
reset();
}


void keyPressed(){
   if(key == ' ')reset(); 
}
int ccount;
void reset(){
   ccount = 0;
   centipedes = new HashSet();
   shrooms = new HashSet();
   
   for(int i =0 ; i < 40 ;i ++){
    float a = random(-PI,PI);
    float d = random(GAMESIZE/16, GAMESIZE*7/16);
   shrooms.add(new Shroom(MIDX+cos(a)*d,MIDY+sin(a)*d)); 
   
      addCentipedes();
}
}

void addCentipedes(){
   if(centipedes.size() == 0){
     ccount++;

    for(int i = 0; i < ccount ;i++){
        addCentipede(); 
     }
  }
 
}

void draw(){
  background(128);
  noStroke();
  fill(0);
   ellipse(MIDX,MIDY,GAMESIZE,GAMESIZE); 
  if(frameCount % 100 == 1){
 
  }
  
  if(b!= null && b.move()) b = null;
  if(b!= null) b.draw(); 
  if(b == null && mousePressed){
     b =  new Bullet(guy);
  }

  Iterator ic = centipedes.iterator();
  while(ic.hasNext()){
    Centipede c =(Centipede)ic.next();
    if(c.isHead) c.headmove();
   
    if(c.checkhit()){
       ic.remove(); 
    } else {
       c.draw();
    }
  }  
  
  
  
  Iterator is = shrooms.iterator();
  while(is.hasNext()){
     Shroom s = (Shroom) is.next();
     s.draw();
    if(s.checkhit()){
       is.remove(); 
    }
  }
  
  guy.move();
  guy.draw();
  
addCentipedes();  

}


class Bullet{
    float x,y,a;
    Bullet(Guy g ){
        x = g.x;
        y = g.y;
        a = g.a;
    }
    float SPEED =  GAMESIZE/40;
    float BULLETSIZE = GAMESIZE/80;
    boolean move(){
      x += SPEED * cos(a);
      y += SPEED * sin(a);
      //println (dist(x,y,MIDX,MIDY));
      return dist(x,y,MIDX,MIDY) > GAMESIZE/2;
      
    }
    void draw(){
       fill(255); noStroke();
      ellipse(x,y,BULLETSIZE, BULLETSIZE);
    }
}


class Shroom {
   float x,y,a;
   int sz = 4;
   
   boolean checkhit(){
      if(b == null) return false;
     if(dist(x,y,b.x,b.y) < (sz*5 + b.BULLETSIZE)/2){
       b=null;
        sz--;
       if(sz <= 0){
          return true;
       } 
     }
     return false;
   }
   
   Shroom(float sx,float sy){
      x = sx; y = sy;
     a = -PI/2+ atan2(y-MIDY,x-MIDX);   
   }
   void draw(){
     strokeWeight(2);
     fill(0,0,255);
     stroke(128);
     arc(x,y, sz*5,sz*5,a,a+PI);
     arc(x,y, sz*2.5,sz*2.5,a+PI,a+(2*PI));
     line( x+(cos(a) * sz*2.5), y+(sin(a) * sz*2.5),x+(cos(a+PI) * sz*2.5), y+(sin(a+PI) * sz*2.5));
   }
}


class Guy{
  float x,y;
  float a;
  float GUYSIZE = GAMESIZE/40;
  float MAXIN = GAMESIZE/25;
  float MAXOUT = GAMESIZE/6;
   void move(){
      x = mouseX;
      y = mouseY;
      
       Iterator is = shrooms.iterator();
       while(is.hasNext()){
          Shroom s = (Shroom)is.next();
          if(dist(x,y,s.x,s.y) < ((s.sz)*5 + GUYSIZE)/2){
            float ang = atan2(y-s.y ,x-s.x);
            x = s.x + (cos(ang) *  ((s.sz)*5 + GUYSIZE/2));
            y = s.y + (sin(ang) *  ((s.sz)*5 + GUYSIZE/2));          
            
          }
       }
      
      a = atan2(y-MIDY,x-MIDX);
     // println(angle);
      if(dist(x,y,MIDX,MIDY) > MAXOUT){
          x = MIDX+ cos(a) *MAXOUT;
          y = MIDY+sin(a) * MAXOUT;
          
       //if(mouseY != pmouseY && mouseX != pmouseX){   
               // } 
      }/* else {
         if(dist(x,y,MIDX,MIDY) < MAXIN){
          x = MIDX+ cos(a) *MAXIN;
          y = MIDY+sin(a) * MAXIN;
      }
        
      }*/
   } 
   void draw(){
      stroke(128);
      fill(180,180,250);
      
      strokeWeight(4);
      line(x,y,x+(1.0*GUYSIZE*cos(a)),y+(1.0*GUYSIZE*sin(a)));
      strokeWeight(2);
      ellipse(x,y,GUYSIZE,GUYSIZE);
      
      

   } 
}

void addCentipede(){
  float a = random(-PI,PI);
  new Centipede(MIDX+cos(a)*GAMESIZE/2,MIDY+sin(a)*GAMESIZE/2);

}

Centipede addBody(Centipede c, int howmany){
  if(howmany <= 0) return null;
  return new Centipede(
  c.x + cos(c.a)*c.PEDESIZE,
  c.y + sin(c.a)*c.PEDESIZE,
  c.a, 
  howmany-1);
}

class Centipede{
   float x,y,a;
   float as = random(-.05,.05);
   float PEDESIZE = GAMESIZE/40;
   float SPEED =  GAMESIZE/80;
   boolean isHead;
   boolean dead = false;
   Centipede nextBit; 
   Centipede(float sx, float sy){
     isHead = true; 
     x = sx; y = sy; 
     aimToGuy();
     a -= PI;
      nextBit = addBody(this,10);
      a += PI;
      a += random(-PI,PI);
            centipedes.add(this);
   }
     Centipede(float sx, float sy, float sa, int howmany){
       isHead = false;
      x = sx; y = sy; a = sa;
      nextBit =  addBody(this,howmany);
      centipedes.add(this);
   }
   
     boolean checkhit(){
      if(b == null) return false;
     if(dist(x,y,b.x,b.y) < (PEDESIZE + b.BULLETSIZE)){
       b=null;
        dead = true;
        shrooms.add(new Shroom(x,y));
       if(nextBit != null && nextBit.dead == false){
          nextBit.isHead = true;
          nextBit.a += PI;
       }
       return true;
     }
     return false;
   }
   
   
   void aimToGuy(){
      a = atan2(guy.y-y,  guy.x-x); 
   }
   void draw(){
      stroke(128);
      fill(50,220,50);
      strokeWeight(2);
      ellipse(x,y,PEDESIZE,PEDESIZE);
       
       if(isHead){
         fill(200,0,0);
         stroke(200,0,0);
          ellipse(x +(.5 * PEDESIZE* cos(a+PI/4)),y+(.5 * PEDESIZE*sin(a+PI/4)),PEDESIZE/4,PEDESIZE/4); 
          ellipse(x +(.5 * PEDESIZE* cos(a-PI/4)),y+(.5 * PEDESIZE*sin(a-PI/4)),PEDESIZE/4,PEDESIZE/4); 
       }
       
       if(nextBit != null && nextBit.dead == false){
          nextBit.draw(); 
       }
       
       
   } 
   float TURNSPEED = .05;
   void headmove(){
     /*
    float wantangle = atan2(y-guy.y,x-guy.x);
    float anglediff = (a - wantangle);  
    anglediff /= PI;
    //this next bit catches the "runaround"
    if(anglediff > 1){
      anglediff -= 2;
    }
    if(anglediff < -1){
      anglediff += 2;
    }
    if(anglediff > 0){
      a -= TURNSPEED; 
    } 
    else {
      a += TURNSPEED; 
    }
*/

     
     
       x += cos(a);
       y += sin(a);
       
//       println(x+" "+y);
       
       Iterator is = shrooms.iterator();
       while(is.hasNext()){
          Shroom s = (Shroom)is.next();
          if(dist(x,y,s.x,s.y) < ((s.sz)*5 + PEDESIZE)/2){
           // println("boom");
           // stroke(255,0,0);line(x,y,s.x,s.y);
            a += PI;
            float ang = atan2(y-s.y ,x-s.x);
            ang += random(-PI/6,PI/6);
            x = s.x + (cos(ang) *  ((s.sz)*5 + PEDESIZE/2));
            y = s.y + (sin(ang) *  ((s.sz)*5 + PEDESIZE/2));
           aimToGuy();            
            
          }

          
       }
       
       if(  dist(x,y,MIDX,MIDY) > GAMESIZE/2){
             float ang = atan2(y-MIDY ,x-MIDX);
              x = MIDX+(cos(ang) * GAMESIZE/2);
              y = MIDY+(sin(ang) * GAMESIZE/2);
              aimToGuy();
       }
       
       if(nextBit != null && nextBit.dead == false){
          nextBit.bodymove(this); 
       }
   }  
   void bodymove(Centipede c){
       a = atan2(y-c.y,x-c.x);
       x = c.x+cos(a)*( PEDESIZE);
       y = c.y+sin(a)* (PEDESIZE);
     
     
       if(nextBit != null && nextBit.dead == false){
          nextBit.bodymove(this); 
       }
     
   }
}


