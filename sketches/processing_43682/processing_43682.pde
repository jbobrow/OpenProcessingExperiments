
int bCount=100;
Blob[] b = new Blob[bCount];

//source http://en.wikipedia.org/wiki/List_of_countries_by_GDP_(nominal)
int[] val = {
  14526550, 
  5878257, 
  5458797, 
  3286451, 
  2562742, 
  2250209, 
  2090314, 
  2055114, 
  1631970, 
  1577040, 
  1479825, 
  1409946, 
  1237363, 
  1034308, 
  1014482, 
  780668, 
  735487, 
  706752, 
  527920, 
  469401, 
  467779, 
  458725, 
  448360, 
  429845, 
  412990, 
  407382, 
  377382, 
  369992, 
  363655, 
  318908, 
  309866, 
  305415, 
  302039, 
  293268, 
  289433, 
  239177, 
  237959, 
  229154, 
  224459, 
  222699, 
  218465, 
  217445, 
  206985, 
  203299, 
  202576, 
  199591, 
  192030, 
  176870, 
  161629, 
  157759, 
  153802, 
  148047, 
  140509, 
  137934, 
  132569, 
  130421, 
  127332, 
  105560, 
  103574, 
  91135, 
  87450, 
  82471, 
  81112, 
  71336, 
  65389, 
  60834, 
  59330, 
  57978, 
  57851, 
  55195, 
  54713, 
  54370, 
  51626, 
  49536, 
  47733, 
  47702, 
  45428, 
  44278, 
  41178, 
  40272, 
  39236, 
  38987, 
  38009, 
  36370, 
  35789, 
  32321, 
  32092, 
  31315, 
  29717, 
  26808, 
  26447, 
  24013, 
  23174, 
  22963, 
  22656, 
  22543, 
  22522, 
  21215, 
  20375, 
  20001, 
  19810,
};
String[] name = {
  "  United States", 
  " China, People's Republic of", 
  "  Japan", 
  "  Germany", 
  "  France", 
  "  United Kingdom", 
  "  Brazil", 
  "  Italy", 
  "  India", 
  "  Canada", 
  "  Russia", 
  "  Spain", 
  "  Australia", 
  "  Mexico", 
  "  Korea, South", 
  "  Netherlands", 
  "  Turkey", 
  "  Indonesia", 
  "  Switzerland", 
  "  Poland", 
  "  Belgium", 
  "  Sweden", 
  "  Saudi Arabia", 
  "  Taiwan (Republic of China)", 
  "  Norway", 
  "  Iran", 
  "  Austria", 
  "  Argentina", 
  "  South Africa", 
  "  Thailand", 
  "  Denmark", 
  "  Greece", 
  "  United Arab Emirates", 
  "  Venezuela", 
  "  Colombia", 
  "  Finland", 
  "  Malaysia", 
  "  Portugal", 
  "  Hong Kong", 
  "  Singapore", 
  "  Egypt", 
  "  Israel", 
  "  Ireland", 
  "  Chile", 
  "  Nigeria", 
  "  Philippines", 
  "  Czech Republic", 
  "  Pakistan", 
  "  Romania", 
  "  Algeria", 
  "  Peru", 
  "  Kazakhstan", 
  "  New Zealand", 
  "  Ukraine", 
  "  Kuwait", 
  "  Hungary", 
  "  Qatar", 
  "  Bangladesh", 
  "  Vietnam", 
  "  Morocco", 
  "  Slovakia", 
  "  Angola", 
  "  Iraq", 
  "  Libya", 
  "  Sudan +   South Sudan", 
  "  Croatia", 
  "  Syria", 
  "  Ecuador", 
  "  Oman", 
  "  Luxembourg", 
  "  Belarus", 
  "  Azerbaijan", 
  "  Dominican Republic", 
  "  Sri Lanka", 
  "  Slovenia", 
  "  Bulgaria", 
  "  Burma", 
  "  Tunisia", 
  "  Guatemala", 
  "  Uruguay", 
  "  Lebanon", 
  "  Uzbekistan", 
  "  Serbia", 
  "  Lithuania", 
  "  Costa Rica", 
  "  Ghana", 
  "  Kenya", 
  "  Yemen", 
  "  Ethiopia", 
  "  Panama", 
  "  Jordan", 
  "  Latvia", 
  "  Cyprus", 
  "  Côte d'Ivoire", 
  "  Bahrain", 
  "  Tanzania", 
  "  Cameroon", 
  "  El Salvador", 
  "  Trinidad and Tobago", 
  "  Turkmenistan", 
  "  Bolivia",
};

void setup() {
  size(900,600 );
  PFont fontA;
  fontA = loadFont("Cochin-20.vlw");
  textFont(fontA, 50);


  background(0);
  smooth();
  colorMode(HSB, 100);
  int btIndex=0;
  int t = 0;
  for (int x=100;x<width-2;x+=50) {
    for (int y=100;y<height-2;y+=50) {
      if(t<3){
       t++;
      x+=90;y+=0; 
      }
      if (btIndex<bCount) {
        b[btIndex]= new Blob(btIndex, x, y, val[btIndex], name[btIndex]);
        btIndex++;
      }
    }
  }

  /*
  for (int i=0;i<bCount;i++) {
   b[i]= new Blob(i, i*10, height/2, random(4)+1);
   }
   */
  noFill();
}

void draw() {
  fill(0, 0, 10, 100);
  rect(0, 0, width, height);

  for (int i=0;i<bCount;i++) {
    b[i].render();
  }
}

class Blob {
  int id=0;
  int val;
  float x;
  float y;
  float r;
  float m=1;
  color c;
  String name;

  public Blob(int id, float x, float y, float r, String name) {
    this.id=id;
    this.x=x;
    this.y=y;
    val=(int)r;
    this.r=map(r, 19810, 14526550, 5, 50);
    m=30/r;
    c=color(random(100)+1, 30, 80);
    this.name=name;
  }

  void render() {
    stroke(255);
    fill(c);
    updatePos(b);
    ellipse(x, y, 2*r, 2*r);
    if (dist(x, y, mouseX, mouseY) <r) {
      text("GDP of"+name+" "+val, 50, 50);
    }
  }
  boolean colide(Blob a, Blob b) {
    float dx = mouseX - a.x;
    float dy = mouseY - a.y;
    float ang = atan2(dy, dx);  

    float xMag = cos(ang);
    float yMag = sin(ang);

    if (dist(a.x+(xMag*a.m), a.y+(yMag*a.m), b.x, b.y) > a.r+b.r) {
      return false;
    }
    else {
      return true;
    }
  }

  void updatePos(Blob[] b) {

    float dx = mouseX - x;
    float dy = mouseY - y;
    float a = atan2(dy, dx);  

    float xMag = cos(a);
    float yMag = sin(a);

    boolean bang=false;

    for (int i=0;i<b.length;i++) {
      if (this.colide(this, b[i]) && b[i].id != this.id) {
        bang=true;
        i=b.length;
      }
    }
    if (x+(xMag*m)-r > 0 && x+(xMag*m)+r<width && !bang) {
      x+=xMag*m;
    }

    if (y+(yMag*m)-r > 0 && y+(yMag*m)+r<height && !bang)
    {
      y+=yMag*m;
    }




    if (keyPressed) {
      println(keyCode);
      if (keyCode==32) {
        m=0;
      }
      else {
        m=(-1)*30/r;
      }
    }
    else {
      m=30/r;
    }
    //line(x, y, x+xMag*10, y+yMag*10);
  }
}


