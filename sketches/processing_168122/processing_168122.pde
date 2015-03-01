

void setup ()
{size (600, 600);
background (255);
}
void draw (
){
  float azul = random (255);
  float ama = random (255);
float red = random (255);
line (pmouseX,pmouseY,mouseX, mouseY);

fill(80,80,200);

rect(560,0, 40,60);
fill (#0FC1FF);
rect(560,60, 40,60);fill
(#FAFF0F);
rect(560,120, 40,60);fill
(#C210CB);rect(560,180, 40,60);
fill
(#F2572C);rect(560,240, 40,60);fill
(#ACF22C);rect(560,300, 40,60);fill
(0, 255, 0);rect(560,360, 40,60);fill
(80, 255, 0);rect(560,420, 40,60);fill
(0, 255, 80);rect(560,480, 40,60);
fill (ama,red, azul);
rect (560, 540, 40, 60);
fill (255);
rect (560, 570, 40, 60);


{if (mouseX> 560 && mouseY>0){stroke (80,80,200); strokeWeight(5)  ;}}
{if (mouseX> 560 && mouseY>60){stroke (#0FC1FF); strokeWeight(5) ;}}
{if (mouseX> 560 && mouseY>120){stroke (#FAFF0F); strokeWeight(5) ;}}
{if (mouseX> 560 && mouseY>180 ){stroke (#C210CB); strokeWeight(5) ;}}
{if (mouseX> 560 && mouseY>240 ){stroke (#F2572C); strokeWeight(5) ;}}
{if (mouseX> 560 && mouseY>300 ){stroke (#ACF22C); strokeWeight(5) ;}}
{if (mouseX> 560 && mouseY>360 ){stroke (0, 255, 0); strokeWeight(5) ;}}
{if (mouseX> 560 && mouseY>420 ){stroke (80, 255, 0); strokeWeight(5) ;}}
{if (mouseX> 560 && mouseY>480 ){stroke (0, 255, 80); strokeWeight(5) ;}}
{if (mouseX> 560 && mouseY>480 ){stroke (0, 255, 80); strokeWeight(5) ;}}

{if (mouseX> 560 && mouseY>540 ){stroke (ama,red, azul); strokeWeight(5) ;}}
{if (mouseX> 560 && mouseY>570 ){stroke (255); strokeWeight(40) ;}}
azul=azul+38;
red = red +40;
ama = ama +45;;
;}
