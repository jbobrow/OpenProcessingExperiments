
     void setup(){
size(500,600);
}

void draw(){
  
  background(14,49,67);

int w = width/2;
int h = height/2;

int x=0;
int y=0;

noStroke();
smooth();






fill(119,125,137);
arc(w,h-250,340,60,radians(180),radians(360));    //top curve
beginShape();                                    //head shape
vertex((w-170),(h-253));
vertex((w+170),(h-253));
vertex((w+130),(h+200));
vertex((w-130),(h+200));
endShape();

fill(119,125,137);
arc(w,h-250,60,30,radians(180),radians(360));

fill(76,81,85);
ellipse(w,h+200,260,60);

fill(119,125,137);
stroke(0,0,0);
arc (w-60,h-100,60,30,PI,TWO_PI);  //left eye
arc (w+60,h-100,60,30,PI,TWO_PI);  //right eye

stroke(0,0,0);
arc(w,h+60,30,15,radians(190),radians(350));

//make neck
noStroke();
quad(w-12,h+199,w+12,h+199,w+12,height,w-12,height);
stroke(0,0,0);


for (int n=0;n<height;n+=25){
fill(119,125,137);
arc(w,h+200+n,60,30,radians(120),radians(360));
}

for (int n=0;n<height;n+=25){
fill(119,125,137);
arc(w+15,h+199+n,30,10,radians(0),radians(90));
}
//end neck


//gradation left
for(int s=0; s<30; s+=5){
  strokeWeight(2+s/5);
  stroke(120+4*s);
  line((w-120+(s)),h+180-s/2,(w-160+s),h-250-s/4);
}
for(int s=30; s<45; s+=5){
  strokeWeight(20-s/4);
  stroke(255-3*s);
  line((w-120+(s)),h+180-s/2,(w-160+s),h-250-s/4);
}

//gradation right
for(int s=30; s<45; s+=5){
  strokeWeight(20-s/3);
  stroke(200-3*s);
  line((w+100+s),h-265+s/4,(w+60+(s)),h+160+s/4);
}
for(int s=0; s<25; s+=5){
  strokeWeight(8-s/3);
  stroke(80+3*s);
  line((w+145+s),h-255+s/2,(w+105+s),h+170+s/2);
}

//BEGIN EYE TRACKING

if(mouseX<(w-90)){
x=w-30;
y=h-85;
}
if(mouseX>=w-60 && mouseX<=w+60){
x=w-60;
y=h-85;
}
if(mouseX>=w+90){
x=w-80;
y=h-85;
}
if (mouseX>=w-90 && mouseX<w-60){
x=w+(w-mouseX-120);
y=h-85;
}
if (mouseX>=w+60 && mouseX<w+90){
x=w+(w-mouseX);
y=h-85;
}

// END EYE TRACKING

fill(67,168,247);
strokeWeight(2);
stroke(0);
ellipse (x,y,5,5); //left pupil
ellipse (x+120,y,5,5); //right pupil

// CONSTRUCT BLUSH LINES

for(int i=0;i<10;i+=1){   
  int lxi = (w-50-3*i);
  int lxf = (w-47-3*i);
  int lyi = h-80;
  int lyf = h-75;
  
  int rxi = (w+77-3*i);
  int rxf = (w+80-3*i);
  int ryi = h-80;
  int ryf = h-75;
// END CONSTRUCTION, START COLOR wrt MOUSE PROXIMITY  
 int r=119;
 int g=125;
 int b=137;

// blush conditional on mousepress
if(mousePressed){ 
 if((abs(w-mouseX)) <= 50){
   r=240;
   g=12;
   b=27;
 }
 if((abs(w-mouseX)) >50 && abs(w-mouseX)<=100){
   r=198;
   g=52;
   b=91;
 }
 if((abs(w-mouseX)) >100 && abs(w-mouseX)<=170){
   r=144;
   g=82;
   b=98;
 }
 if((abs(w-mouseX)) >170 && abs(w-mouseX)<=200){
   r=124;
   g=89;
   b=98;  
 }
 if((abs(w-mouseX)) >200){
 r=119;
 g=125;
 b=137;  
 }
 
}else{
 r=119;
 g=125;
 b=137;}
  

  stroke(r,g,b);
  strokeWeight(1);
  line(lxi,lyi,lxf,lyf);  //left blush line
  line(rxi,ryi,rxf,ryf);  // right blush line
} 

// END BLUSH LINE COLORATION/CONSTRUCTION

}
                                                
