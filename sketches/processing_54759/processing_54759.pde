
int x = 5;
float b = 300;
int y = 12;
float f=12;
PFont myfont;

void setup(){
  size(500,500);
  myfont=loadFont("Fonttt.vlw");
  background (201,238,255);
}

void draw (){
 
 //background(random(255),random(255),255);
  //line(200,200,mouseX,mouseY);
 // fill(0,mouseX,mouseY,mouseX);
  //rect(10,100, mouseX, mouseY);
//ellipse(400,400,b,b);
   
  fill(100,50,20+x,x);
  textFont(myfont);
  textSize(b+20);
  text("$1 BEEF TACOS",365,10+b+x);
  
   
   fill(100,50,20+x,x);
  textFont(myfont);
  textSize(b+20);
  text("Smoke Free Plaza",18,00+b+x);
  
   fill(100,50,20+x,x);
  textFont(myfont);
  textSize(b+20);
  text("Tow Zone",195,60+b+x);
  
    fill(100,50,20+x,x);
  textFont(myfont);
  textSize(b+20);
  text("Mobsters",310,30+b+x);
  
   fill(100,50,10+x,150-b);
  textFont(myfont);
  textSize(b+20);
  text("Glazed Dounuts",110,10+b+x);

   fill(100,50,20+x,x);
  textFont(myfont);
  textSize(b+20);
  text("Tyvek Commercial Wrap",245,60+b+x);
   
  
  fill(50+f,50,100,380-f);
  textFont(myfont);
  textSize(y);
  text("Merchants Bank",110,125+f);
  

    fill(f,50,178,380-f);
  textFont(myfont);
  textSize(y);
  text("Cutting Club",245,140+f);
  
    fill(f,100,178,350-f);
  textFont(myfont);
  textSize(y);
  text("Mobil Fencing",-118,140+f);
  
  
     fill(f,50,178,380-f);
  textFont(myfont);
  textSize(y);
  text("WARNING",365,140+f);
    
  


  fill(100,50,20+x,x);
  textFont(myfont);
  textSize(b+20);
  text("Hooka Smoke + More",460,10+b+x);
}

void mousePressed(){
b = b - 20;
x = x + 10;
y= y+ 50;
f= f+50;
}

