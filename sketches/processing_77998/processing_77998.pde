
void setup() {
size(600, 600);


}
PImage bg= loadImage("back.png");
PImage cloud= loadImage("cloud.png");
PImage felix= loadImage("felix.png");
PImage bird= loadImage("bird.png");



float x1=20;
float y1=20;
float x2=35;
float y2=35;
float x3=50;
float y3=50;
float x4=65;
float y4=65;
float x5=85;
float y5=85;
float x6=105;
float y6=105;
float x7=125;
float y7=125;
float x8=145;
float y8=145;
float x9=165;
float y9=165;
float x10=185;
float y10=185;
float x11=205;
float y11=205;
float x12=235;
float y12=235;
float x13=265;
float y13=265;
float x14=295;
float y14=295;
float x15=330;
float y15=330;

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
 
 
// background(bg);


//ellipse (x, y, 20,20);
fill(255,255,1);

textSize(15);
 text("Red color is the age group between 62-89 and the green is between 18-28  ",1, 550);
 text("The size of the circles is proportional to the Internet usage ",1,570);
 text("W-move up, S move down, A move left, D move right ", 1, 590);

fill(255,255,1);
textSize(12);
text("87years,   0.063158usage  ",40, 20);

fill(255,255,1);
textSize(12);
text("62years,   0.221053usage  ",75, 35);

fill(255,255,1);
textSize(12);
text("76years,   0.242105usage  ",100, 50);

fill(255,255,1);
textSize(12);
text("67years,   0.336842usage  ",130, 65);


fill(255,255,1);
textSize(12);
text("18years,   0.357895usage  ",160,85);

fill(255,255,1);
textSize(12);
text("89years,   0.368421usage  ",180, 105);

fill(255,255,1);
textSize(12);
text("80years,   0.378947usage  ",210, 125);

fill(255,255,1);
textSize(12);
text("28years,   0.389474usage  ",240, 145);

fill(255,255,1);
textSize(12);
text("68years,   0.4usage  ",260, 165);

fill(255,255,1);
textSize(12);
text("74years,   0.410526usage  ",280, 185);

fill(255,255,1);
textSize(12);
text("23years,   0.484211usage  ",300, 205);

fill(255,255,1);
textSize(12);
text("63years,   0.484211usage  ",320, 235);

fill(255,255,1);
textSize(12);
text("72years,   0.505263usage  ",350, 265);

fill(255,255,1);
textSize(12);
text("20years,   0.526316usage  ",370, 295);

fill(255,255,1);
textSize(12);
text("21years,   0.726316usage  ",390, 330);



fill(128,1,1);
ellipse(x1, y1, 15, 15);
//image(felix,x,y,73,115);

   if(x1<=600 && x1>=0)
   {
     if (keyPressed) {
       if (key == 'a' || key == 'A') {
         x1=x1-1;
       }
       if (key == 'd' || key == 'D') {
         x1=x1+1;
       }
       if (key == 'w' || key == 'W') {
         y1=y1-1;
       }
       if (key == 's' || key == 'S') {
         y1=y1+1;
       }
     }    
   }
   else{
     if(x1>530){
       if (key == 'a' || key == 'A') {
         x1=x1-1;
       }
     }
     if(x1<0){
       if (key == 'd' || key == 'D') {
         x1=x1+1;
       }
     } 
   } 
ellipse(x2, y2, 18, 18);
//image(felix,x,y,73,115);

   if(x2<=600 && x2>=0)
   {
     if (keyPressed) {
       if (key == 'a' || key == 'A') {
         x2=x2-1.5;
       }
       if (key == 'd' || key == 'D') {
         x2=x2+1.5;
       }
       if (key == 'w' || key == 'W') {
         y2=y2-1.5;
       }
       if (key == 's' || key == 'S') {
         y2=y2+1.5;
       }
     }    
   }
   else{
     if(x2>530){
       if (key == 'a' || key == 'A') {
         x2=x2-1.5;
       }
     }
     if(x2<0){
       if (key == 'd' || key == 'D') {
         x2=x2+1.5;
       }
     } 
   } 
   
   ellipse(x3, y3, 21, 21);
//image(felix,x,y,73,115);

   if(x3<=600 && x3>=0)
   {
     if (keyPressed) {
       if (key == 'a' || key == 'A') {
         x3=x3-2;
       }
       if (key == 'd' || key == 'D') {
         x3=x3+2;
       }
       if (key == 'w' || key == 'W') {
         y3=y3-2;
       }
       if (key == 's' || key == 'S') {
         y3=y3+2;
       }
     }    
   }
   else{
     if(x3>530){
       if (key == 'a' || key == 'A') {
         x3=x3-2;
       }
     }
     if(x3<0){
       if (key == 'd' || key == 'D') {
         x3=x3+2;
       }
     } 
   } 


   ellipse(x4, y4, 24, 24);
