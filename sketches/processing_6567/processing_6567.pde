
void setup(){
  size(250,250);
  frameRate(30); 
}
Angel a = new Angel(50,220);
Tree t = new Tree(200,140,60);
HashSet spots = new HashSet();


void draw(){
  background(200,200,255);
  
 fill(255);
 noStroke();
 rect(0,180,250,200);
  
  Iterator i = spots.iterator();
  while(i.hasNext()){
     Spot s = (Spot) i.next();
     s.draw(); 
  }
  

  
  if(abs(a.y - 100) < 2 && abs(a.x - 200) < 8){
/*strokeWeight(1);
stroke(255,0,0);
line(0,0,200,105);*/
    if(a.yspeed >= 0){
      if(a.yspeed < 2){
          a.xspeed = a.yspeed = 0;
          a.moving = false;
      } else {
         a.xspeed = 0; a.yspeed = -4; 
         a.shocked = 20;
         a.flap(LEFT);
         a.flap(RIGHT);
      }

    }
  } 
  a.move();  
  t.draw();
  a.draw();
  


}

void mousePressed(){
   a.flap(mouseButton);
   
}
void mouseReleased(){
   if(mouseButton == LEFT ){
      a.leftwingdown = false; 
   }
   if(mouseButton == RIGHT ){
      a.rightwingdown = false; 
   }
   
}

class Spot{
   float x,y;
  Spot(float x, float y){
     this.x = x; this.y = y;
  } 
  void draw(){
     noStroke(); 
     fill(225);
     ellipse(x,y,20,8);
  }
}

class Angel{
  float x, y, xspeed, yspeed;
  boolean moving = true;
  Angel(float x, float y){
    this.x = x;
    this.y = y;
  }  
  void flap(int way){
    moving = true;
    if(way == LEFT){
      leftwingdown = true; 
      xspeed += .5;
    } else {
      rightwingdown=true;
      xspeed -= .5;
    }
    yspeed -= 1;
  }
  void move(){
    if(!moving) return;
    yspeed += .1;
    y += yspeed;
    x += xspeed;
    
    if(y > 230){
       yspeed = 0;
      y = 230;
     xspeed = 0;
     spots.add(new Spot(x,y+8)); 
    }
    if(y < 0){
       yspeed *= -.75;
    }
    if(x < 0 || x > 250){
       xspeed *= -.75; 
       x += xspeed;
    }
    
  }
  boolean leftwingdown = false;
  boolean rightwingdown = false;

int shocked = 0;
  void draw(){

    if(! moving){
  strokeWeight(3);
       noFill();
       stroke(240,240,0);
//n
       line(x,y-27,x,y-40);

    //ne,nw
       line(x+15,y-15,x+30,y-30);
      line(x-15,y-15,x-30,y-30);

      line(x+26,y,x+40,y);
      line(x-26,y,x-40,y);

       line(x+15,y+15,x+30,y+30);
      line(x-15,y+15,x-30,y+30);

       line(x,y+17,x,y+30);

    }
    stroke(0);
    strokeWeight(2);



    fill(200);
    if(leftwingdown){
      triangle(x,y,x-12,y-8,x-17,y+5);
    } 
    else {
      triangle(x,y,x-10,y-10,x-20,y);
    }
    if(rightwingdown){
      triangle(x,y,x+12,y-8,x+17,y+5);
    } 
    else {
      triangle(x,y,x+10,y-10,x+20,y);
    }


    fill(255);

    triangle(x,y-10, x-10,y+10,x+10,y+10); 
    fill(255,200,200);
    ellipse(x,y-10,15,15);

    noFill();
    stroke(240,240,0);
    ellipse(x,y-20,15,5);
    noStroke();
    fill(0);
    if(shocked > 0){
      ellipse(x,y-8,6,6);
      shocked--;
      if(shocked == 4){
         rightwingdown=leftwingdown=false; 
      }
    }

  //  }
  }



}






class Tree {
  float x,y;
  float MINSIZE = width/10;
  float MAXSIZE = width / 5;
  float WIDTH,HEIGHT;
  float xs;

  ArrayList ornaments = new ArrayList();

  //float stroke ;
  Tree(float x, float y, float basesize){
    this.x = x;
    this.y = y;
    WIDTH = basesize * (.5 + norm(y,0,250)); // basesize * random(.8,1.2);
    HEIGHT = basesize *( .5 + norm(y,0,250));
    ;
    //stroke = basesize / 5;
    xs = 4*(.1 + norm(getBottom(),0,250));
    //int c = Math.round(random(3,8));
    for(int i = 1; i <= 3; i++){
      addOrnament(i/4.0);
    }
    addOrnament(4.0/5.0);
  }
  void addOrnament(float yper){
//    triangle(x,y-HEIGHT*.5,x-.75*WIDTH,y+HEIGHT,x+.75*WIDTH,y+HEIGHT);
      
      //float yper = random(1);
 
      float oy = (-HEIGHT*.5)    + (yper * (1.5 * HEIGHT));
      float xper = random(-1,1);
//xper = 1;
      float ox = xper * yper  * .75 * WIDTH;      
      ornaments.add(new Ornament(ox,oy));
  }

  void move(){
   // x = x - xs*speedmult;
  }  
  void draw(){
    strokeWeight(10);
    stroke(0);
    doTrunk();
    noStroke();
    doTrunk();
    stroke(0);
    doGreen();
    noStroke();
    doGreen();
    Iterator i = ornaments.iterator();
    while(i.hasNext()){
      Ornament o = (Ornament)i.next();
      strokeWeight(6);
      stroke(0);
      fill(o.c);
      ellipse(x+o.x,y+o.y,WIDTH/5,WIDTH/5); 
      noStroke();
      ellipse(x+o.x,y+o.y,WIDTH/5,WIDTH/5); 

    }

  }    
  float getBottom(){
    return  y+HEIGHT*1.5;
  }

  void doTrunk(){
    fill(128,64,0);
    rect(x -WIDTH*.075,y+HEIGHT*.5,WIDTH*.15,HEIGHT);
  }
  void doGreen(){

    fill(0,200,0);
    //upper
    mytri(-HEIGHT*.5, 0, WIDTH*.35);
    //middle
    mytri(-HEIGHT*.35,HEIGHT*.5,WIDTH*.55);
    //lower
    mytri(-HEIGHT*.2,HEIGHT,-WIDTH*.75);
  }    
  void mytri(float topOffset, float botOffset, float widthOffset){
    triangle(x,y+topOffset,x - widthOffset,y+botOffset,x+widthOffset, y+botOffset);
  }


}


class Ornament{
  float x,y;
  color c;
  Ornament(float x, float y){
    this.x = x;
    this.y = y;
    this.c = color(random(128,255),random(128,255),random(128,255));
  }


}



