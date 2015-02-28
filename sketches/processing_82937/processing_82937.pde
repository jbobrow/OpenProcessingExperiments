
void setup()
{size(500,500);

}

void draw()
{
noStroke();
background(#FDFFA5);


fill(#6ED100,80);
rotate(PI/4);
for (int i = 40; i <700; i = i + 20)
for (int j=-700; j<900; j=j+20){
stroke(#1FFF03);
arc(j,i,40,40,PI,PI/2+PI);
arc(j,i+20,40,40,PI,PI/2+PI);
arc(j+20,i,40,40,PI,PI/2+PI);
arc(j+20,i,40,40,PI/2,PI);
}

//3e ligne
//forme 2 en haut à gauche
fill(#108901,80);
rotate(-PI/2);
stroke(#17AF04);
for (int i=20; i <800; i = i + 20)
for (int j=0; j<1000; j=j+20)
{arc(j-20,i,40,40,PI,PI/2+PI);
arc(j-20,i,40,40,PI/2,PI);
arc(j,i,40,40,PI,PI/2+PI);
arc(j-20,i,40,40,0,PI/2);}

//3e ligne
//forme 2 en haut à gauche
fill(#6ED100,50);
rotate(-PI/150);
for (int i=0; i <360; i = i + 20)
for (int j=0; j<2000; j=j+20)
{arc(j-20,i,40,40,PI,PI/2+PI);
arc(j-40,i,40,40,0,PI/2);
arc(j-20,i,40,40,PI,PI/2+PI);
arc(j-20,i,40,40,0,PI/2);}

stroke(#BEFF00,20);
fill(#39BF11,50);
rotate(PI/2);
for (int i = 40; i <600; i = i + 20) 
for (int j=350; j<800; j=j+20)
{arc(j,i,40,40,PI,PI/2+PI);
arc(j,i+20,40,40,PI,PI/2+PI);
arc(j+20,i,40,40,PI,PI/2+PI);
arc(j+20,i,40,40,PI/2,PI);
}
}


