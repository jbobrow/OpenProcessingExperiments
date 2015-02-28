
class Ball{
  float taille;
  //float transp = random(10);
 //float x = xpos+random(-300,300);
 //float y = ypos+random(-200,200);
  Ball(int itaille){taille = itaille;}
  void affiche( float xpos, float ypos){
    xpos = xpos + ( xspeed * xdirection );
    ypos = ypos + ( yspeed * ydirection );
    if (xpos > width-taille/2 || xpos < taille/2
    ) {
      xdirection *= -1;
    }
    if (ypos > height-taille/2 || ypos < taille/2
    ){
      ydirection *= -1;
    }

  //translate(random(width/5), random(height/5));
translate(width/2,height/2);
  float rr = 0;
  rr= rr+0.2;
  for(rr=0;rr<100;rr++){  color r  = color(rr,100,100,33);
  if(rr>100){rr=0;}

    for(int i=0; i<30; i++)
    { rotate(PI * 0.000667);
      stroke(r);//incrémenter r
      line(xpos/5,ypos/5,random(150),random(180));

    }


        println(xpos);

    }

  }  

 }


