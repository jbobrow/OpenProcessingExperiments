
void setup() {
size(600, 600);

}
PImage cloud= loadImage("cloud.png");
PImage felix= loadImage("felix.png");
PImage bird= loadImage("bird.png");

float x=100;
float y=200;

float speed1=0;
float speed2=0;
float speed3=0;
float speed4=0;
float speed5=0;
float speed6=0;
float speed7=0;
float speed8=0;

float xpos1=random(10,580);
float xpos2=random(10,580);
float xpos3=random(10,580);
float xpos4=random(10,580);
float xpos5=random(10,580);
float xpos6=random(10,580);
float xpos7=random(10,580);
float xpos8=random(10,580);

float ypos1=random(10,580);
float ypos2=random(10,580);
float ypos3=random(10,580);
float ypos4=random(10,580);
float ypos5=random(10,580);
float ypos6=random(10,580);
float ypos7=random(10,580);
float ypos8=random(10,580);

float p1=random(0,0.2);
float p2=random(0,0.2);
float p3=random(0,0.2);
float p4=random(0,0.2);
float p5=random(0,0.2);
float p6=random(0,0.2);
float p7=random(0,0.2);
float p8=random(0,0.2);

float i=0;
float j=0;
float k=0;

int flag1=0;
int flag2=0;
int flag3=0;
int flag4=0;
int flag5=0;
int flag6=0;
int won=0;
float speedmeter=0;



float b1=random(0,0.2);
float b2=random(0,0.2);
float b3=random(0,0.2);
float b4=random(0,0.2);
float b5=random(0,0.2);
float b6=random(0,0.2);


float b_speed1=0;
float b_speed2=0;
float b_speed3=0;
float b_speed4=0;
float b_speed5=0;
float b_speed6=0;


float b_xpos1=random(10,560);
float b_xpos2=random(10,560);
float b_xpos3=random(10,560);
float b_xpos4=random(10,560);
float b_xpos5=random(10,560);
float b_xpos6=random(10,560);


float b_ypos1=random(300,580);
float b_ypos2=random(300,580);
float b_ypos3=random(300,580);
float b_ypos4=random(300,580);
float b_ypos5=random(300,580);
float b_ypos6=random(300,580);


void draw()
{
 
 
 

  clouds();  
  birds();

//ellipse (x, y, 20,20);
image(felix,x,y,73,115);
   if(x<=530 && x>=0)
   {
     if (keyPressed) {
       if (key == 'a' || key == 'A') {
         x=x-6;
       }
       if (key == 'd' || key == 'D') {
         x=x+6;
       }
     }    
   }
   else{
     if(x>530){
       if (key == 'a' || key == 'A') {
         x=x-6;
       }
     }
     if(x<0){
       if (key == 'd' || key == 'D') {
         x=x+6;
       }
     } 
   } 
   speedmeter=b5*50;//30
text("the aim is to break the sound barrier ", 200, 20);  
text("speed( m / s ): "+speedmeter, 10, 60); 
if(speedmeter>340.29){
   won=1;
  text("You reached "+340.29+"m / s",230, 120); 
  text("You Won!",275, 140); 
}  
if(flag1==1 || flag2==1 || flag3==1 || flag4==1 || flag5==1 || flag6==1 && won==0){
  won=0;
  text("GAME OVER",270, 120);  
  
  clouds();  
  birds();
  text("I am sorry Felix :(",263, 100);  
  text("GAME OVER",270, 120); 
  text("You are now a bird, and you can fly forever!",190, 140);  
}  



}





