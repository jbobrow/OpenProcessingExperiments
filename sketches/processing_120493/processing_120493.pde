
/*@pjs preload="kyousansyugi.png";*/
PImage img;
//haikei + irosettei
size(400,565);
background(252,0,0);
colorMode(RGB);
smooth();

strokeWeight(5);
stroke(255);
//sankaku_line
for(int r=0;r<=100;r+=40)
{
stroke(155+r);
line(200,r,230,50+r);
line(200,r,170,50+r);
}


fill(28);
noStroke();
//ue_sen_migi
rect(150,0,20,140);
rect(120,0,20,130);
rect(90,0,20,120);
rect(60,0,20,110);
rect(30,0,20,100);
rect(0,0,20,90);
//ue_sen_hidari
rect(230,0,20,140);
rect(260,0,20,130);
rect(290,0,20,120);
rect(320,0,20,110);
rect(350,0,20,100);
rect(380,0,20,90);

//sita_sikaku
for(int s=0; s<=400; s+=20)
  {
   rect(s,520,15,100);
  }

//sita_yokobou
rect(0,513,400,5);

//gazou
imageMode(CENTER);
img = loadImage("kyousansyugi.png");     
tint(233, 233, 0);    
image(img, 200, 400); 

fill(255);
//hidari_siro_sikaku
for(int b=0;b<=500;b+=30)
{
for(int a=0;a<=500;a+=30)
         {
   if(b<=700){
               rect(150-b-a,150+2*b,20,20);
             }
          }
}
//hidari_yokobou
for(int e=0;e<=600;e+=60)
{
   if(e<=400){
               rect(-e/2,180+e,170,5);
             }
}
//migi_siro_sikaku
for(int c=200;c<=400;c+=30)
{
for(int u=0;u<=400;u+=30)
         {
   if(c>=200){
               rect(c+30+u,2*c-250,20,20);
             }
         }
}
//migiyokobou
for(int d=0;d<=600;d+=60)
         {
   if(d>=200){
               rect(d/2+110,d-60,200,5);
             }
         }


