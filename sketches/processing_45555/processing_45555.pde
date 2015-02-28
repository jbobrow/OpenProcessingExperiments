
//number of leading department stores to hospitals
//target 1750
//kmart 1327
//walmart 4393
//hospitals 5008

PImage imgw;
PImage imgk;
PImage imgk2;
PImage imgs;
PImage imgt;
PImage imgh;
PImage imgt2;
int x;
int y;
int walnum;
int knum;
int tnum;
int hnum;
int dnum;
int data [] = {1327,1750,4393,5008,7470};
int ytop[] ={672,630,393,186,177};
int ybot[] ={700,700,700,700,700};
int directiony;

void setup(){
  size(800,800);
  smooth();
  imgw = loadImage ("Walmart.png");
  imgt = loadImage ("targetl.png");
  imgt2 = loadImage ("target.png");
  imgk = loadImage ("kmart.png");
  imgk2 = loadImage("bluelight.png"); 
  walnum=4393;
  knum=1327;
  tnum=1750;
  hnum=5008;
  dnum = 7470;
  directiony= 3;
}

void draw(){
   for (int i = 0; i < data.length; i++){
     image (imgw, 0, 0,400,400);
  //if (dist(mouseX, mouseY, 400,400)< 10);{
    //for(int x = 0 ; x <400; x+=10){
    //for (int y = 0; y<400; y+=10){
    //image (imgw,x,y,10,10);}}}
     image(imgt, 0, 400,200,200);
     image(imgk, 200, 400, 200, 200);
     //rect(700,100,55,700);
     //rect(600,150,55,700);
     fill(0);
     image(imgk2,15,ybot[i],60,60);
     image(imgt2,200,ybot[i],50,50);
     image(imgw,370,ybot[i],50,50);
     if(ybot[i]>ytop[i]);{
       ybot[i]-=3;}
       if(ybot[i]<ytop[i]+180){
         ybot[i]+=3;}
       if (mousePressed){
         println(mouseY);}
    }
    for (int i = 0; i < data.length; i++){
       text(data[i], i*180+20,height-data[i]/10);
    }   
}//}