//////////////////////////////////////////////////////////////////////
void clouds(){
 //if(i<=192 && j<=173 && k<=167){
  i=i+0.05;
  j=j+0.05;
  k=k+0.05;
 if(i<192 && j<173 && k<167){
  background(2+i,66+j,87+k);
 }
 else{
    background(194,239,254);
 }

speed1=0;
speed2=0;
speed3=0;
speed4=0;
speed5=0;
speed6=0;
speed7=0;
speed8=0;



speed1=random(0,0.002);
speed2=random(0,0.002);
speed3=random(0,0.002);
speed4=random(0,0.002);
speed5=random(0,0.002);
speed6=random(0,0.002);
speed7=random(0,0.002);
speed8=random(0,0.002);

if(ypos1<0){
ypos1=600;
xpos1=random(10,580);
}

image(cloud,xpos1,ypos1);
ypos1=ypos1- p1;
p1=p1+speed1;
/////////////////////
if(ypos2<0){
ypos2=600;
xpos2=random(10,580);
}

image(cloud,xpos2,ypos2);
ypos2=ypos2- p2;
p2=p2+speed2;
/////////////////////
if(ypos3<0){
ypos3=600;
xpos3=random(10,580);
}

image(cloud,xpos3,ypos3);
ypos3=ypos3- p3;
p3=p3+speed3;
/////////////////////
if(ypos4<0){
ypos4=600;
xpos4=random(10,580);
}

image(cloud,xpos4,ypos4);
ypos4=ypos4- p4;
p4=p4+speed4;
/////////////////////
if(ypos5<0){
ypos5=600;
xpos5=random(10,580);
}

image(cloud,xpos5,ypos5);
ypos5=ypos5- p5;
p5=p5+speed5;
/////////////////////
if(ypos6<0){
ypos6=600;
xpos6=random(10,580);
}

image(cloud,xpos6,ypos6);
ypos6=ypos6- p6;
p6=p6+speed6;

/////////////////////
if(ypos7<0){
ypos7=600;
xpos7=random(10,580);
}

image(cloud,xpos7,ypos7);
ypos7=ypos7- p7;
p7=p7+speed7;
/////////////////////
if(ypos8<0){
ypos8=600;
xpos8=random(10,580);
}

image(cloud,xpos8,ypos8);
ypos8=ypos8- p8;
p8=p8+speed8;
/////////////////////
}

  void birds(){
    b_speed1=0;
    b_speed1=random(0,0.002); 

    if((int(b_ypos1)==310 && (b_xpos1>x-46 && b_xpos1<x+56)) || flag1==1 ){
      flag1=1;
      b_ypos1=y+100;
     b_xpos1=x;
      b1=0;
    }
    if(b_ypos1<0 && b_ypos1!=200){
      b_ypos1=600;
      b_xpos1=random(10,560);
      
    }

    image(bird,b_xpos1,b_ypos1,56,48);
 
    b_ypos1=b_ypos1- b1;
    b1=b1+b_speed1;
   ////////////////////////////////////bird 1 
   
    b_speed2=0;
    b_speed2=random(0,0.002); 

    if((int(b_ypos2)==310 && (b_xpos2>x-46 && b_xpos2<x+56)) || flag2==1 ){
      flag2=1;
      b_ypos2=y+100;
      b_xpos2=x;
      b2=0;
    }
    if(b_ypos2<0 && b_ypos2!=200){
      b_ypos2=600;
      b_xpos2=random(10,560);
      
    }

    image(bird,b_xpos2,b_ypos2,56,48);
 
    b_ypos2=b_ypos2- b2;
    b2=b2+b_speed2;
////////////////////////////////////bird 2 
     
    b_speed3=0;
    b_speed3=random(0,0.002); 

    if((int(b_ypos3)==310 && (b_xpos3>x-46 && b_xpos3<x+56)) || flag3==1 ){
      flag3=1;
      b_ypos3=y+100;
     b_xpos3=x;
      b3=0;
    }
    if(b_ypos3<0 && b_ypos3!=200){
      b_ypos3=600;
      b_xpos3=random(10,560);
      
    }

    image(bird,b_xpos3,b_ypos3,56,48);
 
    b_ypos3=b_ypos3- b3;
    b3=b3+b_speed3;
////////////////////////////////////bird 3 
     
    b_speed4=0;
    b_speed4=random(0,0.002); 

    if((int(b_ypos4)==310 && (b_xpos4>x-46 && b_xpos4<x+56)) || flag4==1 ){
      flag4=1;
      b_ypos4=y+100;
      b_xpos4=x;
      b4=0;
    }
    if(b_ypos4<0 && b_ypos4!=200){
      b_ypos4=600;
      b_xpos4=random(10,560);
      
    }

    image(bird,b_xpos4,b_ypos4,56,48);
 
    b_ypos4=b_ypos4- b4;
    b4=b4+b_speed4;
////////////////////////////////////bird 4 
     
    b_speed5=0;
    b_speed5=random(0,0.002); 

    if((int(b_ypos5)==310 && (b_xpos5>x-46 && b_xpos5<x+56)) || flag5==1 ){
      flag5=1;
      b_ypos5=y+100;
      b_xpos5=x;
      b5=0;
    }
    if(b_ypos5<0 && b_ypos5!=200){
      b_ypos5=600;
      b_xpos5=random(10,560);
      
    }

    image(bird,b_xpos5,b_ypos5,56,48);
 
    b_ypos5=b_ypos5- b5;
    b5=b5+b_speed5;  
////////////////////////////////////bird 5 
     
    b_speed6=0;
    b_speed6=random(0,0.002); 

    if((int(b_ypos6)==310 && (b_xpos6>x-46 && b_xpos6<x+56)) || flag6==1 ){
      flag6=1;
      b_ypos6=y+100;
      b_xpos6=x;
      b6=0;
    }
    if(b_ypos6<0 && b_ypos6!=200){
      b_ypos6=600;
      b_xpos6=random(10,560);
      
    }

    image(bird,b_xpos6,b_ypos6,56,48);
 
    b_ypos6=b_ypos6- b6;
    b6=b6+b_speed6;   
////////////////////////////////////bird 6    
 }





