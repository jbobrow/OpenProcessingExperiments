
HashSet gifts = new HashSet();
void setup(){
  size(250,250); 
  frameRate(30);
}
void draw(){
  background(0);
  
  if(mousePressed && frameCount % 2 == 0){
     gifts.add(new gift(mouseX,mouseY));
     
  }
  Iterator gi = gifts.iterator();
  while(gi.hasNext()){
     gift g = (gift)gi.next();
  if(g.move()) gi.remove();
  g.draw(); 
     
  }
}





class gift {
  float x,y,xs,ys,r,rs,xsz, ysz,ribwidth;
  color col, ribcol;

  float SPEEDRANGE = width / 50;
  float ROTRANGE = .3;
  float SIZEMIN = width / 10.0;
  float SIZEMAX = width / 5.0;
  float GRAV = .5;
  gift(float x, float y){
    this.x = x;
    this.y = y;
    xsz = random(SIZEMIN,SIZEMAX);
    //println(width);
    ysz = random(SIZEMIN,SIZEMAX);
    
    xs = random(-SPEEDRANGE,SPEEDRANGE);
    ys = -10 ;//random(0,-SPEEDRANGE*10);
    rs = random(-ROTRANGE,ROTRANGE);
    
    ribwidth = min(xsz,ysz)/4;
    col = color(random(128,255),random(128,255),random(128,255));
    ribcol = color(random(128,255),random(128,255),random(128,255));
  }
  boolean move(){
    ys = ys + GRAV;
    x = x + xs;
    y = y +ys;
    r = r + rs;
    if(y > height * 2){
       return true; //offscreen 
    } else {
       return false; 
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
    ellipse(0,-xsz/2,ribwidth*2,ribwidth*2);

    popMatrix();
  }

}



