
  double[] leftEye;
  double[] rightEye;
  float Lx = 250;
  float Ly = 340;
  float Rx =415;
  float Ry= 340;
 /* void vein (double [] Eye,float CenEyeX,float CenEyeY)
  {
    for(int i = 0; i< Eye.length(); i = i+2)
    {
      for () // 447,240
      line();
    }
    
  }*/
  
  double[] calculateEllipse(float posX, float posY,float h,float w, float ang, int ste)
  {
    int posArr = 0;
    double []pointsAroundEye = new double [ste*2+2];
    double beta=0;
    double sinbeta = Math.sin(beta);
    double cosbeta = Math.cos(beta);
  
  for (float i = 0; i<= 2*PI; i+= 2*PI/ste)
  {
    double alph = i * (Math.PI/PI);
    double sinalpha = Math.sin(alph);
    double cosalpha = Math.cos(alph);
    
    double X = posX + (h * cosalpha *cosbeta - w * sinalpha * sinbeta);
    double Y = posY + (w * cosalpha *sinbeta + w * sinalpha * cosbeta);
    
    pointsAroundEye[posArr] = X;
    posArr ++;
     pointsAroundEye[posArr] = Y;
    posArr ++;
  }
  return pointsAroundEye;
}
void setup()
{
  size(640,480);
  smooth();
  leftEye = calculateEllipse(280,240,220,300,0,15);
  rightEye  = calculateEllipse(447,240,220,300,0,15);
  
}
void draw()
{
fill(255); // Left Eye
strokeWeight(5);
ellipse(280,240,220,300);
strokeWeight(3);
fill(62,36,2);
ellipse(260,300,120,160);
strokeWeight(1);
fill(1);
ellipse(Lx,Ly,45,60);

fill(255); // Right Eye
strokeWeight(5);
ellipse(447,240,220,300);
strokeWeight(3);
fill(62,36,2);
ellipse(425,300,120,160);
strokeWeight(1);
fill(1);
ellipse(Rx,Ry,45,60);

Lx = map(mouseX,0,width,230,300);
Ly = map(mouseY,0,height, 260,330);
Rx = map(mouseX,0,width,395,460);
Ry = map(mouseY,0,height, 260,340);



}

