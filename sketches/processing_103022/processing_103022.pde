
float r;
float g;
float b;

float x;
float y;

void setup()
{
size(200,200);
smooth();
frameRate(30);
x=width/2;
y=height/2;
}
void draw()
{
background(255);
stroke(0);
fill(x+100,y+200,60);

rect(x,y,10,30); //kaklas  
//koordinates 90,30. nuo visur tiek atitraukti
ellipseMode(CORNERS);
ellipse(x+50-90,y+50-30,x+100-90,y+75-30); // kunas
fill(255);
for (int i=0; i<5; i=i+1)
{
int  ii=i*20; // uodegos "paputimui ant gali curve  koordinatem pakeist lokaluskintamasis
curve(x+i+50-90,y+i+62-30,x+i+50-90,y+i+62-30,x+i+20-90,y+i+50-30,x-ii+30-90,y-ii+100+30); //uodega

}
fill(x+100,y+200,60);
ellipse(x+90-90,y+35-30,x+110-90,y+20-30);  //galva

fill(255); // kas liko vel spalvinam baltai

line(x+60-90,y+60-30,x+60-90,y+100-30); // kojos
line(x+60-90,y-30+100,x+70-90,y-30+100);

line(x+65-90,y-30+60,x+65-90,y-30+90); //virsutine kojos dalis
line(x+65-90,y-30+90,x+70-90,y-30+90); // pedos dalis

line(x+80-90,y-30+60,x+80-90,y-30+100);
line(x+80-90,y-30+100,x+90-90,y-30+100);

line(x+85-90,y-30+60,x+85-90,y-30+90);  //  graziai gaunas su mouseX ir pmouseX
line(x+85-90,y-30+90,x+90-90,y-30+90);

r=random(255);
g=random(255);
b=random(255);
fill(r,g,b);
ellipseMode(CENTER); //akis
ellipse(x+100-90,y+26-30,5,5);

 if (mousePressed == true)
 {
   x+=10;
 }
   else
   {
     x=width/2;
   }
   if (keyPressed == true)
   {
     y+=10;
   }
   else
   {
     y=height/2;
   }

//y=random(height/4,height-height/4);
//x=random(width/4,width-width/4);
}
