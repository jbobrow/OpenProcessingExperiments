
int numbercharacter;
characters[] C1;



void setup(){
  noSmooth();
 // frameRate(24);
  size(200,600);
  numbercharacter=4;
  C1=new characters[numbercharacter];

 for (int i = 0; i < C1.length; i++) {
  C1[i]= new characters(random(width),random(height),floor(random(0,5)),floor(random(5,14)),random(-PI/4,PI/4));

}
}

void draw(){
  // background(255);
  fill(255,20);
  noStroke();
  rect(0,0,width,height);
   for (int i = 0; i < C1.length; i++) {
  C1[i].display();
  C1[i].move();
 C1[i].check();
  
}

 noFill();
 stroke(1);
  ellipse(mouseX,mouseY,20,20);
  
}

void mousePressed(){

 setup(); 
}


class characters {
  float x,y,angle,b;
  PImage[] zhi=new PImage[5];
  int n,s,X,Y;
  
  
  characters(float xpos,float ypos,int number,int size,float Angle){
    x=xpos;
    y=ypos;
    n=number;
    s=size;
    angle=Angle;
    b=0;
    X=mouseX;
    Y=mouseY;
    zhi[0]=loadImage("zhi.png");
    zhi[1]=loadImage("yong.png");
    zhi[2]=loadImage("xin.png");
    zhi[3]=loadImage("shui.png");
    zhi[4]=loadImage("shan1.png");
//zhi[5]=loadImage("shan.png");
  }
  
  void display(){
    
    imageMode(CENTER);
    pushMatrix();
    translate(x,y);
    rotate(angle);
  image(zhi[n],0,0,200/s,157/s);  
    popMatrix();
    
    //noFill();
 //stroke(1);
  //ellipse(x,y,20,20);
  
filter(BLUR,b);
 //zhi[n].filter(BLUR,b);  
 
  
    
  }
  
  
  void move(){
  angle+=PI/s/3; 
   x=x+random(-5,5);
   y+=s/2;
    if(x>width){
     x=0;
     b=0.3; 
    // zhi[n].filter(BLUR,1);
    }
   if(y>height){
     y=0; 
     b=0.3;
    // zhi[n].filter(BLUR,1);
    }
  }
  
 void check(){
  if (dist(mouseX,mouseY,x,y)<10){
      
      x=x+random(-20,20);
     y=y-random(0,20);
      b=b+0.5;
      }
      if(b>10){
        b=10;
      }
    if(x<0 || x>width){
    x=random(width); 
   
    }
    if(y<0 || y>height){
      y=random(height);
     
    }
    
 } 
  
  
  
  
}


