
class jump_ai{
  float x;
  float y;
  float nx;
  float ny;
  int time;
  boolean pre;
  PImage fatjumper;
  float distance;
  float timed;
  float timedd;
  
  jump_ai(){
    fatjumper = loadImage("FatJumper.bmp");
    rectMode(CENTER);
    pre = true;
    x = random(200,800);
    y = 200;
    time = millis();
    timed = random(3000,5000);
    timedd = random(1000,1500);
  }
  
 void pre(){
    distance = sqrt(pow(chr.x - x,2) + pow(chr.y - y,2));
    if(distance <= 22.5){
      display.health = display.health - 5;
      chr.knockback(60);
    }
   if(millis() - time <= timed && chr.dead == false){
     image(fatjumper,x,y);
     nx = chr.x;
     ny = chr.y;
   }
   else{
     if(millis() - time <= timed + timedd && chr.dead == false){
       image(fatjumper,x,y);
     }
     else{
       if(chr.dead == false){
         x = nx;
         y = ny;
         pre = true;
         time = millis();
         timed = random(3000,5000);
         timedd = random(500,1000);
       }
     }
   }
 }
}

class chase_ai{
  float x,y,xspeed,yspeed,distance,slimit,ms,framerateajust,framerateajusts;
  int type;
  PImage pic;
  
  chase_ai(){
    type = int(random(0,10));
    //types: 0-3:balenced, 4-6: speed demon 7: tracker 9: advanced 10 & 8: Slow Poke
    framerateajust = (30/frameRate)/1.75;
    framerateajusts = (30/frameRate)/1.5;
    if(type >= 0 && type <= 3){
      ms = 0.105 * framerateajust;
      slimit = 2.75 * framerateajusts;
    }
    if(type >= 4 && type <= 6){
      ms = 0.15 * framerateajust;
      slimit = 3.5 * framerateajusts;
    }
    if(type == 7){
      ms = 0.2 * framerateajust;
      slimit = 0.6 * framerateajusts;
    }
    if(type == 9){
      ms = 0.23 * framerateajust;
      slimit = 3.5 * framerateajusts;
    }
    if(type == 10 || type == 8){
      ms = 0.5 * framerateajust;
      slimit = 0.5 * framerateajusts;
    }
    pic = loadImage("ThePain.bmp");
    x = 450;
    y = random(300,400);
    xspeed = 0;
    yspeed = 0;
    distance = 1024;
    
  }
  
  void move(){
    println(type);
    distance = sqrt(pow(chr.x - x,2) + pow(chr.y - y,2));
    if(distance <= 15){
      display.health = display.health - 4;
      chr.knockback(70);
    }
    if(chr.x > x && chr.win == false && chr.dead == false){xspeed += ms;}
    if(chr.x < x && chr.win == false && chr.dead == false){xspeed -= ms;}
    if(chr.y > y && chr.win == false && chr.dead == false){yspeed += ms;}
    if(chr.y < y && chr.win == false && chr.dead == false){yspeed -= ms;}
    if(xspeed > slimit){xspeed = slimit;}
    if(xspeed < -slimit){xspeed = -slimit;}
    if(yspeed > slimit){yspeed = slimit;}
    if(yspeed < -slimit){yspeed = -slimit;}
    if(chr.dead == false && chr.win == false){
      x += xspeed;
      y += yspeed;
    }
    image(pic,x,y);
  }
  void knockback(){
    xspeed *= -1;
    yspeed *= -1;
  }
}
class shortchase_ai{
    float x,y,xspeed,yspeed,distance,slimit,ms,framerateajust,framerateajusts;
    int type;
    PImage pic;
    
    shortchase_ai(){
      type = int(random(0,10));
      //types: 0-3:balenced, 4-6: speed demon 7: tracker 9: advanced 10 & 8: Slow Poke
      framerateajust = (30/frameRate)/1.75;
      framerateajusts = (30/frameRate)/1.5;
      ms = 0.15;
      slimit = 3;
      pic = loadImage("ThePain.bmp");
      x = 450;
      y = random(300,400);
      xspeed = 0;
      yspeed = 0;
      distance = 1024;
    }
    void move(){
        distance = sqrt(pow(chr.x - x,2) + pow(chr.y - y,2));
        if(distance <= 15){
          display.health = display.health - 4;
          chr.knockback(70);
        }
        if (distance <= 100){
          if(chr.x > x && chr.win == false && chr.dead == false){xspeed += ms;}
          if(chr.x < x && chr.win == false && chr.dead == false){xspeed -= ms;}
          if(chr.y > y && chr.win == false && chr.dead == false){yspeed += ms;}
          if(chr.y < y && chr.win == false && chr.dead == false){yspeed -= ms;}
          if(xspeed > slimit){xspeed = slimit;}
          if(xspeed < -slimit){xspeed = -slimit;}
          if(yspeed > slimit){yspeed = slimit;}
          if(yspeed < -slimit){yspeed = -slimit;}
        }
        else{
          xspeed = 0;
          yspeed = 0;
        }
        if(chr.dead == false && chr.win == false){
          x += xspeed;
          y += yspeed;
        }
        image(pic,x,y);
    }
}

