
PFont fontA;
int baseYear = 2010;
color hicolor=color(255,255,0);
color nmcolor=color(100);
int setClock=0;
boolean rectOver1 = false,rectOver2 = false,rectOver3 = false, rectOver4=false;
int rectSize = 30, rectX= 20, rectY=430;
int beginY=480/2-18;
int inisec=second();

void setup(){
size(360,480);
smooth();
background(0);
 fontA = loadFont("Helvetica-Light-12.vlw");
 // Set the font and its size (in units of pixels)
textFont(fontA, 12);
}

void draw(){
  
  update(mouseX, mouseY);
  background(0);
  if(setClock==1){
  generateClock02();
  } else if(setClock==2){
  generateClock03();
  } else if(setClock==3){
  generateClock01(20,380,25);
  } else if(setClock==4){
  generateClock04();
  } else {
  generateClock02();
  }
  
  generateControls();
  
}

void generateClock01(int posx, int posy, int sp){
  textAlign(LEFT);
  generateBars(10, year(),380,posx, posy, 7, 4, baseYear);
  text("Y",posx, posy+sp);
  generateBars(12, month(),380,posx+sp, posy, 7, 4, 0);
  text("M",posx+sp, posy+sp);
  generateBars(31, day(),380,posx+2*sp, posy, 7, 4, 0);
  text("D",posx+2*sp, posy+sp);
  generateBars(24, hour(),380,posx+3*sp, posy, 7, 4, 0);
  text("H",posx+3*sp, posy+sp);
  generateBars(60, minute(),380,posx+4*sp, posy, 7, 4, 0);
  text("M",posx+4*sp, posy+sp);
  generateBars(60, second(),380,posx+5*sp, posy, 7, 4, 0);
  text("S",posx+5*sp, posy+sp);
}

void generateBars(int a, int hl, int mxh, int x, int y, int w, int h, int base){
    strokeCap(ROUND);
    strokeJoin(ROUND);
    float iy=y;
    float iter=mxh/a;
    strokeWeight(h);
    if(base!=0){
      for(int i=base;i<base+a;i++){
      if(i<=hl){
          stroke(hicolor);
      } else { stroke(nmcolor); }
      line(x,iy,x+w,iy);
      iy=iy-iter;
    }
    } else {
      for(int i=0;i<a;i++){
      if(i<=hl-1){
          stroke(hicolor);
      } else { stroke(nmcolor); }
      line(x,iy,x+w,iy);
      iy=iy-iter;
    }
    }
    
}

void generateClock02(){
  textAlign(LEFT);
  nmcolor=color(30);
  generateCircles(60,second(),180,240, 100,10,0);
  generateCircles(60,minute(),180,240, 125,10,0);
  generateCircles(24,hour(),180,240, 150,10,0);
  nmcolor=color(60);
  generateCircles(31,day(),180,240, 175,10,0);
  generateCircles(12,month(),180,240, 200,10,0);
  
  int secmod=100;
  if(second()%2==0){
    secmod=255;
  } else {secmod=100;}
  stroke(secmod,secmod,0);
  noFill();
  ellipse(width/2, height/2, 225,225);
  noStroke();
  
  fill(255,255,0);
  rect(width/2, height/2-8,140,16);
  ellipse(width/2, height/2, 50,50);
  
  fill(255);
  text("S",width/2+46, height/2+5);
  text("M",width/2+58, height/2+5);
  text("H",width/2+71, height/2+5);
  text("D",width/2+84, height/2+5);
  text("M",width/2+95, height/2+5);
  text(year(),width/2+109, height/2+5);
  
}

void generateCircles(int a, int hl, int x, int y, int s, int th, int base){
  
  float rot=round(map(hl,0,a,1,360));
  translate(width/2,height/2);
  rotate(radians(rot));
  
  
  strokeWeight(th);
  stroke(nmcolor);
  noFill();
  ellipse(0, 0, s, s);
  noStroke();
  fill(hicolor);
  ellipse(0+(s/2), 0, th, th);
  
  resetMatrix();
}

void generateClock03(){
  translate(200,-25);
  rotate(radians(45));
  noStroke();
  
  fill(90);
  rect(width/2*-1,height/2-30,width*2,height);
  
  textAlign(CENTER);
  
  float sway=map(second(),0,60,222,3822);
  float mway=map(minute(),0,60,222,3822);
  generateDotBars(60, second(), 355,map(second(),0,60,222,3822),1,6,0);
  //text(second(),325,height/2-13);
  generateDotBars(60, minute(), 295,map(minute(),0,60,222,3822),1,6,0);
  //text(minute(),265,height/2-13);
  generateDotBars(24, hour(), 235,map(hour(),0,60,222,3822),1,6,0);
  //text(hour(),205,height/2-13);
  generateDotBars(calcDaysOfMonth(month(),year()), day(), 175,map(day(),0,60,222,3822),1,6,31);
  //text(day(),145,height/2-13);
  generateDotBars(12, month(), 115,map(month(),0,60,222,3822),1,6,12);
  //text(month(),85,height/2-13);
  generateDotBars(10, year(), 55,map(year(),0,60,222,3822),1,6,baseYear);
  //text(year(),25,height/2-13);
  if(beginY<=480){
  beginY=beginY+2;
  } else {
  beginY=height/2-18;
  }
  fill(30);
  rect(width/2*-1,height/2-5,width*2,height);
  
  translate(width/6,height/2+10);
  
  rotate(radians(270));
 
  fill(220); 
  textAlign(RIGHT);
  text("YEAR",0,0);
  text("MONTH",0,60);
  text("DAY",0,120);
  text("HOUR",0,180);
  text("MINUTE",0,240);
  text("SECOND",0,300);
  resetMatrix();
}

