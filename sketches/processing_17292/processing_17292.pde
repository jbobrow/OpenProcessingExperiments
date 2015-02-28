
// This is a branch from Alasdair Turner's Jan 2010 post of Scene-graph L-system tree on open processing at
// http://www.openprocessing.org/visuals/?visualID=7251
// Goal here is to use the general graph in generation visualizations
// Exprexxo   Jan 2011
///-----------------------------------------------------------------------------------

Item axiom;
boolean clicked = false;
int bodies,gens,genage,fillcolor,cred,cgreen,cblue;

void setup()
{
  size(800,800,P3D); bodies=1;gens=3;genage=20;fillcolor=255;
  sphereDetail(8);
  axiom = new Item();
}

void draw()
{
  background(#116611);
  lights();
  noStroke();
  cred=255;cgreen=0;cblue=0;fill(cred,cgreen,cblue);
  translate(width/2, height, -height/2);
  rotateY(frameCount * 0.005);
  axiom.draw();
  if (frameCount < 6) {
    axiom.replace();
  }
  textMode(SCREEN);  fill(255);
  text("   Nodes: "+str(bodies)+", Generations: "+str(gens)+", tree age: "+str(gens*genage)+" @ "+genage+" years per generation. Ends are at appox "
        +str(2011-gens*genage)+"   LEFT CLICK to add another generation", 30,30); //this is the last statement of the draw 
}

void mouseClicked()
{
  if (mouseButton == LEFT) {
    axiom.replace(); axiom.replace(); // this call adds square nodes if ends are round, and round squares if nodes are square, so we call it twice to hide that.
     gens++; 
  }
  else {
    axiom = new Item();
  }
}


