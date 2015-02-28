
// Based on 'Falling Sand' by Jill Jackson
// http://www.openprocessing.org/visuals/?visualID=326

PImage nextBuffer; 
//boolean[] changed; 
 
void setup() { 
  size(400, 600); 
  nextBuffer = createImage(width, height, RGB); 
//  changed = new boolean[width*height]; 
  background(black); 
  loadPixels(); 
  arraycopy(pixels, nextBuffer.pixels); 
  updatePixels(); 
} 

int black = #000000, //black = blank 
brick = #BFBEB1, //brick = brick 
fire = #FF0000, //fire = fire 
water = #0000FF, //water = water 
plant = #22FF33, //plant = plant 
steam = #95EAEA, //steam = steam 
fodder = #866213, //fodder = fodder 
sand = #FFFF00, //sand = sand 
glass = #D3CBCB, //glass = glass 
ice = #FFFFFF, //ice = ice 
uber = #8B27AA, //uber = uber 
torch = #71130E, //torch = torch 
waterfall = #5572E3, //waterfall = waterfall 
mud = #996633, //mud = mud 
dirt = #CC9900; //dirt = dirt 
 
int col = black; 
int penSize = 16; 
 
void keyPressed() { 
  if(key >= '1' & key <= '9') { 
    penSize = (int)pow(2, key-'1')+1; 
  } 
  switch(key) { 
  case 'z': 
    col = black; 
    break; 
  case 'r': 
    col = fire; 
    break; 
  case 'b': 
    col = water; 
    break; 
  case 'g': 
    col = plant; 
    break; 
  case 'l': 
    col = steam; 
    break; 
  case 'y': 
    col = sand; 
    break; 
  case 'w': 
    col = ice; 
    break; 
  case 'p': 
    col = uber; 
    break; 
  case 'o': 
    col = dirt; 
    break; 
  default: 
    break; 
  } 
} 
 
int x, y; 
int val; 
int mx, my; 
int dx, dy; 
int counter, counter2; 
int newForm; 
int enumVal; 
int g; 
void draw() { 
  loadPixels(); 
  arraycopy(pixels, nextBuffer.pixels); 
/*  for(int a = 0; a < pixels.length; a++) { 
    if(pixels[a] != nextBuffer.pixels[a]) { 
      nextBuffer.pixels[a] = pixels[a]; 
      changed[a] = true; 
    } 
  }*/ 
  g = 0; 
  for(x = 0; x < width; x++) { 
    for(y = 0; y < height; y++) { 
//      if(changed[y*width+x]) { 
      val = getAt(x, y); 
      if(val != black) { //if there is something there, then prepare everything 
//        g++; 
        dy = counter = counter2 = 0; 
        dx = (int)random(-2, 2); 
        newForm = val; 
    
//-------------------------------------------------
//-------------------------------------------------  
    if(val == sand) { //sand 
          g++; 
          dy = (int)random(2, 5);
          for(mx = -1; mx < 2; mx++) { 
            for(my = -1; my < 2; my++) { 
              if(mx != 0 | my != 0) {
                enumVal = getAt(x+mx, y+my); 
                if(enumVal == sand) {
                  dx -= mx; 
                }
              } 
            } 
          }
        }//end of sand 
        
      
//-------------------------------------------------
//------------------------------------------------- 
        
               setAt(x+dx, y+dy, x, y, newForm); 
      }//end of checking when something is there 
//      }//end of changed 
    }//end of y loop 
  }//end of x loop 
  arraycopy(nextBuffer.pixels, pixels); 
/*  for(int a = 0; a < pixels.length; a++) { 
    pixels[a] = nextBuffer.pixels[a]; 
//    changed[a] = nextChanged[a]; 
  //  nextChanged[a] = false; 
    changed[a] = false; 
  } 
/*  for(int a = 0; a < changed.length; a++) { 
    if(changed[a]) pixels[a] = #231698; 
    else pixels[a] = black; 
  }*/ 
  updatePixels(); 
  if(mousePressed) { 
    fill(col); 
    noStroke(); 
    ellipse(mouseX, mouseY, penSize, penSize); 
/*    loadPixels(); 
    arraycopy(pixels, nextBuffer.pixels); 
    updatePixels();*/ 
  } 
//  println(frameRate+", "+g); 
}//end of draw 
 
 
int bounds(int a, int l, int h) { 
  return a > h ? h : a < l ? l : a; 
} 
 
int getAt(int x, int y) { 
  if(y < 0 | y >= height | x < 0 | x >= width) return black; 
  return pixels[y*width+x]; 
} 
 
