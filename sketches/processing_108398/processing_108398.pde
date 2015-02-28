
textSize(90);
 text("★", x-45,y+30);
  fill(255,225,0);
  //head
  ellipse(x,y,30,30);
  fill(random(225),random(225),0);
  //eyes
  ellipse(x+10,y-2,12,12);
  ellipse(x-10,y-2,12,12);}
   
  void keyPressed(){
    
    if (keyCode ==RIGHT) {
      x+=speed;
      x+=speed*2;
     fill(255,255,random(255));
      ellipse(x,y,x-150,y-198);}
     if (keyCode ==LEFT){
       x+=speed;
      x-=speed*2;
       fill(255,255,random(255));
      ellipse(x,y,x-150,y-198);
    }
    if(keyCode==DOWN){
      y+=speed;
      y+=speed*2;
      fill(255,255,random(255));
      ellipse(x,y,x-150,y-198);}
      if(keyCode==UP){
        y+=speed;
        y+=-speed*2;
        fill(255,255,random(255));
        ellipse(x,y,x-150,y-198);}
  }
