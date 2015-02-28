
PFont f;

Card[] a;
int numcards = 20;

boolean _UP;
boolean _SIDE;
boolean _DOWN;
boolean _SORTING;

int i;
int j;
int k;
int m;

int ix;
int iy;
int jx;
int jy;

void setup(){
  size(650, 400);
  rectMode(CENTER);
  f = createFont("Arial",16,true);
  textFont(f);
  a = new Card[numcards];
  for(int y = 0; y < numcards; y++){
    a[y] = new Card(y*30 + 15, 60, (int)random(0, 99));
  }
  _UP = false;
  _SIDE = false;
  _DOWN = false;
  _SORTING = true;
  i = -1;
  k = 0;
}

void draw(){
  background(255);
  for(int f = 0; f < numcards; f++){
    a[f].carddraw();
  }
  if(_SORTING && i < a.length){
    i++;
    m = i;
    for(j = i+1; j < numcards; j++){
      println("" + i + ", " + j + ", " + m);
      if(a[j].num < a[m].num){
        m = j;
      }
    }
    _DOWN = true;
    _SORTING = false;
    ix = a[i].x;
    iy = a[i].y;
    jx = a[m].x;
    jy = a[m].y;
  }
  if(_DOWN){
    if(k < 100){
      k+= 3;
      a[i].y = iy + k;
      a[m].y = jy + k;
//      waittime(5);
    }else{
      _DOWN = false;
      _SIDE = true;
      iy = a[i].y;
      jy = a[m].y;
      k = 0;
    }
  }
  if(_SIDE){
    if(k < jx - ix){
      k+= 6;
      a[i].x = ix + k;
      a[m].x = jx - k;
//      waittime(5);
    }else{
      _SIDE = false;
      _UP = true;
      ix = a[i].x;
      jx = a[m].x;
      k = 0;
    }
  }
  if(_UP){
    if(k < 100){
      k+= 3;
      a[i].y = iy - k;
      a[m].y = jy - k;
    }else{
      _UP = false;
      _SORTING = true;
      k = 0;
      Card u = new Card(a[i]);
      a[i] = new Card(a[m]);
      a[m] = new Card(u);
    }
  }
}

void waittime(int t){
  int time = millis();
  while(millis() - time < t){}
}

class Card{
  
  int x;
  int y;
  int num;
  
  Card(int num_){
    num = num_;
  }
  
  Card(int x_, int y_, int num_){
    x = x_;
    y = y_;
    num = num_;
  }
  
  Card(Card c){
    this.x = c.x;
    this.y = c.y;
    this.num = c.num;
  }
    
  void carddraw(){
    fill(255, 180, 60);
    stroke(0);
    rect(x, y, 28, 50);
    fill(0);
    text("" + num, x-10, y);
  }
  
}

