
/**
 *      Made with http://code.google.com/p/lindenb/source/browse/trunk/src/xsl/pubchem2processing.xsl
 *      Author: Pierre Lindenbaum PhD plindenbaum@yahoo.fr
 *      http://plindenbaum.blogspot.com
 */
static final int ATOM_COUNT=49;

static final float array_x[]=new float[]{-1.0624f,-0.1926f,2.4616f,-2.9068f,0.621f,-0.0035f,0.8984f,-1.5992f,-0.6594f,1.4746f,0.5697f,1.2663f,-1.0406f,1.88f,0.5459f,-1.8248f,2.2196f,0.5148f,1.8335f,1.1364f,-3.7848f,-3.2395f,-4.9351f,-2.5399f,1.5948f,1.5945f,-0.0372f,-2.5309f,-1.1865f,0.1964f,-1.5165f,-0.066f,1.4755f,0.7855f,2.5985f,-0.0002f,2.9867f,2.312f,1.0802f,-4.1574f,-3.2447f,-4.3255f,-2.9262f,-5.5678f,-4.6148f,-5.5631f,-2.7809f,-1.4522f,-2.8311};

static final float array_y[]=new float[]{1.9255f,-2.0756f,-4.5862f,1.6411f,-2.2073f,-1.4656f,-3.7309f,-0.2934f,-0.693f,-3.9266f,-1.7401f,-2.9517f,-0.6232f,-3.3703f,-2.4961f,1.1879f,-4.9333f,-0.9572f,-2.6029f,-1.3866f,0.7312f,3.0553f,0.2896f,3.6858f,-1.7188f,-4.1373f,-4.301f,-0.8592f,-0.5986f,-0.0044f,-0.1663f,-2.3585f,-1.9308f,-3.5629f,-5.864f,-0.0001f,-5.1463f,-2.9253f,-0.7582f,1.2483f,-0.137f,3.1734f,3.5585f,-0.4132f,-0.2018f,1.1385f,4.7518f,3.5919f,3.221};

static final float array_z[]=new float[]{3.398f,4.9603f,0.2014f,4.7838f,3.7188f,2.4987f,3.4375f,3.9986f,5.1388f,2.0807f,1.162f,1.0834f,2.6488f,-0.0856f,6.1555f,4.0282f,1.5131f,0.0024f,-1.2504f,-1.179f,5.5151f,4.8984f,4.6696f,6.0586f,3.8837f,4.1797f,3.5062f,4.0616f,6.0948f,5.1994f,1.7844f,7.0548f,6.2861f,6.1251f,1.9113f,0.0001f,-0.4557f,-2.1682f,-2.0652f,6.4075f,5.8928f,4.9775f,3.9766f,5.2214f,3.7461f,4.3781f,6.1202f,5.9687f,7.0063};

static final char array_c[]=new char[]{'o','n','n','n','c','c','c','c','c','c','c','c','c','c','c','c','c','c','c','c','c','c','c','c','h','h','h','h','h','h','h','h','h','h','h','h','h','h','h','h','h','h','h','h','h','h','h','h','h'};

static final int BOUND_COUNT=52;

static final int bound_start[]=new int[]{0,1,1,1,2,2,2,3,3,3,4,4,4,5,5,6,6,6,7,7,7,7,8,8,9,9,10,10,11,12,13,14,14,14,16,17,17,18,18,19,20,20,20,21,21,21,22,22,22,23,23,23};
static final int bound_end[]=new int[]{15,4,8,14,13,16,36,15,20,21,5,6,24,10,12,9,25,26,8,12,15,27,28,29,11,16,11,17,13,30,18,31,32,33,34,19,35,19,37,38,22,39,40,23,41,42,43,44,45,46,47,48};



static final String title= "3981";

float mid_x=0f;
float mid_y=0f;
float mid_z=0f;
float alpha=150;
float zoom=10f;
float zoomAtom=1.0f;

void setup()
  {

  size(
        300,
        300,
        P3D);
  mid_x= center(array_x);
  mid_y= center(array_y);
  mid_z= center(array_z);
 }

void draw()
  {
 lights();
  background(0);

  translate(width / 2, height / 2,0);
  rotateY(map(mouseX, 0, width, 0, TWO_PI));
  rotateZ(map(mouseY, 0, height, 0, -TWO_PI));
 stroke(170, 0, 0);
  for(int i=0;i< BOUND_COUNT;++i)
        {
        line(
                xAngstrom(array_x[bound_start[i]] -mid_x ),
                xAngstrom(array_y[bound_start[i]] -mid_y),
                xAngstrom(array_z[bound_start[i]] -mid_z),
                xAngstrom(array_x[bound_end[i]] -mid_x ),
                xAngstrom(array_y[bound_end[i]] -mid_y ),
                xAngstrom(array_z[bound_end[i]] -mid_z )
                );
        }
 noStroke();
  for(int i=0;i < ATOM_COUNT;++i)
        {
         pushMatrix();
        translate(
                xAngstrom(array_x[i] -mid_x ),
                xAngstrom(array_y[i] -mid_y ),
                xAngstrom(array_z[i] -mid_z )
                );
        fillAtom(array_c[i]);
        sphere(zoomAtom*radiusOf(array_c[i]));
        popMatrix();
        }

  }

float xAngstrom(float x)
        {
        return x*zoom;
        }

int radiusOf(char c)
        {
        switch(c)
                {
                case 'o':case 'O': return 14;
                case 'c':case 'C': return 12;
                case 'h':case 'H': return 6;
                default: return 10;
                }
        }

void fillAtom(char c)
        {
        switch(c)
                {
                case 'o':case 'O': fill(0,0,200,alpha); break;
                case 'c':case 'C': fill(100,100,100,alpha); break;
                case 'h':case 'H': fill(200,200,200,alpha); break;
                case 'n':case 'N': fill(142,142,0,alpha); break;
                case 's':case 'S': fill(142,0,142,alpha); break;
                default: fill(142,142,142,alpha);break;
                }
        }

static float center(final float array[])
 {
   float t=0f;
   for(int i=0;i<  array.length;++i)
     {
     t+=array[i];
     }
   return t/float(array.length);
 }

void keyPressed()
  {
  final float alphaShift=5;
  final float zoomShift=0.5;
  final float zoomAtomShift=0.1;
  switch(key)
        {
        case 'a':case 'A': if(alpha-alphaShift >=0) this.alpha-=alphaShift; break;
        case 'z':case 'Z': if(alpha+alphaShift <=255) this.alpha+=alphaShift; break;
        case 'q':case 'Q': zoom+=zoomShift; break;
        case 's':case 'S':  if(zoom-zoomShift>0) zoom-=zoomShift; break;
        case 'w':case 'W': zoomAtom+=zoomAtomShift; break;
        case 'x':case 'X':  if(zoomAtom-zoomAtomShift >0) zoomAtom-=zoomAtomShift; break;
        default:break;
        }
  }


