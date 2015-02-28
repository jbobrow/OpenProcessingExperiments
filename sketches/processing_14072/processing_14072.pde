
/*                    - fission -
                   - by aashka shah -
                  - new media design -
            - National Institute of Design (2010) -
 ---------------------------------------------------------
*/

int d=0;
int t=1;
int siz=350;
int c=1;
int s=0;
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
  fill(0,500-d);
 
  ellipse(300-d*random(0,c),300-d*random(0,c),siz-d,siz-d);
  ellipse(300-d*random(0,c),300+d*random(0,c),siz-d,siz-d);
  ellipse(300+d*random(0,c),300-d*random(0,c),siz-d,siz-d);
  ellipse(300+d*random(0,c),300+d*random(0,c),siz-d,siz-d);
  
  d=d+t;
  println(d);
  if(d==siz)
  {
    d=0;
  }

}

//void mousePressed()
//{
//  save("fission20.jpg");
//}



