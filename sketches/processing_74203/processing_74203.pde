
int x = 0;
int dir =1;

void setup(){
size(640,480);
 x =0;
}

void draw(){
  background(0);
ellipse(x,200, 50,50);


if (x >width || x <0 ){ // || : or, && : and
  dir = dir * -1;
}


x = x + 10 * dir;

}
