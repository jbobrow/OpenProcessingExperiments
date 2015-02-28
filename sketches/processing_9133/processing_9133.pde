
void motif(int i, int j, float largeurCase, float hauteurCase)
{
  //float dt = (millis() - tTriangleDebut) ; 
  smooth();

  
  fill(255,133,0);
  for(int a=0;a<largeurCase;a = a+10)
  {
    stroke(a,0,0);
    //   stroke(255,0,0);
    line(a,0,a,hauteurCase-10);
  }
  for(int a=0;a<largeurCase;a = a+10)
  {
    stroke(a,0,0);
    //   stroke(255,0,0);
    line(0,a,largeurCase-10,a);
  }
    fill(0);
    noStroke();
  rect(largeurCase-140,hauteurCase-50,110,35);
  fill(255);
  textFont(myFont, 15);
  text("Processing",110,180);
  text("Paris",110,165);
  textFont(myFont, 40);
  text("'10",60,180);
  //Automatic Triangle
  noStroke();
  fill(255,random(133));
  triangle(random(largeurCase),random(hauteurCase),random(largeurCase),random(hauteurCase),random(largeurCase),random(hauteurCase));

  fill(255);
  ellipse(largeurCase/2,hauteurCase/2,niveauSonore,niveauSonore);
  fill(0);
  ellipse(largeurCase/2,hauteurCase/2,niveauSonore/2,niveauSonore/2);
  fill(133);
  ellipse(random(largeurCase),random(hauteurCase),niveauSonore/2,niveauSonore/2);
  fill(200);
  ellipse(random(largeurCase),random(hauteurCase),niveauSonore/2,niveauSonore/2);

  /*if (dt >=1)
   {
   tTriangleDebut = millis();
   triangleX = random(largeurCase);
   triangleY = random(hauteurCase);
   }
   triangle(triangleX,triangleY,triangleX,triangleY,triangleX,triangleY);*/
}




