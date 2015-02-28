
//four horsemen

PImage rarity, apple, dash;
float x,y,dX,dY,easing;
int value = 0;
int mode = 1 ; 


void setup(){
 //rainbow background
   for(int i=0;i<width;i++){
     float colorValue=map(i,0,width,0,360);
     stroke(colorValue,100,100);
     line(i,0,i,height);
size(800,600);
rarity= loadImage("rarity.png");
imageMode(CENTER);
apple= loadImage("apple.png");
imageMode(CENTER); }
dash= loadImage("dash.png");
imageMode(CENTER);
x = 0;
y = 0;
easing = .05;
image(rarity,x,y);

}


void draw(){
  //background(255);
  dX = mouseX - x;
  dY = mouseY - y;
  
  if (mode == 1){
    func1();
  }
   else if(mode == 2){
     func2();
   }
   else if(mode==3){
     func3();
   }
}

void func1(){
  x = x + dX*easing;
  y = y + dY*easing;
  image(apple,x,y);
}
  
void func2(){
  x = x + dX*easing;
  y = y + dY*easing;  
  image(rarity,x,y);
}

void func3(){
  x = x + dX*easing;
  y = y + dY*easing;  
  image(dash,x,y);
}
  

void keyPressed(){
  if (key == 'b'){
    mode =2 ;
  }
  else if (key== 'a'){
    mode =1;
  }
  else if(key=='c'){
    mode =3;
  }
}



