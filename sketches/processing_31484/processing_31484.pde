
float rawr = 2;
float anchor = 0;
float anchor2 = 500;
int root = 0;


void setup() {
  size (500, 500);
  background (0);
  noStroke ();
}

void draw()
{

        strokeWeight(rawr);
        stroke(35,254,245);
        line (root+200,anchor,300,300);

      strokeWeight(rawr);
      stroke(32,186,231);
      line (root+150,anchor,350,350);

      strokeWeight(rawr);
      stroke(46,146,243);
      line (root+100,anchor,400,400);

    strokeWeight(rawr);
    stroke(32,82,232);
    line (root+50,anchor,450,450);

/*  strokeWeight(rawr);
  stroke(38,35,255);
  line (root,anchor,500,anchor2);
*/  
     strokeWeight(rawr);
     stroke(32,82,232);
    line (root+450,anchor2,50,50);

      strokeWeight(rawr);
      stroke(46,146,243);
      line (root+400,anchor2,100,100);

        strokeWeight(rawr);
        stroke(32,186,231);
        line (root+350,anchor2,150,150);

          strokeWeight(rawr);
          stroke(35,254,245);
          line (root+300,anchor2,200,200);
   
   anchor = 500+2;
   anchor2 = 0-2;



}
