
class Drop{
  float dropRadius =5;
  float x; //pos
  float y; //pos
  float ox; //old pos
  float oy; //old pos
  float sx; //speed
  float sy; //speed
  float vx=0; // acceleration
  float vy=0; // acceleration
  float vis;
  float el;
  float ps;
  int cellNumber;
 // PImage dotlet;

 Drop(float xpos, float ypos,float viscosity,float elasticity){
  // dotlet = loadImage("particleSmall.png");
  x = xpos;
  y = ypos;
  ox = x+random(2)-1;
  oy = y+random(2)-1;
  vis = viscosity;
  el = elasticity;
 } 
 
 void DropUpdate(Drop drops[]){
   if(ps>=1){
     ps-=.01;
   }

  y+=gravity/2;

   float tempx=x;
   float tempy=y;
   vx=(x-ox); 
   vy=(y-oy);
   sx=abs(vx);
   sy=abs(vy);   
   ox = tempx;
   oy = tempy;
   DropCollisionCheck(drops);
   
   x += vx;
   y += vy;
   DropWallCollisionCheck();
   
 }

 
 void DropCollisionCheck(Drop drops[]){
  for(int i=0; i<drops.length; i++){

    /*if( cellNumber == drops[i].cellNumber ||
    cellNumber == drops[i].cellNumber+1 ||
     cellNumber == drops[i].cellNumber-1 ||
    cellNumber == drops[i].cellNumber+20 ||
    cellNumber == drops[i].cellNumber-20 )*/
if(x+5>drops[i].x && x-5<drops[i].x && y+5>drops[i].y && y-10<drops[i].y)
{
  float tempDistX=(x-drops[i].x);
  float tempDistY=(y-drops[i].y);
    float tempDist = tempDistX*tempDistX+tempDistY*tempDistY; //distance
    
    if(tempDist <= ((dropRadius+(vis*dropRadius))*(dropRadius+(vis*dropRadius))) && this != drops[i]){ //stickyness
    float axVel=(vx+drops[i].vx)/2;
    float ayVel=(vy+drops[i].vy)/2;
    vx=axVel;
    vy=ayVel;
    drops[i].vx=axVel;
    drops[i].vy=ayVel;
    
        if(tempDist <= ((dropRadius+(dropRadius*el))*(dropRadius+(dropRadius*el))) && this != drops[i]){
      /*Spring Spring = new Spring(dropRadius);
      Spring.SpringUpdate(drops,this,i,tempDistX,tempDistY);
      if(debug==true){
      Spring.SpringRender(drops,this,i);
      }*/
         float push = ((sqrt(tempDist))-2*dropRadius)/dropRadius;
    x+=(tempDistX*push*(.01));
    y+=(tempDistY*push*(.01));
    drops[i].x-=(tempDistX*push*(.01));
    drops[i].y-=(tempDistY*push*(.01));
      
    }
        if(tempDist <= dropRadius*dropRadius && this != drops[i]){ //seperation
   float push = ((sqrt(tempDist))-2*dropRadius)/dropRadius;
    x-=(tempDistX*push*(.05));
    y-=(tempDistY*push*(.05));
    drops[i].x+=(tempDistX*push*(.05));
    drops[i].y+=(tempDistY*push*(.05));
    }
    } 
    } //end of grid check
  }
  
 }
 
  void DropWallCollisionCheck(){
    
   if(x>width-boarderSize){
    vx=-vx;
    x--;
   }
      if(x<0+boarderSize){
    vx=-vx;
    x++;
   }
      if(y>height-boarderSize){
     vy=-vy;
     y--;
   }
      if(y<0+boarderSize){
     vy=-vy;
     y++;
   }
  }
 
 void DropDraw(){
   //ellipse(x,y,dropRadius*2,dropRadius*2);
   if(debug==false){
    
    if(openglOn == true){
      stroke(88,255/sqrt((sy*sy)+(sx*sx)),255,172.5);
    strokeWeight(6);
    point(x,y);

        strokeWeight(6);
     line(x,y,ox,oy);
    }else{
      stroke(88,255/sqrt((sy*sy)+(sx*sx)),255);
           strokeWeight(1);
           line(x,y,ox,oy);
    }
     
    
   } else{
       strokeWeight(1);
       line(x,y,ox,oy);
       strokeWeight(1);

   }
    //point(x,y);
  //  image(dotlet,x,y,5,5);
 }
 
}