//image(felix,x,y,73,115);

   if(x4<=600 && x4>=0)
   {
     if (keyPressed) {
       if (key == 'a' || key == 'A') {
         x4=x4-2.5;
       }
       if (key == 'd' || key == 'D') {
         x4=x4+2.5;
       }
       if (key == 'w' || key == 'W') {
         y4=y4-2.5;
       }
       if (key == 's' || key == 'S') {
         y4=y4+2.5;
       }
     }    
   }
   else{
     if(x4>530){
       if (key == 'a' || key == 'A') {
         x4=x4-2.5;
       }
     }
     if(x4<0){
       if (key == 'd' || key == 'D') {
         x4=x4+2.5;
       }
     } 
   } 
  fill(55,249,28);
   ellipse(x5, y5, 27, 27);
//image(felix,x,y,73,115);

   if(x5<=600 && x5>=0)
   {
     if (keyPressed) {
       if (key == 'a' || key == 'A') {
         x5=x5-3;
       }
       if (key == 'd' || key == 'D') {
         x5=x5+3;
       }
       if (key == 'w' || key == 'W') {
         y5=y5-3;
       }
       if (key == 's' || key == 'S') {
         y5=y5+3;
       }
     }    
   }
   else{
     if(x5>530){
       if (key == 'a' || key == 'A') {
         x5=x5-3;
       }
     }
     if(x5<0){
       if (key == 'd' || key == 'D') {
         x5=x5+3;
       }
     } 
   } 
fill(128,1,1);
   ellipse(x6, y6, 30, 30);
//image(felix,x,y,73,115);

   if(x6<=600 && x6>=0)
   {
     if (keyPressed) {
       if (key == 'a' || key == 'A') {
         x6=x6-3.5;
       }
       if (key == 'd' || key == 'D') {
         x6=x6+3.5;
       }
       if (key == 'w' || key == 'W') {
         y6=y6-3.5;
       }
       if (key == 's' || key == 'S') {
         y6=y6+3.5;
       }
     }    
   }
   else{
     if(x6>530){
       if (key == 'a' || key == 'A') {
         x6=x6-3.5;
       }
     }
     if(x6<0){
       if (key == 'd' || key == 'D') {
         x6=x6+3.5;
       }
     } 
   } 
  
   ellipse(x7, y7, 33, 33);
//image(felix,x,y,73,115);

   if(x7<=600 && x7>=0)
   {
     if (keyPressed) {
       if (key == 'a' || key == 'A') {
         x7=x7-4;
       }
       if (key == 'd' || key == 'D') {
         x7=x7+4;
       }
       if (key == 'w' || key == 'W') {
         y7=y7-4;
       }
       if (key == 's' || key == 'S') {
         y7=y7+4;
       }
     }    
   }
   else{
     if(x7>530){
       if (key == 'a' || key == 'A') {
         x7=x7-4;
       }
     }
     if(x7<0){
       if (key == 'd' || key == 'D') {
         x7=x7+4;
       }
     } 
   } 
  fill(55,249,28);
   ellipse(x8, y8, 36, 36);
//image(felix,x,y,73,115);

   if(x8<=600 && x8>=0)
   {
     if (keyPressed) {
       if (key == 'a' || key == 'A') {
         x8=x8-4.5;
       }
       if (key == 'd' || key == 'D') {
         x8=x8+4.5;
       }
       if (key == 'w' || key == 'W') {
         y8=y8-4.5;
       }
       if (key == 's' || key == 'S') {
         y8=y8+4.5;
       }
     }    
   }
   else{
     if(x8>530){
       if (key == 'a' || key == 'A') {
         x8=x8-4.5;
       }
     }
     if(x8<0){
       if (key == 'd' || key == 'D') {
         x8=x8+4.5;
       }
     } 
   } 
fill(128,1,1);
   ellipse(x9, y9, 39, 39);
//image(felix,x,y,73,115);

   if(x9<=600 && x9>=0)
   {
     if (keyPressed) {
       if (key == 'a' || key == 'A') {
         x9=x9-5;
       }
       if (key == 'd' || key == 'D') {
         x9=x9+5;
       }
       if (key == 'w' || key == 'W') {
         y9=y9-5;
       }
       if (key == 's' || key == 'S') {
         y9=y9+5;
       }
     }    
   }
   else{
     if(x9>530){
       if (key == 'a' || key == 'A') {
         x9=x9-5;
       }
     }
     if(x9<0){
       if (key == 'd' || key == 'D') {
         x9=x9+5;
       }
     } 
   } 
  
    ellipse(x10, y10, 42, 42);
