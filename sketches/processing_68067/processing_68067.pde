
float a,b;
void setup()
{
size(320,250);
noFill();
smooth();
}
void draw()
{
background(255);
//ARO AZUL
stroke(0,0,255);
strokeWeight(3);
ellipse(100,100,50,50);

//ARO NEGRO
stroke(0);
strokeWeight(3);
ellipse(160,100,50,50);

//ARO ROJO
/*stroke(255,0,0);
strokeWeight(3);
ellipse(a,b,50,50);
*/
//ARO AMARILLO
stroke(255,255,0);
strokeWeight(3);
ellipse(130,125,50,50);

//ARO VERDE
stroke(0,255,0);
strokeWeight(3);
ellipse(190,125,50,50);

a=random(50,250);
b=random(50,200);
if(a>215&&a<225&&b>95&&b<105)
//if(a==220&&b==100)
{
  noLoop();
  stroke(255,0,0);
  strokeWeight(3);
  ellipse(220,100,50,50);
}
else
{
  //noLoop();
  stroke(255,0,0);
  strokeWeight(3);
  ellipse(a,b,50,50); 
}

}

