
/*                    - fission -
                       - color -
                   - by aashka shah -
                  - new media design -
            - National Institute of Design (2010) -
 ---------------------------------------------------------
*/

int d=0;
int t=1;
int siz=500;
int c=1;

void setup()
{
  size(600,600);
  smooth();
  frameRate(20);
}

void draw()
{
  background(255);
  ellipseMode(CENTER);
  noStroke();
  fill(255,0+(255-d*0.7),95);
 
  ellipse(300-d*random(0,c),300-d*random(0,c),siz-d,siz-d);
  ellipse(300+d*random(0,c),300+d*random(0,c),siz-d,siz-d);
  
  //fill(255,0+(d*3),95);
  ellipse(300+d*random(0,c),300-d*random(0,c),siz-d,siz-d);
  ellipse(300-d*random(0,c),300+d*random(0,c),siz-d,siz-d);
  d=d+t;
  println(d);
  if(d==siz)
  {
    d=0;
  }

}

//void mousePressed()
//{
//  save("fissionc18.jpg");
//}



