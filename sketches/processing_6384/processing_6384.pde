
//pretty colour crackdown

int RESET_TIME = 30 * 30;
int framesTilFree = 0;
HashSet Sugarplums = new HashSet();
HashSet bullets = new HashSet();

void setup(){
  size(250,250); 
  frameRate(30);
  resetgame(); 

Sugarplums.add(new Sugarplum(100,100, color(random(130,255),random(100,187),random(135,280)),random(width/30,width/20),random(width/250,width/100),random(.05,.1)));  
}


void addSugarplum(){
  //float cr = random(1);
  //color c = color(139+(cr*115),102+(cr*85),139+(cr*115));
  color c = color(random(139,255),random(102,187),random(139,255));

Sugarplums.add(new Sugarplum(random(width),random(height), c,random(width/50,width/25),random(width/175,width/80),random(.05,.1)));  
}

void resetgame(){
  for(int i = 0;i < 500; i++){
 addSugarplum();
  }
}

void keyPressed(){
   if(key == ' '){
  for(int i = 0;i < 100; i++){
 addSugarplum();
  }    
   } 
}


void draw(){
  background(200);
  
  framesTilFree++;
  

  
  Iterator it = Sugarplums.iterator();
  while(it.hasNext()){
    Sugarplum i = (Sugarplum)it.next();
    i.move();
    i.draw();
  }  



}

void mouseMoved(){
  Iterator it = Sugarplums.iterator();
  while(it.hasNext()){
    Sugarplum i = (Sugarplum)it.next();
    i.tx = mouseX;
    i.ty = mouseY;
  }  
  framesTilFree = 0;
}






class Sugarplum{
  float x,y;
  float angle = -HALF_PI;
  float SIZE = 20;
  float tx,ty;
  float SPEED = 2;
  float TURNSPEED = .1; 
  float startx,starty;
  float xs,ys;
  
  float flap = .1;
  
  color c = color(0,250,0);
  Sugarplum(float x,float y, color c, float SIZE,float SPEED,float TURNSPEED){
    this.x = x;
    this.y = y; 
    this.tx = x;
    this.ty = y;
    this.c = c;
    this.SIZE = SIZE;
    this.SPEED = SPEED;
    this.TURNSPEED = TURNSPEED;
    this.startx = x;
    this.starty = y;
  }
boolean fall(){
  ys += .1;
  y += ys;
  x += xs;
  if(y > height + SIZE){
     return true; 
  }
  return false;
}



  void draw(){
//if(frameCount % 30 == 0){
  //  println(frameRate);
//}
   noStroke();
    
    pushMatrix();
    translate(x,y);

    rotate(angle);


fill(225);

    pushMatrix();
    float wingangle = 2;// = random(.5,1);
    rotate((-PI/2)-wingangle -sin(flap));
//    translate(0,SIZE/8);
    
    ellipse(0,SIZE/2,SIZE,SIZE);
    
    popMatrix();

    pushMatrix();
    rotate((-PI/2)+wingangle +sin(flap));
//    translate(0,SIZE/6);
    ellipse(0,SIZE/2,SIZE,SIZE);
    popMatrix();


fill(c);
rect(-SIZE/2,-SIZE/2,SIZE,SIZE);
    ellipse(0,0,SIZE*1.5,SIZE);





//eyes

    fill(0);
    pushMatrix();
    translate(0,-SIZE/4);
    rect(-SIZE/8,-SIZE/8,SIZE/4,SIZE/4);
    popMatrix();

    pushMatrix();
    translate(0,SIZE/4);
    rect(-SIZE/8,-SIZE/8,SIZE/4,SIZE/4);
    popMatrix();


    popMatrix();
  }

//float anglespeed = 0;

  void move(){
     flap += SPEED/6;
    
    //if(true) return;
    if( framesTilFree > RESET_TIME){
       tx = startx;
      ty = starty; 
    }

    float dx = (tx -x);
    float dy = ( ty - y);
    float wantangle = atan2(dy, dx);
    float anglediff = (angle - wantangle);  

    anglediff /= PI;
    //this next bit catches the "runaround"
    
    
    if(anglediff > 1){
      anglediff -= 2;
    }
    if(anglediff < -1){
      anglediff += 2;
    }


    if(anglediff > 0){
      //  println(" <-\\");
      angle -= TURNSPEED; 
    } 
    else {
      //  println(" /->");

      angle += TURNSPEED; 
    }

   
   
float           angcos= cos(angle);
float    angsin = sin(angle);
        
    x +=  angcos* SPEED; 
    y += angsin * SPEED; 
 

  }
    
    
  
}



