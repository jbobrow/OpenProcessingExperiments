
void setup() {
size(480,480);
smooth();

  float p = (1+sqrt(5))/2;//setting p to be phi
  float a = 200;//setting a to height of the envelope  
  float b = p*a;//setting b to p*a which is the length of the envelope
  float c = b-a;//setting c to b-a which is the lenght added by using the golden ratio
  float x = 100;//setting x to horizontal placement of the envelopes top left corner
  float y = 100;//setting y to vertical placement of the envelopes top left corner
  float z = 25;//diameter of circle

strokeWeight(8);//"thikness" of stroke
strokeCap(PROJECT);//squaring the corners

line(x,y,x,y+a);//left line
line(x+b,y,x+b,y+a);//right line
line(x,y,x+b,y);//top line
line(x,y+a,x+b,y+a);//bottom line

strokeCap(ROUND);//rounding corners of snip
//line(x,y,x+(b/2),y+c);//left diagonal low snip
//line(x+b,y,x+(b/2),y+c);//right diagonal low snip
//ellipse(x+(b/2),y+c,z,z);//seal centered at the snip

line(x,y,x+(b/2),y+(a-c));//left diagonal high snip
line(x+b,y,x+(b/2),y+(a-c));//right diagonal high snip

strokeWeight(1);//thikness of stroke around seal
//stroke(255,0,0);//color of the stroke
fill(255,0,0);//coloring seal red
ellipse(x+(b/2),y+(a-c),z,z);//seal centered at the snip
fill(0,255,0);//coloring center of seal green
ellipse(x+(b/2),y+(a-c),z/2,z/2);//drawing center of seal

}

