
void setup()
{size(500,500);

}

void draw()
{
noStroke();
background(0);


noFill();
rotate(PI/4);
for (int i = 40; i <700; i = i + 20)
for (int j=-500; j<900; j=j+20){
stroke(#C303FF);
arc(j,i,40,40,PI,PI/2+PI);
arc(j,i+20,40,40,PI,PI/2+PI);
arc(j+20,i,40,40,PI,PI/2+PI);
arc(j+20,i,40,40,PI/2,PI);
}

//3e ligne
//forme 2 en haut à gauche
stroke(#2800CB);
noFill();
rotate(-PI/2);
for (int i=40; i <800; i = i + 20)
for (int j=20; j<1000; j=j+20)
{arc(j-20,i,40,40,PI,PI/2+PI);
arc(j-20,i,40,40,PI/2,PI);
arc(j,i,40,40,PI,PI/2+PI);
arc(j-20,i,40,40,0,PI/2);}

//3e ligne
//forme 2 en haut à gauche
stroke(#00A8D8);
noFill();
rotate(-PI/150);
for (int i=40; i <360; i = i + 20)
for (int j=20; j<2000; j=j+20)
{arc(j-20,i,40,40,PI,PI/2+PI);
arc(j-40,i,40,40,0,PI/2);
arc(j-20,i,40,40,PI,PI/2+PI);
arc(j-20,i,40,40,0,PI/2);}

stroke(#FF0011);
rotate(PI/2);
for (int i = 40; i <600; i = i + 20) 
for (int j=350; j<800; j=j+20)
{arc(j,i,40,40,PI,PI/2+PI);
arc(j,i+20,40,40,PI,PI/2+PI);
arc(j+20,i,40,40,PI,PI/2+PI);
arc(j+20,i,40,40,PI/2,PI);
}
}


