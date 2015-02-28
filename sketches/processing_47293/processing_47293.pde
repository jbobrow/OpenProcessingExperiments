

santa s1;
mrsclaus s2;
HashSet skids = new HashSet();

float RING = 225;

void setup(){
  size(250,250);
   frameRate(50); 
  s1 = new santa(100,175);
  s2 = new mrsclaus(150,125);
}
void draw(){
  background(255);
  noStroke();
  fill(225,225,255);
  ellipse(125,125,RING,RING);
  
  Iterator si = skids.iterator();
  while(si.hasNext()){
     skid sk = (skid)si.next();
     sk.draw();
  }
  s1.move();
  s2.move();

  if(s1.y > s2.y){
  s2.draw(); 
  s1.draw(); 
  } else {
    s1.draw(); 
    s2.draw(); 
    
  }
  
}

void mousePressed(){
  s1.xs = (mouseX- s1.x )/ 20;
  s1.ys = (mouseY - s1.y )/20;
  s1.skid();

//she moves away from omouse
  s2.xs = (s2.x- mouseX+random(-20,20)  )/ 20;
  s2.ys = (s2.y - mouseY+random(-20,20)  )/20;
//she follows him
//  s2.xs = (s1.x - s2.x   )/ 20;
//  s2.ys = (s1.y - s2.y  )/20;
  s2.skid();
}
class skid{
  float x1,y1,x2,y2;
  float SIZE=width/10;
  skid(float x1, float y1, float x2, float y2){
    this.x1 = x1; 
    this.y1 = y1; 
    this.x2 = x2; 
    this.y2 = y2; 
  }
  void draw(){
    strokeWeight(2);
    stroke(200);
    line(x1,y1,x2,y2);
  }

}

boolean inRing(float  x, float y){
  return
  dist(125,125,x,y) <= 110;
}



class santa {
  float x,y;
  float xs,ys;
  float SIZE = width/10;
  santa(float x, float y){
    this.x = x;
    this.y = y; 
  }

  void skid(){
      float xleft1 = this.x-SIZE*.5;
      float xleft2 = xleft1 + xs;
      float xright1 = this.x+SIZE*.5;
      float xright2 = xright1 + xs;
      float y1 = this.y+SIZE*.4;
      float y2 = y1+ys;
      
    if(inRing(xleft1,y1) && inRing(xleft2,y2))
     skids.add(new skid(xleft1,y1,xleft2,y2));
    
    
    if(inRing(xright1,y1) && inRing(xright2,y2)) 
     skids.add(new skid(xright1,y1,xright2,y2)); 
     
     
     
  }


  void move(){
    x = x + xs;
    y = y + ys;

    santa o;
    if(this == s1) o = s2;
    else o = s1;

    if(dist(x,y,o.x,o.y) < SIZE){
      float ts = mag(xs,ys);  
       float os = mag(o.x,o.y);  
    float a = atan2(y-o.y,x-o.x);
    xs += cos(a) * ts*.9;
   ys += sin(a) * ts*.9;
   xs *= .5;
   ys *= .5;
    o.xs += cos(a+PI) * ts*.9;
   o.ys += sin(a+PI) * ts*.9;
   o.xs *= .5;
   o.ys *= .5;
   


      
    }


    if(! inRing(this.x, this.y)){
      
      xs *= -1.1;
      ys *= -1.1; 
      //x = x + xs;
      //y = y + ys;
      skid();  
  }

    xs *= .98;
    ys *= .98; 
  }


  void draw(){
    strokeWeight(2);
    stroke(0);
    fill(0);

    boolean front = true;
    if(ys < 0) {
      front = false; 
    }
fill(200);
    rect(x-SIZE*.5,y+SIZE*.4,SIZE/3,SIZE/5);
    rect(x+SIZE*.5,y+SIZE*.4,-SIZE/3,SIZE/5);

    stroke(0);

    if(!front) {
      fill(255); 
      ellipse(x, y-SIZE/2, SIZE*2/3, SIZE*2/3);// back of head

    } 


    fill(255,0,0);
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
    fill(255,0,0);
    triangle(x - SIZE/3,y-SIZE*.75,x+SIZE/3,y-SIZE*.75,x,y-SIZE*1.2); //hat
    fill(255);
    ellipse(x,y-SIZE*1.2,SIZE/4,SIZE/4);
  }

}





class mrsclaus extends santa{
  mrsclaus(int x, int y){
     super(x,y); 
  }


  void draw(){
    strokeWeight(2);
    stroke(0);
    fill(0);

    boolean front = true;
    if(ys < 0) {
      front = false; 
    }
fill(200);
    rect(x-SIZE*.5,y+SIZE*.4,SIZE/3,SIZE/5); //skate
    rect(x+SIZE*.5,y+SIZE*.4,-SIZE/3,SIZE/5); //skate

    stroke(0);

    if(!front) {
      fill(200); 
      ellipse(x, y-SIZE/2, SIZE*2/3, SIZE*2/3);// back of head
      ellipse(x,y-SIZE*7/8,SIZE/4,SIZE/4);//bun
 
    } 


    fill(128,0,0); //dark red
    ellipse(x,y,SIZE,SIZE); //body
    fill(255); 
    //rect(x-SIZE/2,y,SIZE,SIZE/8); //belt
    if(front) {
      fill(200);
      ellipse(x,y-SIZE*7/8,SIZE/4,SIZE/4);//bun
      fill(255,128,128); //skin
      ellipse(x, y-SIZE/2, SIZE*2/3, SIZE*2/3);//head

    } 
    if(front){
     // line(0,0,x,y);
      fill(200);
      stroke(0);
      arc(x, y-SIZE*5/8, SIZE*3/4, SIZE*3/6,PI,2*PI);
      line(x-SIZE*3/8, y-SIZE*5/8,x+SIZE*3/8, y-SIZE*5/8);     
  }
  fill(0,128,0);
//      rect(x-SIZE/2,y,SIZE,SIZE/2);
     quad(x-SIZE/2,y,
         x+SIZE/2,y,
         x+SIZE*5/8,y+SIZE/2,
         x-SIZE*5/8,y+SIZE/2);
 
  }

}












