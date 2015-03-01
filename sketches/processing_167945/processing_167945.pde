
float px, py, gx, gy, x, y;
float x2, y2; //x=green circle x2=purple circle

float a,s,d,f;

float q,w,e,r;

float z,b,c,v;

PImage lose;
PImage win;
PImage bg;
PImage test;


boolean blue;
boolean purphits;
boolean grnhits;


void setup(){
  
test=loadImage("wow.jpg");  
  lose=loadImage("lose.jpg");
bg=loadImage("bg.jpg");
win=loadImage("win.jpg");


py=700;

a=250;

d=500;

y=250;

y2=500;

q=750;

e=750;

w=125;

r=400;

z=400;

b=750;

c=625;

v=750;
size(750,750);

cursor(CROSS);

blue = false;

purphits = false;

grnhits = false;
}

void draw(){




background(0);

if(!blue){
  
image(bg,0,0);

  fill(#B202BC);
rect(px, py, 50, 50);
 
 
  fill(#02BC25);
rect(gx, gy, 50, 50);  
}
else {
image(lose,0,0);
}
/*else if (grnhits == true) {

  lose=loadImage("lose.jpg");
  image(lose,0,0);
  //blue =true;
      
}

else if (purphits == true) {

  lose=loadImage("lose.jpg");
  image(lose,0,0);
}*/

/*{
  fill(#0805FF);
rect(100, 100, 100, 100);
  
}*/

/*if(y<=750){
    y++;
  } else {
    x=random(750);
    y=0;
  }
*/


 if(x<=750){
    x++;
  } else {
    x=0;
    y=random(750);
  }
  
  if((x+35)>=gx && (x-35)<=gx && (y+35)>=gy && (y-35)<=gy) {
   blue = true;
   // purphits=true;
  }
   
  if((x+35)>=px && (x-35)<=px && (y+35)>=py && (y-35)<=py) {
   //blue = true;
    purphits=true;
  }
   
   if(x2<=750){
    x2++;
  } else {
    x2=0;
    y2=random(750);
  }
   
  if((x2+35)>=px && (x2-35)<=px && (y2+35)>=py && (y2-35)<=py) {
   blue = true;
  // grnhits=true;
  }
   
  if((x2+35)>=gx && (x2-35)<=gx && (y2+35)>=gy && (y2-35)<=gy) {
  // blue = true;
   grnhits=true;
  }
   
   if(s<=750){
    s++;
  } else {
    a=random(750);
    s=0;
  }
  
  if((a+35)>=gx && (a-35)<=gx && (s+35)>=gy && (s-35)<=gy) {
   blue = true;
   // purphits=true;
  }
   
  if((a+35)>=px && (a-35)<=px && (s+35)>=py && (s-35)<=py) {
   //blue = true;
    purphits=true;
  }
   
   if(f<=750){
    f++;
  } else {
    d=random(750);
    f=0;
  }
   
  if((d+35)>=px && (d-35)<=px && (f+35)>=py && (f-35)<=py) {
   blue = true;
  // grnhits=true;
  }
   
  if((d+35)>=gx && (d-35)<=gx && (f+35)>=gy && (f-35)<=gy) {
  // blue = true;
   grnhits=true;
  }
   if(q<=750){
    q--;
  } else {
    w=random(750);
    q=0;
  }
  
  if((q+35)>=gx && (q-35)<=gx && (w+35)>=gy && (w-35)<=gy) {
   blue = true;
   // purphits=true;
  }
   
  if((q+35)>=px && (q-35)<=px && (w+35)>=py && (w-35)<=py) {
   //blue = true;
    grnhits=true;
  }
   
   if(e<=750){
    e--;
  } else {
    e=random(750);
    r=0;
  }
   
  if((e+35)>=px && (e-35)<=px && (r+35)>=py && (r-35)<=py) {
   blue = true;
  // grnhits=true;
  }
   
  if((e+35)>=gx && (e-35)<=gx && (r+35)>=gy && (r-35)<=gy) {
  // blue = true;
   purphits=true;
  }
  
  
   if(b<=750){
    b--;
  } else {
    z=0;
    b=random(750);
  }
  
  if((z+35)>=px && (z-35)<=px && (b+35)>=py && (b-35)<=py) {
   blue = true;
   // purphits=true;
  }
   
  if((z+35)>=gx && (z-35)<=gx && (b+35)>=gy && (b-35)<=gy) {
   //blue = true;
    grnhits=true;
  }
   
   if(v<=750){
    v--;
  } else {
    c=random(750);
    v=0;
  }
   
  if((c+35)>=gx && (c-35)<=gx && (v+35)>=gy && (v-35)<=gy) {
   blue = true;
  // grnhits=true;
  }
   
  if((c+35)>=px && (c-35)<=px && (v+35)>=py && (v-35)<=py) {
  // blue = true;
   purphits=true;
  }
   
  if (grnhits==false && purphits == false){
    fill(#B202BC);//purp
    ellipse(x,y,35,35);

    fill(#B202BC);
    ellipse(a,s,35,35);
    
    fill(#02BC25);
    ellipse(d,f,35,35);

    fill(#02BC25);
    ellipse(x2,y2,35,35);
    
     fill(#B202BC);
    ellipse(q,w,35,35);
    
    fill(#02BC25);
    ellipse(e,r,35,35);
    
    fill(#02BC25);
    ellipse(z,b,35,35);
    
    fill(#B202BC);
    ellipse(c,v,35,35);
  }

if (grnhits == true){
image(win,0,0);
}

if(purphits== true){
image(win,0,0);
}

//if (keyPressed) {
     if (key == 'k'){
      py+=5;
    }  if (key == 'i') {
      py-=5;
    }  if (key == 'j') {
      px-=5;
    }  if (key == 'l') {
      px+=5;
    }
  

//}
//if (keyPressed) {
  
    if (key == 's'){
      gy+=5;
    }
    if (key == 'w') {
      gy-=5;
    }
    if (key == 'a') {
      gx-=5;
    }
    if (key == 'd') {
      gx+=5;
    }
  //}
  

}//last for draw





/*if(mousePressed){

  if(mouseButton == LEFT) {
    fill(#B202BC);
  rect(mouseX-25,mouseY-25, 50,50);
    }
    
    if(mouseButton == RIGHT) {
    fill(#02BC25);
  rect(mouseX-25,mouseY-25, 50,50);
    }
}
*/


