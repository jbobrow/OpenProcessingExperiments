
PImage bg;
Cracker[] crackers;


void setup (){
  

  
  //background(#000000);
  size(700,700);
  crackers= new Cracker[5];
    for (int i =0;i<crackers.length; i ++){
   crackers[i] = new Cracker(width/2,height/2);
   smooth();
   colorMode(HSB,255,255,100);
     bg =loadImage ("bg.jpg");
     image(bg,0,0);
     

    }
}

void draw() {
  for (int i =0;i<crackers.length; i ++){
    crackers[i].display();
    crackers[i].move();

    //x= x + (600 * directionx);
  //y= y + (.002 * directiony);
  }
}
class Cracker {
  float x, y, a, b, c, directionx,directiony, bg;
  
  //constructooorrr
  Cracker(float xpos,float ypos){
  x=xpos;
  y=ypos;
  a=sqrt(b*b+c*c);
  b=abs(b-c);
  c=abs(a-c);
  directionx=5;
  directiony=5;
  }
  void display(){
     
    
     stroke(random(a,300));
     stroke(#28b9ef);
    line(40,0,b/directiony,1000); //white lines
    for (int i =0;i<50; i ++){
     stroke(#4cb4c0);
     line(mouseX,mouseY,i*200,c*100);//turqouise
     stroke(#317cf7);
     line(mouseX,mouseY,i*189,c*100);//cerulean
     stroke(#000000);
     line(mouseX,mouseY,i*199,c*100);//dark blue
     stroke(random(c,i));
     line(10,0,b*400,20); //more crazy white lines
     
  }
  }
  void move(){
    
    float mx = constrain(mouseX,250,300);
//rect(0,0,width,height);
x = mouseX;
y = mouseY;


    a+= mouseX;
    b+= mouseY;
    c= height/2;
       stroke(#b5309a);   //
    line(mouseX,mouseY,a*15,b*5);//magenta
    stroke(#ed279b);   //
   line(mouseX,mouseY,a*b,y*c);//hotpink
    stroke(#ff3057);   //
   line(mouseX,mouseY,a*17,directiony*21);//magenta
    stroke(#ef28ed);   //
   line(mouseX,mouseY,a*20,c*22);//magenta
    stroke(#ff0078);   //
   line(mouseX,mouseY,a*19,b*230);//magenta
    
     if(x < 0){
  //x +=500;
  directionx=-1;

     }   
     if(y > height){
  //x +=500;
  directiony=1;

     }   

//if (y > height){
  //y +=300;
  //directiony= 600;
 }
}


