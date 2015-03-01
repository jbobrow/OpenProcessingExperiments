
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/163845*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
PImage errorscreen;
int[] magentasqx;
int[] magentasqy;
int[] tealsqx;
int[] tealsqy;
int[] bluesqx;
int[] bluesqy;
int[] greensqx;
int[] greensqy;

void setup(){
  size(511,433);
  errorscreen=loadImage("dkcerror.png");
  threestep=0;
  magentasqx=new int[5];
  magentasqy=new int[5];
  tealsqx=new int[5];
  tealsqy=new int[5];
  whitesqx=new int[5];
  whitesqy=new int[5];
  blacksqx=new int[5];
  blacksqy=new int[5];
  bluesqx=new int[5];
  bluesqy=new int[5];
  greensqx=new int[5];
  greensqy=new int[5];
 
  for (i = 0; i < 5; i++) 
  { 
    magentasqx[i]=random(511);
    magentasqy[i]=random(433);
    tealsqx[i]=random(511);
    tealsqy[i]=random(433);
    whitesqx[i]=random(511);
    whitesqy[i]=random(433);
    blacksqx[i]=random(511);
    blacksqy[i]=random(433);
    bluesqx[i]=random(511);
    bluesqy[i]=random(433);
    greensqx[i]=random(511);
    greensqy[i]=random(433);
  }

}
//comments are back woohoo
void draw(){
  background(#FFFFFF);
  noStroke();
  //portrait.filter(THRESHOLD, .45);
  //colorMode(RBG, 255);
  tint(204, 153, 0);
  image(errorscreen,0,0);
  
  //colorMode(HSB, 100);
  if(threestep>=15)
  {
    scale(0.5);
    image(errorscreen,0,300);
    scale(1, 0.4);
    image(errorscreen,350,0);
    scale(0.5,2);
    image(errorscreen,1600,900);
    scale(4,2.5);
    copy(150, 250, 20, 30, 35, 25, 50, 50);
    copy(150, 250, 20, 10, 30, 200, 50, 50);
    copy(130, 230, 10, 30, 400, 200, 30, 30);
    copy(300, 100, 50, 30, 387, 00, 30, 30);
  }
  
  if(threestep>=45)
  {
    fill(255,0,255); //note: draw is a loop
    rect(411,0,100,20);
    rect(magentasqx[0],magentasqy[0],30,28);
    rect(magentasqx[1],magentasqy[1],10,433);
    rect(magentasqx[2],magentasqy[2],100,5);
    rect(magentasqx[3],magentasqy[3],10,433);
    rect(magentasqx[4],magentasqy[4],100,5);
    fill(0,255,255); //note: draw is a loop
    rect(411,10,30,28);
    rect(tealsqx[0],tealsqy[0],30,28);
    rect(tealsqx[1],tealsqy[1],10,433);
    rect(tealsqx[2],tealsqy[2],100,5);
    rect(tealsqx[3],tealsqy[3],10,433);
    rect(tealsqx[4],tealsqy[4],100,5);
    fill(255,255,255); //note: draw is a loop
    rect(441,20,70,28);
    rect(240,315,40,28);
    rect(whitesqx[0],whitesqy[0],30,28);
    rect(whitesqx[1],whitesqy[1],10,433);
    rect(whitesqx[2],whitesqy[2],100,5);
    rect(whitesqx[3],whitesqy[3],10,433);
    rect(whitesqx[4],whitesqy[4],100,5);
    fill(255,255,0); //note: draw is a loop
    rect(blacksqx[0],blacksqy[0],30,28);
    rect(blacksqx[1],blacksqy[1],10,433);
    rect(blacksqx[2],blacksqy[2],100,5);
    rect(blacksqx[3],blacksqy[3],10,433);
    rect(blacksqx[4],blacksqy[4],100,5);
    fill(HSB,255,100,100); 
    rect(bluesqx[0],bluesqy[0],30,28);
    rect(bluesqx[1],bluesqy[1],10,433);
    rect(bluesqx[2],bluesqy[2],100,5);
    rect(bluesqx[3],bluesqy[3],10,433);
    rect(bluesqx[4],bluesqy[4],100,5);
    fill(HSB,25,100,100); 
    rect(greensqx[0],greensqy[0],30,28);
    rect(greensqx[1],greensqy[1],10,433);
    rect(greensqx[2],greensqy[2],100,5);
    rect(greensqx[3],greensqy[3],10,433);
    rect(greensqx[4],greensqy[4],100,5);
  }
  if(threestep>=90)
  {
    for(int i=0; i<=400;i++)
    {
        fill(random(256),random(256),random(256)); //note: draw is a loop
        rect(0,random(433),511,1);    
    }
    
  }
  if(threestep==270)
    threestep=0;
  threestep++;
  
}





