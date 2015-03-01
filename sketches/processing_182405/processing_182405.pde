
float x = random(0, 900); 
float y = random(0, 900);
float x2 = x;
float y2 = y;
float x3 = x;
float y3 = y;
float cutright = 900; 
float cutleft = 150; 
boolean cutr = true;
boolean cutl = false;
boolean contracting = true; 


void setup() { 
  background(0, 0, 0); 
  size(900, 900);
} 



void draw() { 
  fill(0,0,0,8);
  rect(0,0,width,height);
  stroke((900/y)*255,(x/900)*255,(y/900)*255);
  line(x,y,x2,y2); 
  line(x,y,x3,y3); 
  line(x2,y2,x3,y3);
  

  if (x >= cutright) {  
    cutr = true;
    cutl = false;
    if (contracting == true) {
      cutleft = (cutleft + (cutright*0.2));
    } 

    if (contracting == false) {
      cutleft = (cutleft - (cutright * 0.1));
    }
    fill((900/y)*255,(x/900)*255,(y/900)*255,200);
    rect(0,0,cutleft,height);
    x3 = x; 
    y3 = y; 
  } 
  if (x <= cutleft) {
    cutr = false;
    cutl = true; 
    if (contracting == true) {
      cutright = cutright * 0.9;
    }
    if (contracting == false) {
      cutright = cutright * 1.1;
    }
    fill((900/y)*255,(x/900)*255,(y/900)*255,200);
    rect(cutright,0,width,height);
    x2 = x;
    y2 = y; 
  }

  if (cutr == true) { 

    x = x - 10;
    y = y - 2;
  } 

  if (cutl == true) {

    x = x + 7; 
    y = y - 1;
  } 


  if (y <= 0) {
    y = height;
    y2 = height; 
    y3 = height; 
   
  } 
  if (cutleft >= cutright || cutright <= cutleft) {
    contracting = false; 
  }
  if (cutleft <= 0 || cutright >= 900) {
  contracting = true; 
  } 
} 