//image(felix,x,y,73,115);

   if(x10<=600 && x10>=0)
   {
     if (keyPressed) {
       if (key == 'a' || key == 'A') {
         x10=x10-5.5;
       }
       if (key == 'd' || key == 'D') {
         x10=x10+5.5;
       }
       if (key == 'w' || key == 'W') {
         y10=y10-5.5;
       }
       if (key == 's' || key == 'S') {
         y10=y10+5.5;
       }
     }    
   }
   else{
     if(x10>530){
       if (key == 'a' || key == 'A') {
         x10=x10-5.5;
       }
     }
     if(x10<0){
       if (key == 'd' || key == 'D') {
         x10=x10+5.5;
       }
     } 
   } 
fill(255,255,0);
   ellipse(x11, y11, 45, 45);
//image(felix,x,y,73,115);

   if(x11<=600 && x11>=0)
   {
     if (keyPressed) {
       if (key == 'a' || key == 'A') {
         x11=x11-6;
       }
       if (key == 'd' || key == 'D') {
         x11=x11+6;
       }
       if (key == 'w' || key == 'W') {
         y11=y11-6;
       }
       if (key == 's' || key == 'S') {
         y11=y11+6;
       }
     }    
   }
   else{
     if(x11>530){
       if (key == 'a' || key == 'A') {
         x11=x11-6;
       }
     }
     if(x11<0){
       if (key == 'd' || key == 'D') {
         x11=x11+6;
       }
     } 
   } 

   ellipse(x12, y12, 48, 48);
//image(felix,x,y,73,115);

   if(x12<=600 && x12>=0)
   {
     if (keyPressed) {
       if (key == 'a' || key == 'A') {
         x12=x12-6.5;
       }
       if (key == 'd' || key == 'D') {
         x12=x12+6.5;
       }
       if (key == 'w' || key == 'W') {
         y12=y12-6.5;
       }
       if (key == 's' || key == 'S') {
         y12=y12+6.5;
       }
     }    
   }
   else{
     if(x12>530){
       if (key == 'a' || key == 'A') {
         x12=x12-6.5;
       }
     }
     if(x12<0){
       if (key == 'd' || key == 'D') {
         x12=x12+6.5;
       }
     } 
   } 
    
   fill(128,1,1); 
   ellipse(x13, y13, 51, 51);
//image(felix,x,y,73,115);

   if(x13<=600 && x13>=0)
   {
     if (keyPressed) {
       if (key == 'a' || key == 'A') {
         x13=x13-7;
       }
       if (key == 'd' || key == 'D') {
         x13=x13+7;
       }
       if (key == 'w' || key == 'W') {
         y13=y13-7;
       }
       if (key == 's' || key == 'S') {
         y13=y13+7;
       }
     }    
   }
   else{
     if(x13>530){
       if (key == 'a' || key == 'A') {
         x13=x13-7;
       }
     }
     if(x13<0){
       if (key == 'd' || key == 'D') {
         x13=x13+7;
       }
     } 
   } 
   
   fill(55,249,28);
   ellipse(x14, y14, 54, 54);
//image(felix,x,y,73,115);

   if(x14<=600 && x14>=0)
   {
     if (keyPressed) {
       if (key == 'a' || key == 'A') {
         x14=x14-7.5;
       }
       if (key == 'd' || key == 'D') {
         x14=x14+7.5;
       }
       if (key == 'w' || key == 'W') {
         y14=y14-7.5;
       }
       if (key == 's' || key == 'S') {
         y14=y14+7.5;
       }
     }    
   }
   else{
     if(x14>530){
       if (key == 'a' || key == 'A') {
         x14=x14-7.5;
       }
     }
     if(x14<0){
       if (key == 'd' || key == 'D') {
         x14=x14+7.5;
       }
     } 
   } 

  
   ellipse(x15, y15, 57, 57);
//image(felix,x,y,73,115);

   if(x15<=600 && x15>=0)
   {
     if (keyPressed) {
       if (key == 'a' || key == 'A') {
         x15=x15-8;
       }
       if (key == 'd' || key == 'D') {
         x15=x15+8;
       }
       if (key == 'w' || key == 'W') {
         y15=y15-8;
       }
       if (key == 's' || key == 'S') {
         y15=y15+8;
       }
     }    
   }
   else{
     if(x15>530){
       if (key == 'a' || key == 'A') {
         x15=x15-8;
       }
     }
     if(x15<0){
       if (key == 'd' || key == 'D') {
         x15=x15+8;
       }
     } 
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

 




