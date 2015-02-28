
float x;
float y;
float x2;
float y2;
float a,b,c;
float directionX;
float directionY;


int speed;
boolean drawing= false;



void setup(){
  background(#410666);
  size(600,405);
  x=0;
  y=0;
  directionX= 5;
  directionY=5.5;
  
}



void draw(){
  
  x += directionX;
  y += directionY;
  
  
  
 smooth();
 
float mx = constrain(mouseX,250,300);
//rect(0,0,width,height);
x = mouseX;
y = mouseY;
x2 = mouseY - directionX;
y2= mouseY*directionY;
x = constrain(x,110,480);
y = constrain(y,110,480);
x2= constrain(x2,128,444);
y2= constrain(y2,143,450);

 



  

  //taken from sketch " "by Linus Rudolph
  a=sqrt(b*b+c*c);
  b=abs(b-c);
  c=abs(a-c);

   
  
  
  //ellipse(mouseX, mouseY,a*a,a*a);
  
  for (int i =0;i<80; i ++){
    stroke(#b5309a);
    line(b*c,x2,i*2,100);//magenta

 }
  for (int i =0;i<100; i ++){
    stroke(#1826d5);
    line(a*a,y2,i*30,200);//blue
  }
   for (int i =0;i<70; i ++){
     stroke(#4cb4c0);
     line(b*c,x2,i*20,400); //turquoise
     
     //smooth();
  stroke(0);

  }
    for (int i =0;i<100; i ++){
      stroke(#ed0944);
    line(a*a,b*c,i*8,400); //hot pink
  //}
  //for (int i =0;i<70; i ++){
    //stroke(#763da5);
    //line(540,0,i*40,500); //purple
  //}
  //for (int i =0;i<99; i ++){
    //stroke(#1826d5);
    //line(430,0,i*40,500); //blue
    
  }
}


void mousePressed(){
  if (mouseButton == LEFT){
   


  }
}

void mouseReleased(){
fill(#000000);
}

void mouseDragged(){
  fill(#111111);
  
  drawing = false;  
  }



