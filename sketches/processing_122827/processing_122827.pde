
int zwart =0;
int pupil =25;
int eye =40;
int eyebrow =70;
int eyebrows =85;
int dot =90;
int head =110;
int grin =120;
int lijn =140;
int tand =150;
int grijns =155;
int grin2 =160;
int body =170;
int kies =175;
int grijs =184;
int Grijs =185;
int armXhoog =190;
int lijnY =195;
int LIJN =215;
int verticaal =235;
int V =250;
int wit =255;
int Ver =275;
int wenk =285;
int GRIN =295;
int rond =310;
int arm =315;
int streep =330;
int armYlaag =340;
int pols =390;
int figuur =400;
int breed =500;
int lang =600;

void setup()  {
size(breed,lang);
}

void draw(){
background(wit);
stroke(zwart);


line(grijns,armXhoog,dot,armYlaag);  //left arm
line(arm,armXhoog,pols,armYlaag);  //right arm

fill(Grijs,grijs,grijs);
ellipse(verticaal,head,V,tand);  //head

fill(zwart,dot,zwart);
rect(tand,body,body,figuur);  //body

fill(wit);
line(grijns,lijn,arm,lijn);  //horizontal
line(kies,grin,kies,grin2);
line(lijnY,grin,lijnY,grin2);
line(LIJN,grin,LIJN,grin2);
line(verticaal,grin,verticaal,grin2);
line(wit,grin,wit,grin2);
line(Ver,grin,Ver,grin2);
line(GRIN,grin,GRIN,grin2);    //grin

fill(wit);
ellipse(grin2,dot,eye,eye);
ellipse(rond,dot,eye,eye);  //eyes
line(lijn,eyebrow,Grijs,eyebrows);
line(wenk,eyebrows,streep,eyebrow);  //eyebrows

fill(wit,zwart,zwart);
ellipse(grin2,dot,pupil,pupil);
ellipse(rond,dot,pupil,pupil);  //pupils

println("mijn monstertje, pas op! hij bijt");  //druk boodschap af
}