int neut = -27345; 
int swap = -2454; 
int[][] convTable =  { 
//---------brick-------fire-------water-------plant-------steam-------fodder-------sand-------glass-------ice-------uber-------torch-------waterfall-------mud-------dirt 
/*brick*/ {neut,       neut,     brick,      brick,      brick,      brick,       brick,     neut,       brick,    neut,      neut,       neut,           neut,     neut}, 
/*fire*/  {brick,      neut,      neut,      neut,       neut,      neut,       neut,     neut,      neut,    neut,      neut,       neut,           neut,     neut}, 
/*water*/ {brick,      neut,     neut,       neut,      neut,       neut,        neut,      neut,       neut,     neut,     neut,      neut,           neut,     neut}, 
/*plant*/ {brick,      neut,      neut,      neut,       neut,       neut,        neut,      neut,       neut,     neut,     neut,       neut,          neut,     neut}, 
/*steam*/ {brick,      neut,     neut,       neut,       neut,       neut,        neut,      neut,       neut,    neut,      neut,      neut,      neut,     neut}, 
/*fodder*/{brick,      neut,      neut,       neut,       neut,       neut,        neut,      neut,       neut,     neut,      neut,       neut,           neut,     neut}, 
/*sand*/  {brick,      neut,     neut,       neut,       neut,       neut,        neut,      neut,       neut,     neut,      neut,       neut,           neut,     neut}, 
/*glass*/ {neut,       neut,     neut,       neut,       neut,       neut,        neut,      glass,      neut,    neut,     neut,      neut,           neut,     neut}, 
/*ice*/   {brick,      neut,     neut,       neut,       neut,      neut,        neut,      neut,       neut,     neut,      neut,      neut,          waterfall,neut}, 
/*uber*/  {neut,       neut,      neut,      neut,      neut,       neut,        neut,      neut,       neut,     neut,      neut,       neut,           neut,     neut}, 
/*torch*/ {neut,       neut,      neut,       neut,       neut,      neut,        neut,     torch,      neut,    neut,      neut,      neut,           dirt,     neut}, 
/*wfall*/ {neut,       neut,      neut,       neut,      neut,  neut,        neut, neut,  neut,neut,      neut,  neut,           neut,neut}, 
/*mud*/   {neut,       neut,      neut,       neut,       neut,       neut,        neut,      neut,       neut,neut,      neut,       neut,      neut,     neut}, 
/*dirt*/  {neut,       neut,      neut,        neut,       neut,       neut,        neut,      neut,       neut,     neut,      neut,       neut,            neut,     neut} 
}; 
 
int[] elementsIndex = {   
  brick, fire, water, plant, steam, fodder, sand, glass, ice, uber, torch, waterfall, mud, dirt 
}; 
 
int findIndexOfElement; 
int elementsIndexLength = elementsIndex.length; 
int findIndexOfElement(int e) { 
  if(e == black) return -1; 
  for(findIndexOfElement = 0; findIndexOfElement < elementsIndexLength; findIndexOfElement++) { 
    if(e == elementsIndex[findIndexOfElement]) return findIndexOfElement; 
  } 
  return -1; 
} 
 
int at, nbat; 
int conv; 
int ind; 
void setAt(int mx, int my, int x, int y, int newForm) { 
  if(newForm == black) { 
    setBuf(x, y, black); 
    return; 
  } 
  if(my < 0 | my >= height | mx < 0 | mx >= width | (mx==x && my==y)) { 
    setBuf(x, y, newForm); 
    return; 
  } 
  nbat = nextBuffer.pixels[my*width+mx]; 
  if(newForm == nbat) return; 
  if(nbat == black) { 
    setBuf(x, y, black); 
    setBuf(mx, my, newForm); 
    return; 
  } 
  if(ind < 0) return; 
  conv = convTable[findIndexOfElement(newForm)][findIndexOfElement(nbat)]; 
  if(conv == swap) { 
    setBuf(x, y, nbat); 
    setBuf(mx, my, newForm); 
  } 
  else if(conv != neut) { 
    setBuf(mx, my, conv); 
  } 
} 
 
void setAt(int mx, int my, int newForm) { 
  if(my < 0 | my >= height | mx < 0 | mx >= width) 
    return; 
  if(nextBuffer.pixels[my*width+mx] == black) { 
    setBuf(mx, my, newForm); 
    return; 
  } 
  conv = convTable[findIndexOfElement(newForm)][findIndexOfElement(nextBuffer.pixels[my*width+mx])];   
  if(conv != neut & conv != swap) 
    setBuf(mx, my, conv); 
} 
 
void setAt(float mx, float my, float x, float y, int newForm) { 
  setAt(int(mx), int(my), int(x), int(y), newForm); 
} 
 
void setAt(float mx, float my, int newForm) { 
  setAt(int(mx), int(my), newForm); 
} 
 
int lx, ly; 
void setBuf(int x, int y, int f) { 
  nextBuffer.pixels[y*width+x] = f; 
/*  for(lx = x-1; lx < x+2; lx++) { 
    for(ly = y-1; ly < y+2; ly++) { 
      if(ly*width+lx >= 0 & ly*width+lx < 400*400) 
        nextChanged[ly*width+lx] = true; 
    } 
  }*/ 
} 


