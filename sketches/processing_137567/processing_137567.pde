
class Star {
float stepx;
float stepy;
float sz;
float minsz;
float maxsz;
float grow;
color[] palette={#FCFF64};
Star (float tx, float ty, float tsz) {

  stepx = tx;
  stepy= ty;
  sz= tsz;
  maxsz= 20;
  minsz=10;
  grow= 0.2;
}

void live() {
  fill(palette[0]);
ellipse (stepx, stepy, sz, sz );
sz= sz +grow;
if (sz > maxsz){
sz=maxsz;
grow= -grow;
}
if (sz < minsz){
sz= minsz;
grow = -grow;
}
}

}

