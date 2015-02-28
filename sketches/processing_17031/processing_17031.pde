
// QR-Code Clock
// von www.lichtbaendiger.de

import com.google.zxing.*;

void setup()
{
  size(450,450,P2D);
  smooth();
}

void draw()
{
  String Uhrzeit;
  background(255);
  translate(width/2,height/2);
  rotate(second()*TWO_PI/60);
  Uhrzeit=nf(hour(),2)+":"+nf(minute(),2)+":"+nf(second(),2);
  QRCodezeichnen(Uhrzeit,-150,-150,300);
}


void QRCodezeichnen(String textstring,int posx,int posy,int breite)
{
  Encoder localQRCodewriter=null;
  QRCode localQRCode=new QRCode();
  ErrorCorrectionLevel ERlevel=null;
  float blockgroesse;

  rectMode(CORNER);
  noStroke();
  fill(0);

  try
  {
    localQRCodewriter.encode(textstring,ERlevel.H, localQRCode);

    blockgroesse=float(breite)/float(localQRCode.getMatrixWidth());

    for(int zaehly=0;zaehly<localQRCode.getMatrixWidth();++zaehly)
    {
      for(int zaehlx=0;zaehlx<localQRCode.getMatrixWidth();++zaehlx)
      {
        if (localQRCode.at(zaehlx,zaehly)==1)
        {
          rect(posx+zaehlx*blockgroesse,posy+zaehly*blockgroesse,blockgroesse+1,blockgroesse+1);
        }
      }
    }
  }
  catch (Exception localException)
  {
    println("Error");
  }
}


