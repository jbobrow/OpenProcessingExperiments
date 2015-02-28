
APunkt[]  myPunkte;
int amount=5;
int gr=40;
int pitch=55;
PFont font;
int schrankcountRight = 3;
int schrankcountLeft = amount-schrankcountRight;

void setup() {
  size(600, 800);
  font = loadFont("HelveticaCY-Plain-18.vlw");
  myPunkte= new APunkt[amount]; 

  for (int i= 0; i<myPunkte.length; i++) 
  {
    myPunkte[i]= new APunkt();
  }
  bereiteVor();
}

void draw() {
  background(200);
  stroke(255);
  line(width/2,0,width/2,height);
  
    textFont(font, 20);
  fill (160);
text("SCHUBLADE_1", 100, 20);
text("SCHREIBTISCH",400, 20);
  
  for (int i=0; i<myPunkte.length; i++) 
  {
    println(myPunkte[i].idschrankLeft);
    myPunkte[i].update();
    myPunkte[i].render();
  }
}


class APunkt {
  PVector pos, spos;
  PImage bild;
  int idx, idy, idschrankLeft, idschrankRight;
  String label;
  boolean schrank;
  boolean over;
  boolean pressed;
  int col1, col2, col3;
  


  APunkt() {  
    pos= new PVector(0, 0);
    spos= new PVector(pitch, pitch);
    schrank=true;
    col1=0;
    col2=0;
    col3=0;
  }


  Boolean checkOver(float _x, float _y)
  {
    Boolean check = false;
    if (_x > pos.x && _x < pos.x + gr && _y > pos.y && _y < pos.y + gr) {
      check=true;
    }
    else {
      check=false;
    }

    return check;
  }

  void update() {
    if (schrank)
    {
      spos.x=width/4-0.5*gr;
      spos.y=pitch+ idschrankLeft*pitch;
    }
    else
    {
      spos.x =width/4*3-0.5*gr;
      spos.y=pitch+idschrankRight*pitch;
    }

    pos.x=pos.x+0.1*(spos.x-pos.x);
    pos.y=pos.y+0.1*(spos.y-pos.y);
  }

  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y);
     stroke(col1, col2, col3);
    rect(-1, -1, gr+1, gr+1);
    image(bild, 0, 0, gr, gr);
    //fill(255);
    //text(label, 0, pitch);
    popMatrix();
  }
}

void mousePressed() {
  for (int i=0; i<myPunkte.length; i++) {
    APunkt p = myPunkte[i];
    if (p.checkOver(mouseX, mouseY)) {
      if (p.schrank)
      {
        p.schrank = false;

        p.idschrankRight = schrankcountRight;
        println(p.idschrankRight);
        schrankcountRight++;
       for (int j=0; j<myPunkte.length; j++) {
          if(myPunkte[j].idschrankLeft > p.idschrankLeft)myPunkte[j].idschrankLeft--;
        }

        
        schrankcountLeft--;
        
      }
      else
      {
        p.schrank = true;
        for (int j=0; j<myPunkte.length; j++) {
          if(myPunkte[j].idschrankRight > p.idschrankRight)myPunkte[j].idschrankRight--;
        }
        p.idschrankLeft = schrankcountLeft;
        
        schrankcountLeft++;
        schrankcountRight--;
      }
    }
  }
}




void bereiteVor() {
  
  int countLeft = 0;
  int countRight = 0;
  
  myPunkte[0].bild=loadImage("1s.jpg");
  myPunkte[0].schrank=false;
  myPunkte[1].bild=loadImage("2s.jpg");
  myPunkte[1].schrank=true;
  myPunkte[2].bild=loadImage("2m.jpg");
  myPunkte[2].schrank=false;
  myPunkte[3].bild=loadImage("3m.jpg");
  myPunkte[3].schrank=true;
  myPunkte[4].bild=loadImage("4m.jpg");
  myPunkte[4].schrank=false;
  
  for(int i=0; i<myPunkte.length; i++)
  {
   if(myPunkte[i].schrank==true)
   {
    myPunkte[i].idx=1;
    myPunkte[i].idschrankLeft=countLeft;
    countLeft++;
   }
   else
   {
    myPunkte[i].idx=1;
    myPunkte[i].idschrankRight=countRight;
    countRight++;
   }
  }
  
  
  myPunkte[0].col2=100;
  myPunkte[0].col3=200;
  
  //myPunkte[0].label="Schere";

  myPunkte[1].col2=100;
  myPunkte[1].col3=200;
  //myPunkte[1].label="Goldy";
  
 /* myPunkte[2].bild=loadImage("3s.jpg");
  myPunkte[2].idx=2;
  myPunkte[2].idy=0;
 myPunkte[2].col2=100;
  myPunkte[2].col3=200;
  
  myPunkte[3].bild=loadImage("4s.jpg");
  myPunkte[3].idx=3;
  myPunkte[3].idy=0;
  myPunkte[3].col2=100;
  myPunkte[3].col3=200;
  
  myPunkte[4].bild=loadImage("5s.jpg");
  myPunkte[4].idx=0;
  myPunkte[4].idy=1;
  myPunkte[4].col2=100;
  myPunkte[4].col3=200;
  
  myPunkte[5].bild=loadImage("1k.jpg");
  myPunkte[5].idx=0;
  myPunkte[5].idy=3;
  myPunkte[5].col2=255;
  
  myPunkte[6].bild=loadImage("2k.jpg");
  myPunkte[6].idx=1;
  myPunkte[6].idy=3;
  myPunkte[6].col2=255;
  
  myPunkte[7].bild=loadImage("3k.jpg");
  myPunkte[7].idx=2;
  myPunkte[7].idy=3;
  myPunkte[7].col2=255;
  
  myPunkte[8].bild=loadImage("4k.jpg");
  myPunkte[8].idx=3;
  myPunkte[8].idy=3;
  myPunkte[8].col2=255;
  
  myPunkte[9].bild=loadImage("1p.jpg");
  myPunkte[9].idx=0;
  myPunkte[9].idy=5;
  myPunkte[9].col3=255;
  
  myPunkte[10].bild=loadImage("2p.jpg");
  myPunkte[10].idx=1;
  myPunkte[10].idy=5;
  myPunkte[10].col3=255;
  
  myPunkte[11].bild=loadImage("3p.jpg");
  myPunkte[11].idx=2;
  myPunkte[11].idy=5;
  myPunkte[11].col3=255;
  
  myPunkte[12].bild=loadImage("4p.jpg");
  myPunkte[12].idx=3;
  myPunkte[12].idy=5;
  myPunkte[12].col3=255;
  
  myPunkte[13].bild=loadImage("5p.jpg");
  myPunkte[13].idx=0;
  myPunkte[13].idy=6;
  myPunkte[13].col3=255;
  
  myPunkte[14].bild=loadImage("1m.jpg");
  myPunkte[14].idx=0;
  myPunkte[14].idy=8;
  
  */
 /*
  myPunkte[18].bild=loadImage("1st.jpg");
  myPunkte[18].idx=0;
  myPunkte[18].idy=10;
  myPunkte[18].col2=200;
  myPunkte[18].col3=200;
  
  myPunkte[19].bild=loadImage("2st.jpg");
  myPunkte[19].idx=1;
  myPunkte[19].idy=10;
  myPunkte[19].col2=200;
  myPunkte[19].col3=200;
  */
}



