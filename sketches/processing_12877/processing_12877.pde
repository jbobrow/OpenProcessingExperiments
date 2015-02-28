
class agente_{

  float sitio;
  float uno= .01;
  float xx_,xx1_;
  float yy_,yy1_;
  float dx_,dx1_;
  float dy_,dy1_;
  int tressecenta = 360;
  float direccion_ = radians(tressecenta);
  float fibo = numeroFibo ();
  float velocidad_ = random (2);
  color col = col ();

  agente_(float x_, float y_ ){
    xx_ = x_;
    yy_ = y_;

  }
  void mover_(){

    direccion_= direccion_+sitio;
    sitio =noise (-1.01, 1.01);
    dx_ = velocidad_ +random (-( sin(direccion_+noise( -tressecenta,tressecenta))+random (-uno,uno)) , + ( sin(direccion_+noise( tressecenta))+random (-uno,uno)));
    dy_ = velocidad_ * cos(direccion_ *noise( tressecenta))+random (-uno,uno);

    dx_ = random (-dx_, dx_);
    dy_ = random (-dy_, dy_);



    yy_ = yy_ + dy_ ;
    xx_ = xx_ +dx_;



    if (xx_>=width  || yy_>=height  ){
      xx_= random (width);
      yy_=  0;

    }

  }

  void dibujar_(){

    pushMatrix();
    translate(xx_,yy_);
    rotate (TWO_PI );
    smooth ();
    fill  ( (col));
    noStroke ();
   //stroke (0);
    ellipse (0,0,fibo, fibo);
    //fill  ( 0);
    //noStroke ();
    //ellipse (0,0,fibo/3, fibo/3);
    smooth ();
    stroke (col);
    line (mouseX, mouseY,pmouseX, pmouseY);
    popMatrix ();
 if (keyPressed ){
   if (key == 'r' || key == 'R'){
  xx_ = random(0);
  yy_ = height;
  fill (255);
    rect (0,0,width, height);
}}

  }


}
color col (){

  return arraycolor [int (random (arraycolor.length))];
}


float numeroFibo (){
  return fibonacci[int ( random (fibonacci.length))];
}