void generateDotBars(int a, int hl, int x, float y, int s, int th, int base){
  
  
  
  float iter=60;
   
  if(base<=400&&base!=0){
      
      int k = 1;
      for(int i=1;i<a+5;i++){
      
      if(k==hl){fill(hicolor);} else {fill(30);}
      text(k,x-30,y-iter*i+5);
      fill(hicolor);
      ellipse(x,y-iter*i, th, th);
      ellipse(x,y-10-iter*i, th/2, th/2);
      ellipse(x,y-20-iter*i, th/2, th/2);
      ellipse(x,y-30-iter*i, th/2, th/2);
      ellipse(x,y-40-iter*i, th/2, th/2);
      ellipse(x,y-50-iter*i, th/2, th/2);
      k++;
      if(k>a){
        k=1;
      }
 
   }
  }
  else if(base>=400){
      int k = base;
      for(int i=base;i<base+15;i++){
      if(k==hl){fill(hicolor);} else {fill(30);}
      text(k,x-30,y-iter*i+5);
      fill(hicolor);
      ellipse(x,y-iter*i, th, th);
      ellipse(x,y-10-iter*i, th/2, th/2);
      ellipse(x,y-20-iter*i, th/2, th/2);
      ellipse(x,y-30-iter*i, th/2, th/2);
      ellipse(x,y-40-iter*i, th/2, th/2);
      ellipse(x,y-50-iter*i, th/2, th/2);
      k++;
      if(k>base+10){
        k=base;
      }
   }
  }
  else {
      int k = 0;
      for(int i=0;i<a+5;i++){
      if(k==hl){fill(hicolor);} else {fill(30);}
      text(k,x-30,y-iter*i+5);
      fill(hicolor);
      ellipse(x,y-iter*i, th, th);
      ellipse(x,y-10-iter*i, th/2, th/2);
      ellipse(x,y-20-iter*i, th/2, th/2);
      ellipse(x,y-30-iter*i, th/2, th/2);
      ellipse(x,y-40-iter*i, th/2, th/2);
      ellipse(x,y-50-iter*i, th/2, th/2);
      k++;
      if(k>a){
        k=0;
      }
   }
  }
}

void generateClock04(){
    strokeJoin(ROUND);
    strokeCap(ROUND);
    strokeWeight(10);
    
    fill(30);
    stroke(30);
    
    rect(60,60,240, 320);
    
    float h=map(hour(),0,23,0,255);
    float m=map(minute(),0,59,0,255);
    float s=map(second(),0,59,0,255);
    
    stroke(h,m,s);
    fill(h,m,s);
    rect(80,80,200,200);
    
    stroke(h,0,0);
    fill(h,0,0);
    rect(80,310,50,50);
    
    int it=80;
    for(int i=0;i<4;i++){
        int di=it+10*i;
        stroke(63*i,0,0);
        fill(63*i,0,0);
        rect(di,300,5,5);
    }
    
    stroke(0,m,0);
    fill(0,m,0);
    rect(width/2-25,310,50,50);
    
    it=width/2-25;
    for(int i=0;i<4;i++){
        int di=it+10*i;
        stroke(0,63*i,0);
        fill(0,63*i,0);
        rect(di,300,5,5);
    }
    
    stroke(0,0,s);
    fill(0,0,s);
    rect(230,310,50,50);
    
    it=230;
    for(int i=0;i<4;i++){
        int di=it+10*i;
        stroke(0,0,63*i);
        fill(0,0,63*i);
        rect(di,300,5,5);
    }
    
}

void generateControls(){
  stroke(100);
  fill(100);
  strokeJoin(ROUND);
  strokeWeight(10);
  
  if(rectOver1) {
    fill(150);stroke(150);
  }
  rect(rectX, rectY, rectSize, rectSize);
  fill(100);stroke(100);
  if(rectOver2) {
     fill(150);stroke(150);
  }
  rect(rectX+50, rectY, rectSize, rectSize); 
 fill(100); stroke(100);
  if(rectOver3) {
     fill(150);stroke(150);
  }
  rect(rectX+100, rectY, rectSize, rectSize);
  fill(100);stroke(100);
  
  if(rectOver4) {
     fill(150);stroke(150);
  }
  rect(rectX+150, rectY, rectSize, rectSize);
  fill(100);stroke(100);
}

boolean overRect(int x, int y, int width, int height) 
{
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

void update(int x, int y)
{
  if ( overRect(rectX, rectY, rectSize, rectSize) ) {
    rectOver1 = true;
  } else {
    rectOver1 = false;
  }
  
  if ( overRect(rectX+50, rectY, rectSize, rectSize) ) {
    rectOver2 = true;
  } else {
    rectOver2 = false;
  }
  
  if ( overRect(rectX+100, rectY, rectSize, rectSize) ) {
    rectOver3 = true;
  } else {
    rectOver3 = false;
  }
  
   if ( overRect(rectX+150, rectY, rectSize, rectSize) ) {
    rectOver4 = true;
  } else {
    rectOver4 = false;
  }
}

void mousePressed()
{
  if(rectOver1) {
    setClock = 1;
  }
  
  if(rectOver2) {
    setClock = 2;
  }
  
  if(rectOver3) {
    setClock = 3;
  }
  
  if(rectOver4) {
    setClock = 4;
  }
}

int calcDaysOfMonth(int cmonth, int cyear){
   int res=0;
   if(cmonth==1||cmonth==3||cmonth==5||cmonth==7||cmonth==8||cmonth==10||cmonth==12){
      res=31;
    } else if(cmonth==4||cmonth==6||cmonth==9||cmonth==11){
      res=30;
    } else if(cmonth==2) {
      if(cyear%4==0){
        res=29;
       }else {
        res=28;
       }
    }
    return res;
}



