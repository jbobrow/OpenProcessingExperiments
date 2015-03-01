

Grid grid;


void setup() {
  size(600, 600,P3D);
  noFill();
  //stroke(255);
  grid = new Grid(20, 30);
}
void draw() {
  //background(0);
  //stroke(255);
  grid.render();
}




class Grid {
  int d;//____________________________________________iloÅ�Ä� podziaÅ�Ã³w
  int o; //____________________________________________odlegloÅ�ci miÄ�dzy punktami
  PVector a, dir;
  ArrayList points = new ArrayList();
  int l =0;


  Grid(int d_, int o_) {
    points.clear();
    d=d_;
    o=o_;

    for (int i=0;i<d*d;++i) {
      points.add(new PVector(i/d*o, i%d*o));
    }
  }
  int di() {
    return d;
  }
  int od() {
    return o;
  }

  void render() {
    //translate(width/2-(d*o/2), height/2-(d*o/2));
    for (int i=0;i<d*d;i++) {
      PVector pr = (PVector)points.get(i);
      a = new PVector(mouseX, mouseY);
      PVector dir = PVector.sub(a, pr);
      dir.normalize();
      dir.div(dist(mouseX, mouseY, pr.x, pr.y)/12);
      dir.limit(.3);
      pr.sub(dir);

      //pr.rotate(radians(abs(dist(0, 0, pr.x, pr.y)/200)));
    }
    for (int i=0;i<d*(d-1)-1;++i) {
      if ((i+1)%d>0) {



        PVector pt = (PVector)points.get(i);
        PVector pt2 = (PVector)points.get(i+d);
        PVector pt3 = (PVector)points.get(i+d+1);
        PVector pt4 = (PVector)points.get(i+1);
        if (pt.dist(pt2)<100 & pt2.dist(pt3)<100 & pt3.dist(pt4)<100 & pt4.dist(pt)<100) {
          noStroke();
          beginShape(QUAD); 
          fill(20,10);   
          vertex(pt.x, pt.y);
          fill(120,10); 
          vertex(pt2.x, pt2.y);
          fill(220,10); 
          vertex(pt3.x, pt3.y);
          fill(120,10); 
          vertex(pt4.x, pt4.y);
          endShape(CLOSE);
        }
        else {
          noFill();
          beginShape(QUAD); 
          fill(255, 0, 0,10);  
          vertex(pt.x, pt.y);
          fill(55, 0, 0,10);           
          vertex(pt2.x, pt2.y);
          fill(55, 0, 0,10);           
          vertex(pt3.x, pt3.y);
          fill(255, 0, 0, 10);           
          vertex(pt4.x, pt4.y);
          endShape(CLOSE);
        }
      }
    }
  }
}

