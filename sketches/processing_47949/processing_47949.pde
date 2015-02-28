
public class Coord {
  float px;
  float py;
  int plx; 
  int ply;
  int estado;
  public float rt=0, gt=0, bt=0, r=0, g=0, b=0;
  float altura2 = 28;

  public Coord(float px, float py, int plx, int ply) {
    this.px = px;
    this.py = py;
    this.plx = plx;
    this.ply = ply;
    estado = 0;
  }

  public void setEstado(int estado) {
    this.estado = estado;
  }

  public boolean visitable() {
    return (estado >= 0 );
  }

  public void setColor() {

    if (estado==-2) {
      rt = 0;
      gt = 255;
      bt = 0;
    }
    else if (estado==-3){
      rt = 255;
      gt = 0;
      bt = 0;
    }
    else {
      rt = 0;
      gt = 0;
      bt = 250;
    }



    float ease = .05;
    r+=(rt-r)*ease;
    g+=(gt-g)*ease;
    b+=(bt-b)*ease;
    fill(r, g, b);
  }


  public void dibujar() {


    float altura = 0;
    if (estado>=-2) {
      altura = b/255*25;
      marca();
    } 
    else   if (estado==-3) {
      altura = altura2;

    } 
    setColor();
    pushMatrix();
    translate(px,  py);
    //stroke(.5);
    noStroke();
    box(35, 35, altura);
    popMatrix();
  }

  public void marca() {
    pushMatrix();
    translate(px,  py, 1);
    fill(255);
    rect(0, 0, 10, 10);
    popMatrix();
  }
}






