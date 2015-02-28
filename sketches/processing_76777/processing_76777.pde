
int a = 1 ;//munber of rays
float pos_x[] = new float[a];
float pos_y[] = new float[a];
float angle[] = new float[a];
float angle1[] = new float[a];
float radius[] = new float[a];
float radius1[] = new float[a];
float al=2000; //alpha value of fills and strokes, colours
int start = 1;
int x = 400;
int y = 300;
int l = 10;
int r = 11;
int z = 0;
float colour = 0;
float thetaL = 0;
float thetaR = 0;
float dx=4+random(4.0);
float dy=4+random(4.0);
PImage b;
PImage c;
void setup (){
  size (900,600,P3D);
  background(0);
  b=loadImage("Logo.jpg");
  c=loadImage("instructions.jpg");
}
void draw (){
  imageMode (CORNER);//logo 
  image(b,5,5,150,100);
  imageMode (CORNER);//instruction
  image(c,5,100,150,450); 
  if (x<10||x>width)
  dx=-1*dx;
  if(y<10||y>height)
  dy=-1*dy;   
  pos_x[a-1] = mouseX+ radius[a-1]*cos(angle[a-1]);
  pos_y[a-1] = mouseY+ radius1[a-1]*sin(angle1[a-1]);
  if(keyPressed) {  
      if (keyCode == UP) { 
      if (y<=20)
      {
        y=y;
      }
      else
      {
         y = y - 1;
       //point(x,y);
     // thetaL += 0.025;
      }
    } 
    else if (keyCode == DOWN) { 
      if (y>=580)
      {
        y=y;
      }
      else
      {
      y=y + 1;
       //point(x,y);
      //thetaL -= 0.025;
    }
    }
    else if (keyCode == RIGHT) { 
       if (x>=880)
      {
        x=x;
      }
      else
      {    
      x = x + 1;
      //point(x,y);
      //hetaR += 0.025;
    } 
    }
    else if (keyCode == LEFT) {
        if (x<=160)
      {
        x=x;
      } 
      else
      {        
      x = x - 1;
       //point(x,y);
      //thetaR -= 0.025;
    }
    }
    else if (key == 'a'){    
      z=z+10;          
        }
    else if (key == 's'){   
      z=z-10;
        }  
    }
  int mk = 5;
  noStroke();
  rect(0,0,width,mk);
  rect(0,mk,mk,height-mk*2);
  rect(width,height-mk,-mk,-height+mk*2);
  rect(width,height,-width,-mk);
  stroke(0);
  strokeWeight(2);
  noFill();
  rect(0,0,width-1,height-1);
  rect(mk,mk,width-mk*2-1,height-mk*2-1);  
  for(int i=0; i<a; i++) {
    float randoCol = random(-75,75);
    int rando = int(randoCol);
    float randoAl = random(80,160);
    int randoA = int(randoAl);    
    if(start == 1){
    fill (pos_x[i],pos_y[i],50,al);
    stroke (pos_x[i]+rando,pos_y[i]+rando,50,randoA);
    }  
    } 
  translate(x,y,z); 
  box(10);  
    
  if (keyPressed == true) {
  if(key=='e' || key=='E'){
    fill(0);
    stroke(0);
    rect (mk,mk,width-mk*2-1, height-mk*2-1);
   }
  }
  }
  


