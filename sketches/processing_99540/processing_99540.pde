
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

int qx;
int qy;

void setup(){
  size(650, 400);
  rectMode(CENTER);
  f = createFont("Arial",16,true);
  textFont(f);
  a = new Card[numcards];
  for(int y = 0; y < numcards; y++){
    a[y] = new Card(y*30 + 55, 60, (int)random(0, 99));
  }
  _UP = false;
  _SIDE = false;
  _DOWN = false;
  _SORTING = true;
  i = -1;
  k = 0;
}

void shiftdown(){
  Card c = new Card(a[m]);
  for(int j = m; j > i; j--){
    a[j] = new Card(a[j-1]);
  }
  a[i] = new Card(c);
}

void draw(){
  background(255);
  for(int f = 0; f < numcards; f++){
    a[f].carddraw();
  }
  if(_SORTING && i < a.length-1){
    i++;
    m = i;
    for(int j = i+1; j < numcards; j++){
      if(a[j].num < a[m].num){
        m = j;
      }
    }
    if(i != m){
      _DOWN = true;
      _SORTING = false;
      qx = a[i].x;
      qy = a[i].y;
    }
  }
  if(_DOWN){
    if(k < 100){
      k+= 3;
      a[m].y = qy + k;
    }else{
      _DOWN = false;
      _SIDE = true;
      k = 0;
      qy = a[m].y;
    }
  }
  if(_SIDE){
    qx = a[m].x;
    if(k < 30){
      k+= 1;
      for(int q = m-1; q >= i; q--){
        a[q].x+=1;
      }
      println((m-i) + "");
      a[m].x = qx - (m-i);
    }else{
      _SIDE = false;
      _UP = true;
      k = 0;
    }
  }
  if(_UP){
    if(k < 100){
      k+= 3;
      a[m].y = qy - k;
    }else{
      _UP = false;
      _SORTING = true;
      k = 0;
      shiftdown();
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

