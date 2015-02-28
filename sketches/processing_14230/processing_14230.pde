
class Grade {

  int p =0;
  int t =20;
  int l =100;


  //construtor
  Grade() {

  }

    
  void linha () {
    strokeWeight (t-(t/2));
    noFill();
    line (p,p,p,l);

    strokeWeight (0);
    fill (0);
    ellipse (p,p,t,t);
    ellipse (p,l,t,t);
  }

  void diagonal () {

    strokeWeight (t-(t/2));
    noFill();
    line (p,p,l,l);

    strokeWeight (0);
    fill (0);
    ellipse (p,p,t,t);
    ellipse (l,l,t,t);
  }

  void curva () {

    strokeWeight (t-(t/2));
    noFill();
    bezier(p,p,p,l,l,l,l,l);

    strokeWeight (0);
    fill (0);
    ellipse (p,p,t,t);
    ellipse (l,l,t,t);
  }

  void canto () {


    strokeWeight (t-(t/2));
    noFill();
    line (p,p,p,l);
    line (p,l,l,l);

    strokeWeight (0);
    fill (0);
    ellipse (p,p,t,t);
    ellipse (p,l,t,t);
    ellipse (l,l,t,t);
  }
  
void trocar (int i,int j) {
    float x = coordX [i];
    float y = coordY [j];
    pushMatrix ();
    translate (x,y);
    //rotate (radians(90));
    diagonal();
    popMatrix ();
    }


}


